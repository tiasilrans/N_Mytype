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

import model.BlogDAO;
import model.MemberDao;
import model.MyDao;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("admin")
public class AdminController {
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
	
	@RequestMapping("main")
	public ModelAndView welcome(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_main");
		return mav;
	}
	
}
