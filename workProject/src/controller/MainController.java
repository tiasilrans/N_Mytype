package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import model.AdminDAO;
import model.BlogDAO;
import model.MemberDao;
import model.MyDao;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class MainController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	BlogDAO bdao;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	MyDao myDao;

	@Autowired
	AdminDAO adminDao;
	
	@RequestMapping({ "/", "/index.mt" })
	public ModelAndView welcome(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_main");
		Map str = new HashMap<>();
		str.put("email",(String)session.getAttribute("login"));
		str.put("first", 1);
		str.put("last", 6);
		mav.addObject("listAll",pdao.sublist(pdao.listAll(str)));
		mav.addObject("notice", adminDao.noticeList("main"));
		if(session.getAttribute("login") != null){
			mav.addObject("listLike", pdao.sublist(pdao.listLike(str)));
		}
		return mav;
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
		if(result != null){
			mav.setViewName("redirect:/");
			session.setAttribute("login", map.get("email"));
			session.setAttribute("blog", bdao.mybloglist(map));
			System.out.println(myDao.info((String)session.getAttribute("login")));
			session.setAttribute("info", myDao.info((String)session.getAttribute("login")));
			
		}else{
			mav.setViewName("t_login/login");
			mav.addObject("flag",true);
		}
		
		return mav;
	}
	
	@RequestMapping("logout.mt")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/");
			session.removeAttribute("login");
			session.removeAttribute("blog");
		return mav;
	}
	
	@RequestMapping("emailUuidSend.mt")
	public void emailUuidSend(@RequestParam Map map, HttpSession session){
		try{
			SimpleMailMessage msg = new SimpleMailMessage();
			System.out.println(map.get("email"));
			msg.setTo((String)map.get("email"));
			msg.setFrom("admin");	
			
			msg.setSubject("[Mytype] 이메일 인증");
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
			session.removeAttribute("EC");
			mdao.join(map);
			mav.setViewName("redirect:/");
			session.setAttribute("login", map.get("email"));
		}else{
			mav.setViewName("t_join/join");
			mav.addObject("uuid", true);
		}
		return mav;
	}
	
}
