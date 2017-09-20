package controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import model.BlogDAO;
import model.PostDao;
import model.SubscribeDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class BlogAdminController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	BlogDAO bDAO;
	
	@Autowired
	PostDao pDAO;
	
	@Autowired
	SubscribeDAO sDAO;

	
	@RequestMapping("/blog/{url}/subscribers")
	public ModelAndView blogSubscribers(@PathVariable(value="url") String url, HttpSession session){
		Map map = new HashMap();
			map.put("url", url);
		HashMap blogTitle = bDAO.blogTitle(map);
		System.out.println(" blogTitle? " + blogTitle);
		List<Map> list = sDAO.blogSubscribers(map);
		System.out.println(list.isEmpty());
		for(Map li : list){
			System.out.println(li);
		}
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_setting");
			mav.addObject("title", "구독자");
		 	mav.addObject("section", "blog/settings/subscribers");		 	
		 	mav.addObject("blogTitle", blogTitle);
		 	mav.addObject("url", url);
		 	mav.addObject("list", list);
		 	mav.addObject("listempty", list.isEmpty());
		return mav;
	}
	
	
	@RequestMapping("/blog/{url}/setting")
	public ModelAndView blogSetting(@PathVariable(value="url") String url, HttpSession session){
		Map map = new HashMap();
			map.put("url", url);
		HashMap blogTitle = bDAO.blogTitle(map);	
		Map m = bDAO.blogView(map);
		ModelAndView mav = new ModelAndView();
		
		String path = "/images/blogImg/"+url;
		String rPath = application.getRealPath(path);
		File dir = new File(rPath);
		if(dir.exists()) {
			mav.addObject("imgPath", path);
		}else {
			mav.addObject("imgPath", "/images/avatar_yellow.png");
		}		
			mav.setViewName("blog_setting");
			mav.addObject("title", "블로그");
		 	mav.addObject("section", "blog/settings/setting");		 	
		 	mav.addObject("blogTitle", blogTitle);
		 	mav.addObject("url", url);
		 	mav.addObject("map", m);
		return mav;
	}
	
	@RequestMapping("/blogSetting.mt")
	public ModelAndView blogSettingUp(@RequestParam(name="file") MultipartFile f, 
			HttpSession session, @RequestParam Map map) throws IllegalStateException, IOException{
		System.out.println("블로그 설정 넘어온 값 : " + map);
		String path = application.getRealPath("/images/blogImg");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		boolean rst = false;
		if(f.getContentType().startsWith("image")) {
			File dst = new File(dir, (String)map.get("url"));
			if(dst.exists())
				dst.delete();
			f.transferTo(dst);
			rst = true;
		}		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/blog/"+(String)map.get("url")+"/setting");
			mav.addObject("r", rst);
		return mav;
	}	
	@RequestMapping("/blog/{url}/categories")
	public ModelAndView categories(@PathVariable(value="url") String url, HttpSession session){
		String email = (String)session.getAttribute("login");
		Map map = new HashMap();
			map.put("url", url);
			map.put("email", email);
		HashMap blogTitle = bDAO.blogTitle(map);
		HashMap r = bDAO.blogView(map);
			map.put("title", r.get("TITLE"));
		List<Map> list = bDAO.cate_List(map);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("blog_setting");
			mav.addObject("title", r.get("TITLE"));
			mav.addObject("section", "blog/settings/categories");
			mav.addObject("blogTitle", blogTitle);
	 		mav.addObject("url", url);
	 		mav.addObject("map", r);
	 		mav.addObject("list", list);
		return mav;
		
	}
	
	@RequestMapping("/blog/categoryUpdate.mt")
	@ResponseBody
	public Map categoryAdd(@RequestParam Map m, HttpSession session){
			m.put("email", session.getAttribute("login"));
		System.out.println("넘어온 값 : " + m);		
		Map map = new HashMap();
		String delete = (String)m.get("cate_delete");
		String[] arr = delete.split(",");
		String cate_name_order = (String)m.get("cate_name_order");
		String[] orderArr = cate_name_order.split(",");
		String addName = (String)m.get("addcate_name");
		String[] addcate_name = addName.split(",");
		String uuid = "";	
		boolean add = false;
		boolean orderadd = false;
		boolean order = false;		
		List<Map> before = bDAO.cateAfterList(m);
		for(String d : arr){// 삭제해야 할 경우			
			for(Map li : before){
				String id = (String)li.get("CATE_ID");
				if(id.equals(d)){
					System.out.println( " ID >> "+  d + "의 삭제를 시작한다");
					Map deleteMap = new HashMap();					
					deleteMap.put("cate_id", d);
					bDAO.cateRemover(deleteMap);
				}
			}					
			System.out.println("삭제 완료");
		}		
		
		for(int i = 0; i<addcate_name.length; i++){
			if(addcate_name[i]!=""){ // 카테고리 추가 해야 할 경우 -------------------------------------*
				uuid += UUID.randomUUID().toString().substring(0, 11) + ",";
				m.put("addcate_id", uuid.split(",")[i]);
				m.put("addcate_name", addcate_name[i]);
				add = bDAO.categoryAdd(m);
				orderadd = bDAO.categoryAddOrder(m);				
			}
		}				
			
		List<Map> list = bDAO.cateAfterList(m);		
		Map cateNameOrder = new HashMap();
		for(int i = 0; i<orderArr.length; i++ ){// 카테고리 순서 설정
			cateNameOrder.put(orderArr[i], i); // 키 : 카테고리 이름  - 값 : 카테고리 인덱스			
		}		
		for(Map li : list){
			String key = (String)li.get("CATEGORY_NAME");
			String id = (String)li.get("CATE_ID");
			if(!key.equals("전체 보기")){
				Integer idx = (Integer)cateNameOrder.get(key);				
				Map orderMap = new HashMap();
					orderMap.put("cate_index", idx);
					orderMap.put("cate_id", id);
				order = bDAO.cateOrderUpdate(orderMap);				
			}			
		}		
				
		if(add){			
			map.put("result", true);
			map.put("url", m.get("url"));
		}else{
			map.put("result", false);
			map.put("url", m.get("url"));
		}
	 		
 		return map;		
	}
	
	
	

}