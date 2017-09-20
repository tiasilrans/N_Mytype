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

import model.PointDao;
import model.PostDao;
import model.ReplyDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PostController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	ReplyDAO rDAO;
	
	@Autowired
	PointDao ptdao;

	
	@RequestMapping("/postWriter.mt")
	@ResponseBody
	public Map posrWrite(@RequestParam Map m,HttpSession session){
		String email = (String)session.getAttribute("login");
			m.put("email", email);
		System.out.println("�Ѿ�� �� : " + m);
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
											@PathVariable(value="num") int num, HttpSession session){
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");		
		Map map = new HashMap<>();
			map.put("num", num);
			map.put("url", url);
		boolean c = pdao.postCounter(map); // ��ȸ�� ����
		if(c){
			HashMap post = pdao.onePost(map);
			post.put("PDATE", sdf.format(post.get("PDATE")));
			mav.setViewName("post_view");
			mav.addObject("section", "blog/post/postView");
			mav.addObject("post", post);
			mav.addObject("list", rDAO.replyList(map));
			//num�̶� email ������ buy ���� ���� ������ �׸����� Ȯ��
			//���������� true �����ų� ���ű���� ���ų� ��α��� = false
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
			mav.addObject("totalpost", pdao.postCount(map));// �ش� ��α��� �� ����Ʈ �� 
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
		// m= Ÿ��Ʋ, url �� ����
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
			mav.addObject("title", "asdas");
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
		map.put("btitle", "["+title+"]포스트 판매");
		map.put("stitle", "["+title+"]포스트 구매");
		pdao.buyPost(map);
		return mav;
	}
	
}
