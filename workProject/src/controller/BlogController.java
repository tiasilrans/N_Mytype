package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
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
public class BlogController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	BlogDAO bDAO;
	
	@Autowired
	PostDao pDAO;
	
	@RequestMapping("/blog/create")
	public ModelAndView newBlog(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_el");
	 	mav.addObject("section", "blog/settings/create");
		return mav;
	}
	
	@RequestMapping("/blog/ctrateBlog.mt")
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
	
	@RequestMapping("/blog/{url}")
	public ModelAndView BlogView(@PathVariable(value="url") String url, 
						@RequestParam(name="p", defaultValue="1") int p, HttpSession session){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		ModelAndView mav = new ModelAndView();
		String path = "/images/blogImg/"+url;
		String rPath = application.getRealPath(path);
		File dir = new File(rPath);
		if(dir.exists()) {
			mav.addObject("imgPath", path);
		}else {
			mav.addObject("imgPath", "/images/avatar_yellow.png");
		}
		Map map = new HashMap();
			map.put("url", url);
			map.put("email", (String)session.getAttribute("login"));			
		HashMap r = bDAO.blogView(map);
			map.put("title", r.get("TITLE"));
		Map pageMap = new HashMap<>();
		int lc = pDAO.postCount(map);
			r.put("totalPostCnt", lc);
		int tp = lc%12==0 ? lc/12 : lc/12+1;
		int start = (p-1)*12+1;
		int end = start + 12 - 1;
			pageMap.put("start", start);
			pageMap.put("end", end);
			pageMap.put("url", url);
			
		List<Map> list = bDAO.cate_List(map);
		for(Map m : list){
			String cn = (String)m.get("CATEGORY_NAME");
				map.put("category", cn);
			int cnt = bDAO.oneCateCnt(map);
				m.put("cnt", cnt);
		}
	
			mav.setViewName("blog_base");
			mav.addObject("section", "blog/blog");
			mav.addObject("header", "blog/header");
			mav.addObject("map", r); // ��α� ����
			mav.addObject("title", r.get("TITLE"));
			mav.addObject("pNum", tp);
			mav.addObject("list", pDAO.blogPostList(pageMap)); // ��α� ���� ����Ʈ ����Ʈ
			mav.addObject("category", list);
			
		return mav;
	}
	
	@RequestMapping("/blog/postWrite")
	public ModelAndView postWrite(@RequestParam Map m, HttpSession session){
		// m= Ÿ��Ʋ, url �� ����
		Map writeMap = (Map)session.getAttribute("writeMap");
		if(writeMap !=null){
			String title = (String)writeMap.get("title");
			String url = (String)writeMap.get("url");
			if(title!=null){
				m.put("title", title);
				m.put("url", url);
			}
		}
		
		List<Map> catelist = pDAO.categoryList(m);		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("post");
			mav.addObject("title", "����Ʈ�ۼ�");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
			session.setAttribute("writeMap", m);
			
		return mav;
	}
	
	
	
	
	
	
	
	
}
