package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("/blog")
public class BlogController {
	
	@RequestMapping("/create")
	public ModelAndView newBlog(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_el");
	 	mav.addObject("section", "blog/create");
		return mav;
	}
	
	@RequestMapping("/ctrateBlog.mt")
	public ModelAndView createBlog(@RequestParam Map m, HttpSession session){
		System.out.println(m.get("title"));
		System.out.println(m.get("intro"));
		String msg = "<h1>" + m.get("title") + "</h1><br/><h4>" + m.get("intro") + "</h4>";
		m.put("intro", msg);
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/blog/"+m.get("url"));
			session.setAttribute("map", m);
		return mav;
	}
	
	
	@RequestMapping("/{url}")
	public ModelAndView BlogView(@PathVariable(value="url") String url, HttpSession session){		
		System.out.println(session.getAttribute("map"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_base");
			mav.addObject("section", "blog/blog");
		return mav;
	}
	
	@RequestMapping("/postWrite")
	public ModelAndView postWrite(@RequestParam Map m){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("post");
			mav.addObject("title", "포스트작성");
		return mav;
	}
	
	
	

}
