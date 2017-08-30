package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class MainController {
	@Autowired
	ObjectMapper objMapper;
	
	
	@RequestMapping({ "/", "/index.mt" })
	public String welcome(Map map) {
		map.put("section", "main");
		return "t_el";
	}
	
	@RequestMapping("login.mt")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_login/login");
		return mav;
	}
	
	@RequestMapping("loginExec.mt")
	public ModelAndView loginExec(@RequestParam Map map, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		/*
		 * 로그인 검증 메소드 들어갈곳
		 * */
		
		
		/*if(flag){
			mav.setViewName("redirect:/");//메인으로 돌아감
			session.setAttribute("login", map.get("email"));
		}else{
			mav.setViewName("t_login/login");
			mav.addObject("flag",true);//로그인창으로 돌아가서 경고창 띄우기위함
		}*/
		
		return mav;
	}
	
	@RequestMapping("emailcheck.mt")
	@ResponseBody
	public String emailcheck(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap<>();
		result.put("rst", Math.random() > 0.5 ? true: false);
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}

	@RequestMapping("join.mt")
	public ModelAndView join(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_join/join");
		return mav;
	}
	
	@RequestMapping("joinExec.mt")
	public ModelAndView joinExec(@RequestParam Map map,	HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		/*
		 * 회원가입 메소드 들어갈곳
		 * */
		
		
		/*if(flag){
		 	//회원가입 성공시 로그인 시키고 메인화면으로 이동
			mav.setViewName("redirect:/");//메인으로 돌아감
			session.setAttribute("login", map.get("email"));
		}else{
			//다시 회원가입창으로 이동
			mav.setViewName("t_join/join");
			
		}*/
		return mav;
	}
	
}
