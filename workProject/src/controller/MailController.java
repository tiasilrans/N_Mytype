package controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import handler.AlertSocketHandler;
import model.MailDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("/mail")
public class MailController {
	@Autowired
	MailDAO maildao;
	
	@Autowired
	AlertSocketHandler ash;
	
	
	@RequestMapping("list.mt")
	public ModelAndView list(@RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mail_list");
		String type = (String)map.get("type");
		mav.addObject("type",type);
		
		//목록에 표시할 포스트 수
		int pc = 5;
		
		//현재 페이지
		int np = 1;
		if(map.get("np") != null){
			np = Integer.parseInt((String)map.get("np"));
		}
		mav.addObject("np", np);
		
		//불러올 리스트의 시작과 끝
		int e = np*pc;
		int s = e-pc+1;		
		map.put("first", s);
		map.put("last", e);
		map.put("type", type);
		
		String email = (String)session.getAttribute("login");
		map.put("email", email);
		mav.addObject("mlist",maildao.mailList(map));
		
		//리스트 밑에 페이지수
		int eSize = 5;
		int p1 = maildao.selectcount(map);
		int p = p1 / pc;
		p = p1 % pc != 0 ? p+1: p;
		mav.addObject("page", p);
		
		//화살표
		int from = (np-1)*eSize;
		int to = np*eSize;
		if(to > p){
			to = p;
		}
		mav.addObject("from",from);
		mav.addObject("to",to);
		
		
		

		
		
		return mav;
	}
	
	@RequestMapping("write.mt")
	public ModelAndView write(@RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mail_write");
		if(map.get("reply") != null){
			mav.addObject("email", (String)map.get("reply"));
		}
		return mav;
	}
	
	@RequestMapping("writeExec.mt")
	public ModelAndView writeExec(@RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mail_write");
		
		String email = (String)session.getAttribute("login");
		if(email != null){
			map.put("sender",email);
			boolean result = maildao.send(map);
			mav.addObject("result", result);
			ash.sendMessage((String)map.get("receiver"), "mail");
		}else{
			mav.addObject("alert", true);
		}
		return mav;
	}
	
	@RequestMapping("view.mt")
	public ModelAndView view(@RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mail_view");
		String type = (String)map.get("type");
		mav.addObject("view", maildao.mailView(map));
		mav.addObject("type", type);
		return mav;
	}
	
	@RequestMapping("delete.mt")
	public ModelAndView delete(@RequestParam (name="num",required=false) String[] arr, @RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String type = (String)map.get("type");
		mav.setViewName("redirect:/mail/list.mt?type="+type);
		if(arr != null){
			String part = (String)map.get("part");
			if(part.equals("list")){
				map.put("num", arr);
			}
			boolean result = maildao.deletemail(map);
		}
		return mav;
	}
	
}
