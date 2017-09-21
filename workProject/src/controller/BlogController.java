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
import model.ReplyDAO;
import model.SubscribeDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class BlogController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	BlogDAO bDAO;
	
	@Autowired
	PostDao pDAO;
	
	@Autowired
	SubscribeDAO sDAO;
	
	@Autowired
	ReplyDAO rDAO;
	
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
		
		List<Map> mainPostList = pDAO.blogPostList(pageMap);
		for(Map m : mainPostList){
			map.put("num", m.get("NUM"));
			int count = rDAO.postReplyCount(map);
			int like = pDAO.postLikeCount(map);
			m.put("replyCount", count);
			m.put("likeCount", like);
		}
	
			mav.setViewName("blog_base");
			mav.addObject("section", "blog/blog");
			mav.addObject("header", "blog/header");
			mav.addObject("map", r); // 블로그 정보
			mav.addObject("title", r.get("TITLE"));
			mav.addObject("pNum", tp);
			mav.addObject("list", mainPostList); // 블로그 메인 포스트 리스트
			mav.addObject("category", list);
			mav.addObject("subCk", sDAO.subCheck(map));
			
		return mav;
	}
	
	@RequestMapping("/blog/postWrite")
	public ModelAndView postWrite(@RequestParam Map m, HttpSession session){
		// m= 타이틀, url 들어가 있음
			m.put("mode", "new");
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
			mav.addObject("title", "포스트작성");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
			session.setAttribute("writeMap", m);
			
		return mav;
	}
	
	
	
	
	// 블로그 카테고리 내 포스트 리스트 뷰
	@RequestMapping("/blog/{url}/category/{categoryname}")
	public ModelAndView categoryView(@PathVariable(value="url") String url, 
				@PathVariable(value="categoryname") String categoryname, HttpSession session){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Map map = new HashMap<>();
			map.put("url", url);
			map.put("categoryname", categoryname);
			map.put("email", (String)session.getAttribute("login"));
		HashMap blogInfo = bDAO.blogView(map);
			map.put("title", blogInfo.get("TITLE"));
		int lc = pDAO.postCount(map);
		 	blogInfo.put("totalPostCnt", lc);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_base");
			mav.addObject("section", "blog/blog");
			mav.addObject("header", "blog/header"); // 블로그 제목, 소개 들어가야 함
			mav.addObject("title", blogInfo.get("TITLE"));
		// 블로그 아바타 가져오기
				String path = "/images/blogImg/"+url;
				String rPath = application.getRealPath(path);
				File dir = new File(rPath);
				if(dir.exists()) {
					mav.addObject("imgPath", path);
				}else {
					mav.addObject("imgPath", "/images/avatar_yellow.png");
				}
		List<Map> list = bDAO.cate_List(map);
		for(Map cateMap : list){
			String cn = (String)cateMap.get("CATEGORY_NAME");
				map.put("category", cn);
			int cnt = bDAO.oneCateCnt(map);
				cateMap.put("cnt", cnt);
		}		
		
		mav.addObject("category", list);
		mav.addObject("map", blogInfo);
		mav.addObject("subCk", sDAO.subCheck(map));
		mav.addObject("searchMode", false);		
		mav.addObject("list", pDAO.categoryPostList(map));
		return mav;  
	}
	
	
	@RequestMapping("/blog/{url}/search")
	public ModelAndView blogSearch(@RequestParam Map m, @PathVariable(value="url") String url,
									HttpSession session, @RequestParam(name="p", defaultValue="1") int p){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		ModelAndView mav = new ModelAndView();
		// 블로그 아바타 가져오기
		String path = "/images/blogImg/"+url;
		String rPath = application.getRealPath(path);
		File dir = new File(rPath);
		if(dir.exists()) {
			mav.addObject("imgPath", path);
		}else {
			mav.addObject("imgPath", "/images/avatar_yellow.png");
		}
		
		
		 HashMap map = new HashMap();
		 	map.put("url", url);
		 	map.put("email", (String)session.getAttribute("login"));
		 HashMap blogInfo = bDAO.blogView(map);	
		 	map.put("title", blogInfo.get("TITLE"));
		 int lc = pDAO.postCount(map);
		 	blogInfo.put("totalPostCnt", lc);	
		 List<Map> list = bDAO.cate_List(map);
			for(Map cateMap : list){
				String cn = (String)cateMap.get("CATEGORY_NAME");
					map.put("category", cn);
				int cnt = bDAO.oneCateCnt(map);
					cateMap.put("cnt", cnt);
			}
		 
		 
		 System.out.println("search map = " + m);
		 String a = "";	
		 String keyword = (String)m.get("keyword");
		 String[] keys = keyword.split("\\s");
		 for(String msg : keys){
			 a += "%"+msg+"%&";
		 }
		 String[] arr = a.split("&");
		 	map.put("arr", arr);		 	
		
		
		 	mav.setViewName("blog_base");
		 	mav.addObject("section", "blog/blog");
		 	mav.addObject("header", "blog/header"); // 블로그 제목, 소개 들어가야 함
		 	mav.addObject("title", keyword + "의 검색 결과");
		 	mav.addObject("list", pDAO.blogSearch(map));
		 	mav.addObject("category", list);
		 	mav.addObject("map", blogInfo);
		 	mav.addObject("subCk", sDAO.subCheck(map));
		 	mav.addObject("searchMode", true);
		 	mav.addObject("keyword", keyword);
		 return mav;  	 
		
	}
	
	
	
	
	
	
	
}