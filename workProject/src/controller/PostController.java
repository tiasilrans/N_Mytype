package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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

import model.BlogDAO;
import model.PointDao;
import model.PostDao;
import model.ReplyDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PostController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	ReplyDAO rDAO;
	
	@Autowired
	PointDao ptdao;
	
	@Autowired
	BlogDAO bDAO;

	
	// 포스트 수정
	@RequestMapping("/{url}/postEdit/{num}")
	public ModelAndView postWrite(@RequestParam Map m, HttpSession session, @PathVariable(value="num") int num,
														@PathVariable(value="url") String url){
			m.put("num", num);
			m.put("url", url);
			m.put("mode", "edit");
		Map	blogTitle = bDAO.blogTitle(m);
			m.put("title", blogTitle.get("TITLE")); // 블로그 제목 - 카테고리 리스트 가져오는데 필요
		Map postInfo = pdao.onePost(m); // 수정할 포스트의 정보			
		
		List<Map> catelist = pdao.categoryList(m);		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("post");
			mav.addObject("title", "포스트편집");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
			mav.addObject("updatePostInfo", postInfo);
						
		return mav;
	}	
	
	@RequestMapping("/postWriter.mt")
	@ResponseBody
	public Map posrWrite(@RequestParam Map m, HttpSession session){
		String email = (String)session.getAttribute("login");
			m.put("email", email);
		String mode = (String)m.get("mode");
		System.out.println("가져온 값 : " + m + " / 모드 :" + mode);		
		Map map= new HashMap<>();
		boolean f;
		if(mode.equals("new")){
			f=pdao.postWrite(m);
		}else{
			f=pdao.postEdit(m);
		}
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
											@PathVariable(value="num") int num, HttpSession session){
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		// 블로그 아바타 가져오기
				String path = "/images/blogImg/"+url;
				String rPath = application.getRealPath(path);
				File dir = new File(rPath);
				if(dir.exists()) {
					mav.addObject("imgPath", path);
				}else {
					mav.addObject("imgPath", "/images/avatar_yellow.png");
				}
		
		
		Map map = new HashMap<>();
			map.put("num", num);
			map.put("url", url);
		boolean c = pdao.postCounter(map); 
		if(c){
			HashMap post = pdao.onePost(map);
			post.put("PDATE", sdf.format(post.get("PDATE")));
			mav.setViewName("post_view");
			mav.addObject("section", "blog/post/postView");
			mav.addObject("post", post);
			mav.addObject("list", rDAO.replyList(map));
			
			String email = (String)session.getAttribute("login");
			if(email != null){
				map.put("email", email);
				boolean buy = pdao.buyCheck(map);
				mav.addObject("buy", buy);
				mav.addObject("mypoint", ptdao.selectpointsum(email));
			}else{
				mav.addObject("buy", false);
			}
		}
			mav.addObject("totalpost", pdao.postCount(map)); 
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
			mav.addObject("title", "전제 보기");
			mav.addObject("map", m);
			mav.addObject("catelist", catelist);
			session.setAttribute("updateMap", m);
			
		return mav;
	}
	
	@RequestMapping("/{num}/peply.mt")
	@ResponseBody
	public Map reply(@PathVariable(value="num") int num, @RequestParam Map m, HttpSession session){
		m.put("email", (String)session.getAttribute("login"));
		m.put("num", num);
		System.out.println(m);
		boolean f = rDAO.replyWrite(m);
		Map map = new HashMap<>();
		if(f){
			map.put("result", f);
			map.put("url", (String)m.get("url"));
			
		}else{
			map.put("result", f);
			
		}
		return map;
	}
	
	@RequestMapping("/{num}/peplyEdit.mt")
	@ResponseBody
	public Map peplyEdit(@PathVariable(value="num") int num, @RequestParam Map m){
		m.put("num", num);
		System.out.println(m);
		boolean f = rDAO.replyEdit(m);
		Map map = new HashMap<>();
		if(f){
			map.put("result", f);
			map.put("url", (String)m.get("url"));
			
		}else{
			map.put("result", f);
			
		}
		return map;
	}
	
	
	
	
	@RequestMapping("/replyDelete.mt")
	@ResponseBody
	public Map replyDelete(@RequestParam Map m){	
		System.out.println(m);
		boolean f = rDAO.replyDelete(m);
		Map map = new HashMap<>();
		if(f){
			map.put("result", f);
			
		}else{
			map.put("result", f);
			
		}
		return map;
	}
	
	
	
	@RequestMapping("like.mt")
	@ResponseBody
	public Map postLike(@RequestParam Map m, HttpSession session){
		m.put("email", (String)session.getAttribute("login"));
		System.out.println("포스트 좋아요 넘어온 값 :" + m);
		int rst = pdao.postgoodAdd(m);
		Map map = new HashMap<>();
		if(rst == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		return map;
	}
	
	@RequestMapping("unlike.mt")
	@ResponseBody
	public Map postUnLike(@RequestParam Map m, HttpSession session){
		System.out.println("포스트 좋아요 취소 넘어온 값 :" + m);
		
		Map map = new HashMap<>();
		return map;
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
	
	@RequestMapping("buypost.mt")
	public ModelAndView buypost(@RequestParam Map map,HttpSession session) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/"+(String)map.get("url")+"/post/"+(String)map.get("num"));
		map.put("myemail", session.getAttribute("login"));
		String title = (String)map.get("title");
		map.put("btitle", "["+title+"]포스트 구매");
		map.put("stitle", "["+title+"]포스트 판매");
		pdao.buyPost(map);
		return mav;
	}
	
	@RequestMapping("support.mt")
	public ModelAndView support(@RequestParam Map map,HttpSession session) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/"+(String)map.get("url")+"/post/"+(String)map.get("num"));
		String myemail = (String)session.getAttribute("login");
		map.put("myemail", myemail);
		String title = (String)map.get("title");
		map.put("support", "["+title+"]포스트 후원");
		map.put("supported", "["+title+"] 포스트에서 "+myemail+"님이 후원하셨습니다.");
		pdao.surpport(map);
		return mav;
	}
	
}