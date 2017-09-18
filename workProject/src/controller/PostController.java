package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PostController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PostDao pdao;
	
	@RequestMapping("/postWriter.mt")
	@ResponseBody
	public Map posrWrite(@RequestParam Map m,HttpSession session){
		String email = (String)session.getAttribute("login");
			m.put("email", email);
		System.out.println("넘어온 값 : " + m);
		Map map= new HashMap<>();
		boolean f = pdao.postWrite(m);
		if(f){			
			map.put("result", true);
			map.put("url", m.get("url"));
		}else{
			map.put("result", false);
		}
		
		return map;
	}
	
	@RequestMapping("/{url}/post/{num}")
	public ModelAndView postView(@PathVariable(value="url") String url,
											@PathVariable(value="num") int num){
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");		
		Map map = new HashMap<>();
			map.put("num", num);
			map.put("url", url);
		boolean c = pdao.postCounter(map); // 조회수 증가
		if(c){
			HashMap post = pdao.onePost(map);
			post.put("PDATE", sdf.format(post.get("PDATE")));
			post.put("nickname", ((String)post.get("EMAIL")).split("@")[0]);
			mav.setViewName("post_view");
			mav.addObject("section", "blog/post/postView");
			mav.addObject("post", post);
		}
			mav.addObject("totalpost", pdao.postCount(map));// 해당 블로그의 총 포스트 수 
		return mav;	
	}
	
	
	@RequestMapping("/postdelete.mt")
	@ResponseBody
	public Map postDelete(@RequestParam Map m){
		Map map = new HashMap();
		boolean f = pdao.postDelete(m);		
		if(f){			
			map.put("result", true);
			map.put("url", m.get("url"));
		}else{
			map.put("result", false);
		}	 		
 		return map;	
	}
	
	@RequestMapping("/blog/update/{num }")
	public ModelAndView postUpdate(@RequestParam Map m, HttpSession session,
												@PathVariable(value="num") int num){
		// m= 타이틀, url 들어가 있음
		Map updateMap = (Map)session.getAttribute("writeMap");
		if(updateMap !=null){
			String title = (String)updateMap.get("title");
			String url = (String)updateMap.get("url");
			if(title!=null){
				m.put("title", title);
				m.put("url", url);
			}
		}		
		List<Map> catelist = pdao.categoryList(m);		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("post");
			mav.addObject("title", "포스트편집");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
			session.setAttribute("updateMap", m);
			
		return mav;
	}
	
	
	
		
	
	@RequestMapping("postgood.mt")
	@ResponseBody
	public String postgood(@RequestParam Map map,HttpSession session) throws JsonProcessingException{
		Map result = new HashMap<>();
		map.put("num", ((String)map.get("num")).replace("heart-", ""));
		map.put("email", (String)session.getAttribute("login"));
		if(Boolean.parseBoolean(((String)map.get("type")))){
			result.put("rst", pdao.postgoodAdd(map) > 0 ? true: false);
		}else{
			result.put("rst", pdao.postgoodRemove(map) > 0 ? true: false);
		}
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}
	
}
