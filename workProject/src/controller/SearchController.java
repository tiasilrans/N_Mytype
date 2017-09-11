package controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.BlogDAO;
import model.MemberDao;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("search")
public class SearchController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	BlogDAO bdao;
	
	@RequestMapping("main.mt")
	public ModelAndView main(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		map.put("first", 1);
		map.put("last", 6);
		String email = (String)session.getAttribute("login");
		if(email != null){
			map.put("email", email);
		}
		//빈칸 검색일수도있으니까
		if(map.get("keyword") != null && keyword.length() > 0){
			
			String[] arr = (keyword).split("\\s");
			if(arr.length > 0){
				for(int i = 0 ; i < arr.length ; i++){
					arr[i] = "%"+arr[i]+"%";
				}
				map.put("keyword", arr);
				mav.addObject("hash", pdao.hashlist("%"+keyword+"%"));
				mav.addObject("plist", pdao.sublist((pdao.listAll(map))));
			}
		}else{
			map.put("keyword", null);
			mav.addObject("plist", pdao.sublist((pdao.listAll(map))));
		}
		
		mav.setViewName("search_main");
		return mav;
	}
	
	@RequestMapping("post.mt")
	public ModelAndView post(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("search_post");
		return mav;
	}
	
}
