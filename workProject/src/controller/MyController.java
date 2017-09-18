package controller;

import java.io.File;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MemberDao;
import model.MyDao;
import model.PointDao;
import model.PostDao;
import model.LibraryDAO;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PointDao pointDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	PostDao postDao;
	
	@Autowired
	LibraryDAO lDao;
	
	@Autowired
	MyDao myDao;
	
	@Autowired
	ServletContext application;
	
	
	@RequestMapping("/home")
	public ModelAndView home(@RequestParam Map map, HttpSession session) {
			map.put("email", (String)session.getAttribute("login"));
			map.put("first", 1);
			map.put("last", 2);
		List<Map> listAll = lDao.likelist(map);
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("my_home");
			mav.addObject("listAll", postDao.sublist(listAll));
		return mav;
	}
	
	@RequestMapping("/library/postgood")
	public ModelAndView goods(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("library_postgood");
			map.put("type", "like");
			
			//목록에 표시할 포스트 수
			int pc = 12;
			
			//현재 페이지
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//불러올 리스트의 시작과 끝
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			
			if(email != null){
				map.put("email", email);
				System.out.println(map);
				mav.addObject("list",lDao.List(map));
			}
			
			//리스트 밑에 페이지수
			int eSize = 5;
			int p1 = lDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//화살표
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
		return mav;
	}
	
	@RequestMapping("/library/purchases")
	public ModelAndView purchases(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("library_purchases");
			map.put("type", "buy");
			
			//목록에 표시할 포스트 수
			int pc = 12;
			
			//현재 페이지
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//불러올 리스트의 시작과 끝
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			
			if(email != null){
				map.put("email", email);
				System.out.println(map);
				mav.addObject("list",lDao.List(map));
			}
			
			//리스트 밑에 페이지수
			int eSize = 5;
			int p1 = lDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//화살표
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
			
		return mav;
	}
	
	// 포인트부분
	@RequestMapping("/point/plist")
	public ModelAndView plist(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_plist");
			
			//목록에 표시할 포스트 수
			int pc = 5;
			
			//현재 페이지
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//불러올 리스트의 시작과 끝
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			map.put("type", "point");
			
			if(email != null){
				map.put("email", email);
				mav.addObject("list",pointDao.selectpoint(map));
				mav.addObject("pointsum",pointDao.selectpointsum(email));
			}
			
			//리스트 밑에 페이지수
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//화살표
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
		return mav;
	}
	
	@RequestMapping("/point/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_charge");
			String[] cards = "농협,국민은행,우리은행,하나은행,신한은행,외환은행,씨티은행,우체국,부산은행,SC은행".split(",");
			String[] banks = "산업은행,기업은행,국민은행,외환은행,수협,농협,우리은행,SC은행,씨티은행,대구은행,부산은행,광주은행,제주은행,전분은행,경남은행,새마을금고,신협,우체국,하나은행,신한은행".split(",");
			String[] telecoms = "SKT,KT,LGU+,LGU+(알뜰폰)".split(",");
			mav.addObject("cards",cards);
			mav.addObject("banks",banks);
			mav.addObject("telecoms",telecoms);
		return mav;
	}
	
	@RequestMapping("/point/chargeExec")
	public ModelAndView chargeExec(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String point = ((String)map.get("point")).replace(",", "");
		map.put("point", point);
		mav.setViewName("point_charge");
		if(session.getAttribute("login") != null){
			String str = (String)map.get((String)map.get("pay"));
			if(str.equals("null")){
				mav.addObject("alert",true);
			}else{
				mav.setViewName("redirect:/my/point/clist");
				map.put("email", (String)session.getAttribute("login"));
				map.put("paymentoption", str);
				switch ((String)map.get("pay")) {
				case "card":
					map.put("pay", "카드결제");
					break;
				case "untouched":
					map.put("pay", "무통장입금");
					break;
				case "phone":
					map.put("pay", "휴대폰결제");
					break;
				}
				pointDao.pointcharge(map);
			}
		}
		
		return mav;
	}
	
	//충전 신청 리스트
	@RequestMapping("/point/clist")
	public ModelAndView clist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_clist");
			mav.addObject("section","point/clist");
			
			//목록에 표시할 포스트 수
			int pc = 5;
			
			//현재 페이지
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//불러올 리스트의 시작과 끝
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			map.put("type", "deposit");
			
			if(session.getAttribute("login") != null){
				String email = (String)session.getAttribute("login");
				map.put("email", email);
				
				mav.addObject("list",pointDao.selectdeposit(map));
			}
			
			//리스트 밑에 페이지수
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//화살표
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
		return mav;
	}
	
	//포인트 결제 취소
	@RequestMapping("/point/delete")
	@ResponseBody
	public String delete(@RequestParam Map map,HttpSession session) throws JsonProcessingException {
		HashMap result = new HashMap<>();
		String choose = (String)map.get("type");
		boolean rst = false;
		switch (choose) {
		case "chargeCancel":
			rst = pointDao.chargeCancel((String)map.get("num"));
			result.put("rst", rst);
			break;
		case "withdrawCancel":
			rst = pointDao.withdrawCancel((String)map.get("num"));
			result.put("rst", rst);
			break;
		}
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}
	
	//출금 신청 
	@RequestMapping("/point/withdraw")
	public ModelAndView withdraw(HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_withdraw");
			String email = (String)session.getAttribute("login");
			if(email != null){
				Map map = new HashMap<>();
				map.put("email", email);
				mav.addObject("info",memberDao.emailCheck(map));
				mav.addObject("pointsum",pointDao.selectpointsum(email));
			}
		return mav;
	}
	
	//출금 신청 실행
	@RequestMapping("/point/withdrawExec")
	public ModelAndView withdrawExec(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("login");
		map.put("email", email);		
		
		if(session.getAttribute("login") != null){
			boolean result = pointDao.withdraw(map);
			if(result){
				mav.setViewName("redirect:/my/point/wlist");
			}else{
				mav.setViewName("point_withdraw");
				mav.addObject("alert", true);
			}
		}
		return mav;
	}
	
	//출금 내역
	@RequestMapping("/point/wlist")
	public ModelAndView wlist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_wlist");
			String email = (String)session.getAttribute("login");
			
			//목록에 표시할 포스트 수
			int pc = 5;
			
			//현재 페이지
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//불러올 리스트의 시작과 끝
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			map.put("type", "withdraw");
			
			if(email != null){
				map.put("email", email);
				mav.addObject("list", pointDao.selectwithdraw(map));
			}
			
			//리스트 밑에 페이지수
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//화살표
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);			
			
		return mav;
	}
	
	
	// 설정 부분
	@RequestMapping("/settings/account")
	public ModelAndView settings(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_account");
			mav.addObject("email",info.get("EMAIL"));
			mav.addObject("certified",info.get("CERTIFIED"));
		return mav;
	}
	@RequestMapping("/settings/certified1")
	public ModelAndView certified1 () {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_certified1");
		return mav;
	}
	@RequestMapping("/settings/certified2")
	public ModelAndView certified2() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_certified2");
		return mav;
	}
	
	@RequestMapping("/settings/profile")
	public ModelAndView profile(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_profile");
			mav.addObject("info",info);
		return mav;
	}
	
	@RequestMapping("/settings/profileExec")
	public ModelAndView profilExec(@RequestParam Map map, @RequestParam(name = "image") MultipartFile f, HttpSession session) {
		try {
			String my =  (String)session.getAttribute("login");
			
			if(f.getOriginalFilename().length() > 0) {
				File dir = new File(application.getRealPath("/images/profile"));
				if(!dir.exists()) {
					dir.mkdirs();
				}
					
				File dst = new File(dir, my+".png");
				f.transferTo(dst);
				
				System.out.println("realPath => "+dir);
				
			}
			
			map.put("image", my+".png");
			map.put("email", my);
			
			String str = myDao.profileUp(map);
			
			System.out.println("uploadExec = " + str);

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/my/settings/profile");
		return mav;
	}
	

	
	@RequestMapping("/settings/password")
	public ModelAndView password() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_password");
		return mav;
	}
	
	@RequestMapping("/settings/passwordExec")
	public ModelAndView passwordExec(@RequestParam Map map, HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		String my =  (String)session.getAttribute("login");
		String dbpw = (String)info.get("PASSWORD");
		
		if(dbpw.equals(map.get("password")) && map.get("newpw").equals(map.get("newpw_ck")) ) {
			map.put("email", my);
			String str = myDao.pwchange(map);
			System.out.println("pwchange => "+str);
		}
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/my/settings/password");
		return mav;
	}
	
	@RequestMapping("/settings/bank")
	public ModelAndView bank(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_bank");
			mav.addObject("info",info);
		return mav;
	}
	
	@RequestMapping("/settings/bankExec")
	public ModelAndView bankExec(@RequestParam Map map, HttpSession session) {
		String my =  (String)session.getAttribute("login");
		
		map.put("email", my);
		String str = myDao.bank(map);
		System.out.println("bankExec = " + str);
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/my/settings/bank");
		mav.setViewName("redirect:/my/settings/bank");

		return mav;
	}
	
	@RequestMapping("/settings/drop")
	public ModelAndView drop( ) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_drop");
		return mav;
	}
	
}











