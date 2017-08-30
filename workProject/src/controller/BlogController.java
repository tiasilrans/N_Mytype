package controller;

import java.util.Map;

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
	public ModelAndView createBlog(@RequestParam Map m){
		System.out.println(m);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/blog/{url}");
			mav.addObject("url", m.get("url"));
			mav.addObject("title", m.get("title"));
			mav.addObject("intro", m.get("intro"));
		return mav;
	}
	
	
	@RequestMapping("/{url}")
	public ModelAndView BlogView(@PathVariable(value="url") String url, @RequestParam Map m){
		System.out.println("블로그 뷰로 가져온 값 : " + m);
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
