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
	
	@RequestMapping("/blogView")
	public ModelAndView createBlog(/*@PathVariable(value="url") String url,*/ @RequestParam Map m){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_base");
		 	mav.addObject("section", "blog/blog");
		
		return mav;
	}
	
	
	

}
