package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MemberDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class MainController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	JavaMailSender sender;
	
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
		
		Map result = mdao.Login(map);
		System.out.println(result);
		if(result != null){
			mav.setViewName("redirect:/");//메인으로 돌아감
			session.setAttribute("login", map.get("email"));
		}else{
			mav.setViewName("t_login/login");
			mav.addObject("flag",true);//로그인창으로 돌아가서 경고창 띄우기위함
		}
		
		return mav;
	}
	
	@RequestMapping("logout.mt")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/");
			session.removeAttribute("login");
		return mav;
	}
	
	//회원가입시 이메일로 전송
	@RequestMapping("emailUuidSend.mt")
	public void emailUuidSend(@RequestParam Map map, HttpSession session){
		try{
			SimpleMailMessage msg = new SimpleMailMessage();
			System.out.println(map.get("email"));
			msg.setTo((String)map.get("email"));
			msg.setFrom("admin");	
			
			msg.setSubject("[Mytype] 이메일 인증값");
			String text = UUID.randomUUID().toString().substring(0,4);	
			System.out.println(text);
			msg.setText(text);
			
			sender.send(msg);
			
			session.setAttribute("EC", text);
		}catch(Exception e){
		}
	}
	
	@RequestMapping("emailcheck.mt")
	@ResponseBody
	public String emailcheck(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap<>();
		result.put("rst", mdao.emailCheck(map) == null ? true: false);
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

		if(map.get("cn").equals((String)session.getAttribute("EC"))){
				mdao.join(map);
				mav.setViewName("redirect:/");
				session.setAttribute("login", map.get("email"));
				session.removeAttribute("EC");
		}else{
			mav.setViewName("t_join/join");
			mav.addObject("uuid", true);
		}
		return mav;
	}
	
}
