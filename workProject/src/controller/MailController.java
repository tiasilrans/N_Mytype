package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MailDAO;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("mail")
public class MailController {
	@Autowired
	MailDAO maildao;
	
	
	@RequestMapping("list.mt")
	public ModelAndView list(@RequestParam Map map,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mail_list");
		String type = (String)map.get("type");
		mav.addObject("type",type);
		
		String email = (String)session.getAttribute("login");
		map.put("email", email);
		mav.addObject("mlist",maildao.mailList(map));

		
		
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
}
