package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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







