package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.BlogDAO;
import model.MemberDao;
import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
@RequestMapping("search")
public class SearchController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	PostDao pdao;
	
	@Autowired
	BlogDAO bdao;
	
	@RequestMapping("main.mt")
	public ModelAndView main(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String keyword = (String)map.get("keyword");
		if(keyword.length() > 0){
			mav.addObject("keyword", keyword);
			map.put("first", 1);
			map.put("last", 6);
			map.put("post", true);//����Ʈ�˻����� �˸�������
			String email = (String)session.getAttribute("login");
			if(email != null){
				map.put("email", email);
			}
			//��ĭ �˻��ϼ��������ϱ�
			if(map.get("keyword") != null && keyword.length() > 0){
				
				String[] arr = (keyword).split("\\s");
				if(arr.length > 0){
					for(int i = 0 ; i < arr.length ; i++){
						arr[i] = "%"+arr[i]+"%";
					}
					map.put("keyword", arr);
					mav.addObject("hash", pdao.hashlist("%"+keyword+"%"));
					mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listAll(map))));
				}
			}else{
				map.put("keyword", null);
				mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listAll(map))));
			}
			
			mav.setViewName("search_main");
		}else{
			mav.setViewName("redirect:/");

		}
		return mav;
	}
	
	
	@RequestMapping("post.mt")
	public ModelAndView post(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search_post");
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		
		String email = (String)session.getAttribute("login");
		if(email != null){
			map.put("email", email);
		}
		
		
		//��Ͽ� ǥ���� ����Ʈ ��
		int pc = 12;
		
		//���� ������
		int np = 1;
		if(map.get("np") != null){
			np = Integer.parseInt((String)map.get("np"));
		}
		mav.addObject("np", np);
		
		//�ҷ��� ����Ʈ�� ���۰� ��
		int e = np*pc;
		int s = e-pc+1;		
		map.put("first", s);
		map.put("last", e);
		map.put("post", true);
		
		//��ĭ �˻��ϼ��������ϱ�
		if(map.get("keyword") != null && keyword.length() > 0){
			
			String[] arr = (keyword).split("\\s");
			if(arr.length > 0){
				for(int i = 0 ; i < arr.length ; i++){
					arr[i] = "%"+arr[i]+"%";
				}
				map.put("keyword", arr);
				mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listAll(map))));
			}
		}else{
			map.put("keyword", null);
			mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listAll(map))));
		}
		
		//����Ʈ �ؿ� ��������
		int eSize = 5;
		int p1 = pdao.selectcount(map);
		int p = p1 / pc;
		p = p1 % pc != 0 ? p+1: p;
		mav.addObject("page", p);
		
		//ȭ��ǥ
		int from = (np-1)*eSize;
		int to = np*eSize;
		if(to > p){
			to = p;
		}
		mav.addObject("from",from);
		mav.addObject("to",to);
		
		
		return mav;
	}
	
	
	@RequestMapping("tagsearch.mt")
	public ModelAndView tagsearch(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search_tagsearch");
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		
		
		//��Ͽ� ǥ���� ����Ʈ ��
		int pc = 12;
		
		//���� ������
		int np = 1;
		if(map.get("np") != null){
			np = Integer.parseInt((String)map.get("np"));
		}
		mav.addObject("np", np);
		
		//��ĭ �˻��ϼ��������ϱ�
		List list = pdao.hashlist("%"+keyword+"%");
		mav.addObject("hash", list);
		
		//����Ʈ �ؿ� ��������
		int eSize = 5;
		int p1 = list.size();
		int p = p1 / pc;
		p = p1 % pc != 0 ? p+1: p;
		mav.addObject("page", p);
		
		//ȭ��ǥ
		int from = (np-1)*eSize;
		int to = np*eSize;
		if(to > p){
			to = p;
		}
		mav.addObject("from",from);
		mav.addObject("to",to);
		
		
		return mav;
	}

	@RequestMapping("tag.mt")
	public ModelAndView tag(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search_tag");
		String keyword = (String)map.get("keyword");
		mav.addObject("keyword", keyword);
		
		String email = (String)session.getAttribute("login");
		if(email != null){
			map.put("email", email);
		}
		
		
		//��Ͽ� ǥ���� ����Ʈ ��
		int pc = 12;
		
		//���� ������
		int np = 1;
		if(map.get("np") != null){
			np = Integer.parseInt((String)map.get("np"));
		}
		mav.addObject("np", np);
		
		//�ҷ��� ����Ʈ�� ���۰� ��
		int e = np*pc;
		int s = e-pc+1;		
		map.put("first", s);
		map.put("last", e);
		map.put("tag", true);
		
		//��ĭ �˻��ϼ��������ϱ�
		if(map.get("keyword") != null && keyword.length() > 0){
			mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listTag(map))));
		}else{
			map.put("keyword", null);
			mav.addObject("plist", pdao.sublist(pdao.imgRedefinition(pdao.listTag(map))));
		}
		
		//����Ʈ �ؿ� ��������
		int eSize = 5;
		int p1 = pdao.selectcount(map);
		int p = p1 / pc;
		p = p1 % pc != 0 ? p+1: p;
		mav.addObject("page", p);
		
		//ȭ��ǥ
		int from = (np-1)*eSize;
		int to = np*eSize;
		if(to > p){
			to = p;
		}
		mav.addObject("from",from);
		mav.addObject("to",to);
		
		
		return mav;
	}
	

}
