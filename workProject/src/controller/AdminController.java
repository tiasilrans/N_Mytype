package controller;

import java.math.BigDecimal;
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
		String target = (String)map.get("target");
		List<Map> list = new ArrayList<>();
			mav.setViewName("admin_main");
			list = adminDAO.memberList(map);
		mav.addObject("list", list);
		return mav;
	}
	
	//회원 상세보기
	@RequestMapping("detail")
	public ModelAndView detail(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String target = (String)map.get("target");
		List<Map> list = new ArrayList<>();
			mav.setViewName("admin_detail");
			
			//멤버
			map.put("email", target);
			list = adminDAO.memberList(map);
			System.out.println(list);
			String nick = (String)list.get(0).get("NICKNAME") == null ? target : (String)list.get(0).get("NICKNAME") ;
			session.setAttribute("target", nick);
			session.setAttribute("targetEmail", target);
			mav.addObject("mlist", list);
			
			//블로그
			list = adminDAO.blogList(map);
			mav.addObject("blist", list);
			mav.addObject("plist", adminDAO. sublistReply(list, 25, "INTRO", "SUBINTRO"));
			
			//포스트
			list = adminDAO.selectPost(map);
			mav.addObject("plist", adminDAO. sublistReply(list, 18, "TITLE", "SUBTITLE"));
			
			//댓글
			list = adminDAO.replyList(map);
			list = adminDAO.sublistReply(list, 16, "CONTENT", "SUBCONTENT");
			mav.addObject("rlist", list);
			
			//충전 출금 리스트
			mav.addObject("clist", adminDAO.selectDeposit(map) );
			mav.addObject("wlist", adminDAO.selectWithdraw(map));
			
			
			
		return mav;
	}
	
	//충전 / 출금 신청 관리
	@RequestMapping("cwapply")
	public ModelAndView cwapply(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_cwapply");
		mav.addObject("clist",adminDAO.selectDepositApply());
		mav.addObject("wlist",adminDAO.selectWithdrawApply());
		return mav;
	}
	
	// 포스트 관리
	@RequestMapping("post")
	public ModelAndView post(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_post");
		List<Map> list = adminDAO.selectPost(map);
		mav.addObject("plist", adminDAO. sublistReply(list, 18, "TITLE", "SUBTITLE"));
		return mav;
	}

	//댓글 관리
	@RequestMapping("reply")
	public ModelAndView reply(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_reply");
		List<Map> list = adminDAO.replyList(map);
		list = adminDAO.sublistReply(list, 16, "CONTENT", "SUBCONTENT");
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
		if(email == null){
			mav.setViewName("redirect:/admin/mailsend");
		}else{
			mav.setViewName("admin_mailsend");
			mav.addObject("mlist", adminDAO.memberList(new HashMap()));
			mav.addObject("exec", true);
			map.put("email", email);
			adminDAO.sendmessage(map);
		}
		return mav;
	}
	
	//성인인증 신청 승인 리스트
	@RequestMapping("adult")
	public ModelAndView adult(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_adult");
		mav.addObject("mlist", adminDAO.adultlist());
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
				int point = m.get("POINT") != null?((BigDecimal)m.get("POINT")).intValue() : 0;
				
				String re = 
						"<tr><td><a href=\"/admin/detail?target="+m.get("EMAIL")+"\" style=\"color:black;\">"+m.get("EMAIL")+"</a></td>"+
						"<td>"+(m.get("NICKNAME") == null ? "<span style=\"color: red;\">미지정</span>"  : m.get("NICKNAME") )+"</td>"+
						"<td>"+sdf.format(m.get("JOINDATE"))+"</td>"+
						"<td>"+(df.format(point) == null ? 0 : df.format(point))+"P</td>"+
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
	
	
	//포스트 삭제
	@RequestMapping("deletePost")
	@ResponseBody
	public String deletePost(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap();//날려줄 JSON
		result.put("rst", adminDAO.deletePost(map));
		
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
	
	//충전 출금 승인
	@RequestMapping("cwapplyExec")
	@ResponseBody
	public String cwapplyExec(@RequestParam Map map) throws JsonProcessingException{
		String[] arr = ((String)map.get("num")).split("&");
		map.put("num", arr[0]);
		System.out.println(Arrays.toString(arr));

		Map result = new HashMap();//날려줄 JSON
		
		switch (arr[1]) {
		case "charge":
			map.put("email",arr[2]);
			map.put("point",arr[3]);
			result.put("rst", adminDAO.applyCharge(map));
			break;
		case "withdraw":
			result.put("rst", adminDAO.applyWithdraw(map));
			break;
		}
		
		String rst = objMapper.writeValueAsString(result);
		return rst;
	}

	//성인인증 승인
	@RequestMapping("applyadult")
	@ResponseBody
	public String applyadult(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap();//날려줄 JSON
		result.put("rst", adminDAO.adultApply(map));
		String rst = objMapper.writeValueAsString(result);
		return rst;
	}
	
	//성인인증 반려
	@RequestMapping("deleteadult")
	@ResponseBody
	public String deleteadult(@RequestParam Map map) throws JsonProcessingException{
		Map result = new HashMap();//날려줄 JSON
		result.put("rst", adminDAO.adultCompanion(map));
		String rst = objMapper.writeValueAsString(result);
		return rst;
	}
	
	
}
