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
		List<Map> listLike = lDao.likelist(map);
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("my_home");
			mav.addObject("listLike", postDao.sublist(listLike));
		return mav;
	}
	
	@RequestMapping("/library/postgood")
	public ModelAndView goods(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("library_postgood");
			map.put("type", "like");
			
			//紐⑸줉�뿉 �몴�떆�븷 �룷�뒪�듃 �닔
			int pc = 12;
			
			//�쁽�옱 �럹�씠吏�
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//遺덈윭�삱 由ъ뒪�듃�쓽 �떆�옉怨� �걹
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			
			if(email != null){
				map.put("email", email);
				System.out.println(map);
				mav.addObject("list",postDao.sublist(lDao.likelist(map)));
			}
			
			//由ъ뒪�듃 諛묒뿉 �럹�씠吏��닔
			int eSize = 5;
			int p1 = lDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//�솕�궡�몴
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
			
			//紐⑸줉�뿉 �몴�떆�븷 �룷�뒪�듃 �닔
			int pc = 12;
			
			//�쁽�옱 �럹�씠吏�
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//遺덈윭�삱 由ъ뒪�듃�쓽 �떆�옉怨� �걹
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			
			if(email != null){
				map.put("email", email);
				System.out.println(map);
				mav.addObject("list",lDao.List(map));
			}
			
			//由ъ뒪�듃 諛묒뿉 �럹�씠吏��닔
			int eSize = 5;
			int p1 = lDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//�솕�궡�몴
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
			
		return mav;
	}
	
	// �룷�씤�듃遺�遺�
	@RequestMapping("/point/plist")
	public ModelAndView plist(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_plist");
			
			//紐⑸줉�뿉 �몴�떆�븷 �룷�뒪�듃 �닔
			int pc = 5;
			
			//�쁽�옱 �럹�씠吏�
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//遺덈윭�삱 由ъ뒪�듃�쓽 �떆�옉怨� �걹
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
			
			//由ъ뒪�듃 諛묒뿉 �럹�씠吏��닔
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//�솕�궡�몴
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
			String[] cards = "�냽�삊,援�誘쇱��뻾,�슦由ъ��뻾,�븯�굹���뻾,�떊�븳���뻾,�쇅�솚���뻾,�뵪�떚���뻾,�슦泥닿뎅,遺��궛���뻾,SC���뻾".split(",");
			String[] banks = "�궛�뾽���뻾,湲곗뾽���뻾,援�誘쇱��뻾,�쇅�솚���뻾,�닔�삊,�냽�삊,�슦由ъ��뻾,SC���뻾,�뵪�떚���뻾,��援ъ��뻾,遺��궛���뻾,愿묒＜���뻾,�젣二쇱��뻾,�쟾遺꾩��뻾,寃쎈궓���뻾,�깉留덉쓣湲덇퀬,�떊�삊,�슦泥닿뎅,�븯�굹���뻾,�떊�븳���뻾".split(",");
			String[] telecoms = "SKT,KT,LGU+,LGU+(�븣�쑑�룿)".split(",");
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
					map.put("pay", "移대뱶寃곗젣");
					break;
				case "untouched":
					map.put("pay", "臾댄넻�옣�엯湲�");
					break;
				case "phone":
					map.put("pay", "�쑕���룿寃곗젣");
					break;
				}
				pointDao.pointcharge(map);
			}
		}
		
		return mav;
	}
	
	//異⑹쟾 �떊泥� 由ъ뒪�듃
	@RequestMapping("/point/clist")
	public ModelAndView clist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_clist");
			mav.addObject("section","point/clist");
			
			//紐⑸줉�뿉 �몴�떆�븷 �룷�뒪�듃 �닔
			int pc = 5;
			
			//�쁽�옱 �럹�씠吏�
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//遺덈윭�삱 由ъ뒪�듃�쓽 �떆�옉怨� �걹
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
			
			//由ъ뒪�듃 諛묒뿉 �럹�씠吏��닔
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//�솕�궡�몴
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);
		return mav;
	}
	
	//�룷�씤�듃 寃곗젣 痍⑥냼
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
	
	//異쒓툑 �떊泥� 
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
	
	//異쒓툑 �떊泥� �떎�뻾
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
	
	//異쒓툑 �궡�뿭
	@RequestMapping("/point/wlist")
	public ModelAndView wlist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_wlist");
			String email = (String)session.getAttribute("login");
			
			//紐⑸줉�뿉 �몴�떆�븷 �룷�뒪�듃 �닔
			int pc = 5;
			
			//�쁽�옱 �럹�씠吏�
			int np = 1;
			if(map.get("np") != null){
				np = Integer.parseInt((String)map.get("np"));
			}
			mav.addObject("np", np);
			
			//遺덈윭�삱 由ъ뒪�듃�쓽 �떆�옉怨� �걹
			int e = np*pc;
			int s = e-pc+1;		
			map.put("first", s);
			map.put("last", e);
			map.put("type", "withdraw");
			
			if(email != null){
				map.put("email", email);
				mav.addObject("list", pointDao.selectwithdraw(map));
			}
			
			//由ъ뒪�듃 諛묒뿉 �럹�씠吏��닔
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
			int p = p1 / pc;
			p = p1 % pc != 0 ? p+1: p;
			mav.addObject("page", p);
			
			//�솕�궡�몴
			int from = (np-1)*eSize;
			int to = np*eSize;
			if(to > p){
				to = p;
			}
			mav.addObject("from",from);
			mav.addObject("to",to);			
			
		return mav;
	}
	
	
	// �꽕�젙 遺�遺�
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











