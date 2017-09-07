package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.BlogDAO;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	BlogDAO bDAO;
	
	@Autowired
	PostDao pDAO;
	
	@RequestMapping("/create")
	public ModelAndView newBlog(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_el");
	 	mav.addObject("section", "blog/create");
		return mav;
	}
	
	@RequestMapping("/ctrateBlog.mt")
	@ResponseBody
	public Map createBlog(@RequestParam Map m, HttpSession session){
		String uuid = UUID.randomUUID().toString().substring(0, 11);
		Map map = new HashMap();
		m.put("email", session.getAttribute("login"));
		m.put("cate_id", uuid);
		System.out.println(m);
		boolean f = bDAO.blogCreate(m);
		if(f){			
			map.put("result", true);
			map.put("url", m.get("url"));
			session.setAttribute("blog", bDAO.mybloglist(m));
		}else{
			map.put("result", false);
		}
		return map;
	}	
	
	@RequestMapping("/{url}")
	public ModelAndView BlogView(@PathVariable(value="url") String url, HttpSession session){		
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
			map.put("url", url);
		HashMap r = bDAO.blogView(map);
			mav.setViewName("blog_base");
			mav.addObject("section", "blog/blog");
			mav.addObject("header", "blog/header");
			mav.addObject("map", r);
			mav.addObject("title", r.get("TITLE"));
		return mav;
	}
	
	@RequestMapping("/postWrite")
	public ModelAndView postWrite(@RequestParam Map m, HttpSession session){
		String email = (String)session.getAttribute("login");
			m.put("email", email);
		List<Map> catelist = pDAO.categoryList(m);	
		System.out.println(catelist);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("post");
			mav.addObject("title", "포스트작성");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
		return mav;
	}
	
	@RequestMapping("/{url}/categories")
	public ModelAndView categories(@PathVariable(value="url") String url, HttpSession session){
		String email = (String)session.getAttribute("login");
		Map map = new HashMap();
			map.put("url", url);
			map.put("email", email);
		HashMap r = bDAO.blogView(map);
		List<Map> list = bDAO.cate_List(map);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_setting");
			mav.addObject("title", r.get("TITLE"));
			mav.addObject("section", "blog/categories");
	 		mav.addObject("url", url);
	 		mav.addObject("map", r);
	 		mav.addObject("list", list);
		return mav;
		
	}
	
	@RequestMapping("/categoryAdd.mt")
	@ResponseBody
	public Map categoryAdd(@RequestParam Map m, 
				 HttpSession session){
			m.put("email", session.getAttribute("login"));
		System.out.println("넘어온 값 : " + m);
		System.out.println("----------------카테고리 수정----------------");
		Map map = new HashMap();
		String cate_name_order = (String)m.get("cate_name_order");
		String[] orderArr = cate_name_order.split(",");
		String addName = (String)m.get("addcate_name");
		String[] addcate_name = addName.split(",");
		String cate_name = (String)m.get("cate_name");
		String cate_id = (String)m.get("cate_id");
		
		
		if(addcate_name != null){ // 카테고리 추가 해야 할 경우 -------------------------------------*
			System.out.println("추가해야 할 카테고리 id 수 :" + (addcate_name.length));			
			for(int i = 0; i<addcate_name.length; i++){
				String uuid = UUID.randomUUID().toString().substring(0, 11);
				m.put("addcate_id", uuid);
				m.put("addcate_name", addcate_name[i]);
				System.out.println("추가 / 넘길 값 : " + m);
				//bDAO.categoryAdd(m);
			}
		}else{
			
			
		}
		m.put("cate_name", cate_name);
		m.put("cate_id", cate_id);
			
		
		
		/*boolean f = bDAO.categoryAdd(m);
		
		if(f){			
			map.put("result", true);
			map.put("url", m.get("url"));
		}else{
			map.put("result", false);
		}*/
	 		
 		return map;		
	}
	
	@RequestMapping("test.mt")
	public ModelAndView test(){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_el");
			mav.addObject("section", "blog/test");
		
 		return mav;			
	}
	
	

	
	
	
	
	
	
	
	
}
