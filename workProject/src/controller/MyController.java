package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MemberDao;
import model.PointDao;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PointDao pointDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","home");
		return mav;
	}
	
	@RequestMapping("/goods")
	public ModelAndView goods() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","goods");
		return mav;
	}
	
	@RequestMapping("/purchases")
	public ModelAndView purchases() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","purchases");
		return mav;
	}
	
	// 포인트부분
	@RequestMapping("/point/plist")
	public ModelAndView plist(HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/plist");
			if(email != null){
				mav.addObject("list",pointDao.selectpoint(email));
				mav.addObject("pointsum",pointDao.selectpointsum(email));
				System.out.println(mav);
			}
		return mav;
	}
	
	@RequestMapping("/point/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/charge");
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
		mav.setViewName("t_my");
		String point = ((String)map.get("point")).replace(",", "");
		map.put("point", point);
		if(session.getAttribute("login") != null){
			String str = (String)map.get((String)map.get("pay"));
			if(str.equals("null")){
				mav.addObject("section","point/charge");
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
	
	@RequestMapping("/point/clist")
	public ModelAndView clist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/clist");
			if(session.getAttribute("login") != null){
				String email = (String)session.getAttribute("login");
				mav.addObject("list",pointDao.selectdeposit(email));
				System.out.println(mav);
			}
			
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
			mav.setViewName("t_my");
			mav.addObject("section","point/withdraw");
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
				mav.setViewName("t_my");
				mav.addObject("section","point/withdraw");
				mav.addObject("alert", true);
			}
		}
		return mav;
	}
	
	//출금 내역
	@RequestMapping("/point/wlist")
	public ModelAndView wlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/wlist");
			String email = (String)session.getAttribute("login");
			if(email != null){
				mav.addObject("list", pointDao.selectwithdraw(email));
			}
			
		return mav;
	}
	
	
	// 설정 부분
	@RequestMapping("/settings/account")
	public ModelAndView settings() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","settings/account");
		return mav;
	}
	@RequestMapping("/settings/profile")
	public ModelAndView profile() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","settings/profile");
		return mav;
	}
	@RequestMapping("/settings/password")
	public ModelAndView password() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","settings/password");
		return mav;
	}
	@RequestMapping("/settings/bank")
	public ModelAndView bank() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","settings/bank");
		return mav;
	}
	
	
}







