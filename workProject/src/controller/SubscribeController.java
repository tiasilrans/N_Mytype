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
import model.SubscribeDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("subscribe")
public class SubscribeController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	BlogDAO bdao;
	
	@Autowired
	SubscribeDAO subscribedao;
	
	@RequestMapping("blog.mt")
	public ModelAndView main(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String type = (String) map.get("type");
		// 목록에 표시할 포스트 수
		int pc = 4;

		// 현재 페이지
		int np = 1;
		if (map.get("np") != null) {
			np = Integer.parseInt((String) map.get("np"));
		}
		mav.addObject("np", np);

		// 불러올 리스트의 시작과 끝
		int e = np * pc;
		int s = e - pc + 1;
		map.put("first", s);
		map.put("last", e);
		map.put("type", "blog");
		String email = (String) session.getAttribute("login");
		if (email != null) {
			map.put("email", email);
		}

		mav.addObject("slist", subscribedao.blogList(map));

		// 리스트 밑에 페이지수
		int eSize = 5;
		int p1 = subscribedao.selectcount(map);
		int p = p1 / pc;
		p = p1 % pc != 0 ? p + 1 : p;
		mav.addObject("page", p);

		// 화살표
		int from = (np - 1) * eSize;
		int to = np * eSize;
		if (to > p) {
			to = p;
		}
		mav.addObject("from", from);
		mav.addObject("to", to);
		mav.setViewName("subscribe_blog");
		System.out.println(map);
		System.out.println(subscribedao.blogList(map));
		return mav;
	}
	

}
