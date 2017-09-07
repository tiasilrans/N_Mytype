package controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	ObjectMapper objMapper;
	
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
	public ModelAndView plist() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/plist");
		return mav;
	}
	@RequestMapping("/point/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/charge");
			String[] cards = "카드를 선택해주세요.,농협,국민은행,우리은행,하나은행,신한은행,외환은행,씨티은행,우체국,부산은행,SC은행".split(",");
			String[] banks = "은행을 선택해주세요.,산업은행,기업은행,국민은행,외환은행,수협,농협,우리은행,SC은행,씨티은행,대구은행,부산은행,광주은행,제주은행,전분은행,경남은행,새마을금고,신협,우체국,하나은행,신한은행".split(",");
			String[] telecoms = "통신사를 선택해주세요.,SKT,KT,LGU+,LGU+(알뜰폰)".split(",");
			mav.addObject("cards",cards);
			mav.addObject("banks",banks);
			mav.addObject("telecoms",telecoms);
		return mav;
	}
	
	@RequestMapping("/point/chargeExec")
	public ModelAndView chargeExec(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		//메서드들어갈곳
		mav.setViewName("/");
		return mav;
	}
	@RequestMapping("/point/clist")
	public ModelAndView clist() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/clist");
		return mav;
	}
	@RequestMapping("/point/withdraw")
	public ModelAndView withdraw() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/withdraw");
		return mav;
	}
	@RequestMapping("/point/wlist")
	public ModelAndView wlist() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_my");
			mav.addObject("section","point/wlist");
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







