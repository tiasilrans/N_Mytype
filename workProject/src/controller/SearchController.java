package controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
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
		map.put("post", true);//포스트검색임을 알리기위함
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
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		
		String email = (String)session.getAttribute("login");
		if(email != null){
			map.put("email", email);
		}
		
		
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
		map.put("post", true);
		
		//빈칸 검색일수도있으니까
		if(map.get("keyword") != null && keyword.length() > 0){
			
			String[] arr = (keyword).split("\\s");
			if(arr.length > 0){
				for(int i = 0 ; i < arr.length ; i++){
					arr[i] = "%"+arr[i]+"%";
				}
				map.put("keyword", arr);
				mav.addObject("plist", pdao.sublist((pdao.listAll(map))));
			}
		}else{
			map.put("keyword", null);
			mav.addObject("plist", pdao.sublist((pdao.listAll(map))));
		}
		
		//리스트 밑에 페이지수
		int eSize = 5;
		int p1 = pdao.selectcount(map);
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
	
	@RequestMapping("tag.mt")
	public ModelAndView tag(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search_tag");
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		
		
		//목록에 표시할 포스트 수
		int pc = 12;
		
		//현재 페이지
		int np = 1;
		if(map.get("np") != null){
			np = Integer.parseInt((String)map.get("np"));
		}
		mav.addObject("np", np);
		
		//빈칸 검색일수도있으니까
		List list = pdao.hashlist("%"+keyword+"%");
		mav.addObject("hash", list);
		
		//리스트 밑에 페이지수
		int eSize = 5;
		int p1 = list.size();
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
	
}
