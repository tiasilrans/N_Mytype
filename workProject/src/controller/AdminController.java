package controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import freemarker.template.SimpleDate;
import model.AdminDAO;
import model.BlogDAO;
import model.MemberDao;
import model.MyDao;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("admin")
public class AdminController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	BlogDAO bdao;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	MyDao myDao;
	
	@Autowired
	AdminDAO adminDAO;
	
	//회원 정보 조회
	@RequestMapping("main")
	public ModelAndView main(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_main");
		mav.addObject("list", adminDAO.memberList(map));
		return mav;
	}
	
	//댓글 관리
	@RequestMapping("cwapply")
	public ModelAndView cwapply(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_cwapply");
		return mav;
	}

	//댓글 관리
	@RequestMapping("reply")
	public ModelAndView reply(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_reply");
		List<Map> list = adminDAO.replyList(map);
		list = adminDAO.sublistReply(list, 16);
		mav.addObject("list", list);
		return mav;
	}
	
	//관리자 쪽지 보내기
	@RequestMapping("mailsend")
	public ModelAndView mailsend(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_mailsend");
		mav.addObject("mlist", adminDAO.memberList(map));
		return mav;
	}
	
	//관리자 쪽지 보내기EXEC
	@RequestMapping("mailsendExec")
	public ModelAndView mailsendExec(@RequestParam Map map,@RequestParam(name="email", required=false) String[] email,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_mailsend");
		mav.addObject("mlist", adminDAO.memberList(new HashMap()));
		mav.addObject("exec", true);
		map.put("email", email);
		adminDAO.sendmessage(map);
		return mav;
	}
	
	
	
	//ReponseBody======================================
	
	
	//멤버 검색
	@RequestMapping("membersearch")
	@ResponseBody
	public String membersearch(@RequestParam Map map) throws JsonProcessingException{
		List<Map> list = adminDAO.memberList(map);
		Map result = new HashMap();//날려줄 JSON
		String mz = "";
		
		if(list.size() > 0){
			for(Map m : list){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				DecimalFormat df = new DecimalFormat("#,###");
				String re = "<tr><td>"+m.get("EMAIL")+"</td>"+
						"<td>"+m.get("NICKNAME")+"</td>"+
						"<td>"+sdf.format(m.get("JOINDATE"))+"</td>"+
						"<td>"+(df.format(m.get("POINT")) == null ? 0 : df.format(m.get("POINT")))+"P</td>"+
						"<td>"+(m.get("BLOG") == null ? 0 : m.get("BLOG"))+"</td>"+
						"<td>"+(m.get("POST") == null ? 0 : m.get("POST"))+"</td>"+
						"<td>"+(m.get("REPLY") == null ? 0 : m.get("REPLY"))+"</td></tr>";
				mz+=re;
			}
			result.put("rst", true);
			result.put("content", mz);
		}else{
			result.put("rst", false);
		}
		
		String rst = objMapper.writeValueAsString(result);
		return rst;
	}
	
	
	//댓글 삭제
	@RequestMapping("deleteReply")
	@ResponseBody
	public String deleteReply(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap();//날려줄 JSON
		result.put("rst", adminDAO.deleteReply(map));
		
		String rst = objMapper.writeValueAsString(result);
		return rst;
	}

	
}
