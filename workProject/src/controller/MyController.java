package controller;

import java.io.File;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MemberDao;
import model.MyDao;
import model.PointDao;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PointDao pointDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MyDao myDao;
	
	@Autowired
	ServletContext application;
	
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_main");
			mav.addObject("section","home");
		return mav;
	}
	
	@RequestMapping("/postgood")
	public ModelAndView goods() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_main");
			mav.addObject("section","postgood");
		return mav;
	}
	
	@RequestMapping("/purchases")
	public ModelAndView purchases() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("t_main");
			mav.addObject("section","purchases");
		return mav;
	}
	
	// ����Ʈ�κ�
	@RequestMapping("/point/plist")
	public ModelAndView plist(@RequestParam Map map,HttpSession session) {
		String email = (String)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_plist");
			mav.addObject("section","point/plist");
			
			//��Ͽ� ǥ���� ����Ʈ ��
			int pc = 5;
			
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
			map.put("type", "point");
			
			if(email != null){
				map.put("email", email);
				mav.addObject("list",pointDao.selectpoint(map));
				mav.addObject("pointsum",pointDao.selectpointsum(email));
			}
			
			//����Ʈ �ؿ� ��������
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
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
	
	@RequestMapping("/point/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_charge");
			String[] cards = "����,��������,�츮����,�ϳ�����,��������,��ȯ����,��Ƽ����,��ü��,�λ�����,SC����".split(",");
			String[] banks = "�������,�������,��������,��ȯ����,����,����,�츮����,SC����,��Ƽ����,�뱸����,�λ�����,��������,��������,��������,�泲����,�������ݰ�,����,��ü��,�ϳ�����,��������".split(",");
			String[] telecoms = "SKT,KT,LGU+,LGU+(�˶���)".split(",");
			mav.addObject("cards",cards);
			mav.addObject("banks",banks);
			mav.addObject("telecoms",telecoms);
		return mav;
	}
	
	@RequestMapping("/point/chargeExec")
	public ModelAndView chargeExec(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String point = ((String)map.get("point")).replace(",", "");
		map.put("point", point);
		mav.setViewName("point_charge");
		if(session.getAttribute("login") != null){
			String str = (String)map.get((String)map.get("pay"));
			if(str.equals("null")){
				mav.addObject("alert",true);
			}else{
				mav.setViewName("redirect:/my/point/clist");
				map.put("email", (String)session.getAttribute("login"));
				map.put("paymentoption", str);
				switch ((String)map.get("pay")) {
				case "card":
					map.put("pay", "ī�����");
					break;
				case "untouched":
					map.put("pay", "�������Ա�");
					break;
				case "phone":
					map.put("pay", "�޴�������");
					break;
				}
				pointDao.pointcharge(map);
			}
		}
		
		return mav;
	}
	
	//���� ��û ����Ʈ
	@RequestMapping("/point/clist")
	public ModelAndView clist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_clist");
			mav.addObject("section","point/clist");
			
			//��Ͽ� ǥ���� ����Ʈ ��
			int pc = 5;
			
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
			map.put("type", "deposit");
			
			if(session.getAttribute("login") != null){
				String email = (String)session.getAttribute("login");
				map.put("email", email);
				
				mav.addObject("list",pointDao.selectdeposit(map));
			}
			
			//����Ʈ �ؿ� ��������
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
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
	
	//����Ʈ ���� ���
	@RequestMapping("/point/delete")
	@ResponseBody
	public String delete(@RequestParam Map map,HttpSession session) throws JsonProcessingException {
		HashMap result = new HashMap<>();
		String choose = (String)map.get("type");
		boolean rst = false;
		switch (choose) {
		case "chargeCancel":
			rst = pointDao.chargeCancel((String)map.get("num"));
			result.put("rst", rst);
			break;
		case "withdrawCancel":
			rst = pointDao.withdrawCancel((String)map.get("num"));
			result.put("rst", rst);
			break;
		}
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}
	
	//��� ��û 
	@RequestMapping("/point/withdraw")
	public ModelAndView withdraw(HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_withdraw");
			String email = (String)session.getAttribute("login");
			if(email != null){
				Map map = new HashMap<>();
				map.put("email", email);
				mav.addObject("info",memberDao.emailCheck(map));
				mav.addObject("pointsum",pointDao.selectpointsum(email));
			}
		return mav;
	}
	
	//��� ��û ����
	@RequestMapping("/point/withdrawExec")
	public ModelAndView withdrawExec(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("login");
		map.put("email", email);		
		
		if(session.getAttribute("login") != null){
			boolean result = pointDao.withdraw(map);
			if(result){
				mav.setViewName("redirect:/my/point/wlist");
			}else{
				mav.setViewName("point_withdraw");
				mav.addObject("alert", true);
			}
		}
		return mav;
	}
	
	//��� ����
	@RequestMapping("/point/wlist")
	public ModelAndView wlist(@RequestParam Map map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("point_wlist");
			String email = (String)session.getAttribute("login");
			
			//��Ͽ� ǥ���� ����Ʈ ��
			int pc = 5;
			
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
			map.put("type", "withdraw");
			
			if(email != null){
				map.put("email", email);
				mav.addObject("list", pointDao.selectwithdraw(map));
			}
			
			//����Ʈ �ؿ� ��������
			int eSize = 5;
			int p1 = pointDao.selectcount(map);
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
	
	
	// ���� �κ�
	@RequestMapping("/settings/account")
	public ModelAndView settings(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_account");
			mav.addObject("email",info.get("EMAIL"));
			mav.addObject("certified",info.get("CERTIFIED"));
		return mav;
	}
	@RequestMapping("/settings/certified1")
	public ModelAndView certified1 () {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_certified1");
		return mav;
	}
	@RequestMapping("/settings/certified2")
	public ModelAndView certified2() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_certified2");
		return mav;
	}
	
	@RequestMapping("/settings/profile")
	public ModelAndView profile(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_profile");
			mav.addObject("info",info);
		return mav;
	}
	
	@RequestMapping("/settings/profileExec")
	public ModelAndView profilExec(@RequestParam Map map, @RequestParam(name = "image") MultipartFile f, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		try {
			String my =  (String)session.getAttribute("login");
			
			if(f.getOriginalFilename().length() > 0) {
				File dir = new File(application.getRealPath("/images/profile"));
				if(!dir.exists()) {
					dir.mkdirs();
				}
					
				File dst = new File(dir, my+".png");
				f.transferTo(dst);
				
			}
			
			map.put("image", my+".png");
			map.put("email", my);
			
			String str = myDao.profileUp(map);
			
			System.out.println("uploadExec = " + str);

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("redirect:/my/settings/profile");
		return mav;
	}
	

	
	@RequestMapping("/settings/password")
	public ModelAndView password() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_password");
		return mav;
	}
	
	@RequestMapping("/settings/bank")
	public ModelAndView bank(HttpSession session) {
		Map info = myDao.info((String)session.getAttribute("login"));
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("settings_bank");
			mav.addObject("info",info);
			
		return mav;
	}
	@RequestMapping("/settings/bankExec")
	public ModelAndView bankExec(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String my =  (String)session.getAttribute("login");
		
		map.put("email", my);
		String str = myDao.bank(map);
		
		System.out.println("bankExec = " + str);
		
		mav.setViewName("redirect:/my/settings/bank");

		return mav;
	}
	
	
}







