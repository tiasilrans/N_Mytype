package model;

import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDAO {
	@Autowired
	SqlSessionFactory factory;	
	
	public List<Map> sublistReply(List<Map> list, int size, String con, String subcon){
		for(Map map : list){
			String fcontent = (String)map.get(con);
			if(fcontent.length() > size){
				fcontent = fcontent.substring(0, size);
				fcontent += "...";
				map.put(subcon, fcontent);
			}
		}
		return list;
	}
	
	public List<Map> memberList(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
				list = session.selectList("admin.selectMember", map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectMember Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<Map> blogList(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("admin.selectBlog", map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectBlog Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<Map> selectPost(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("admin.selectPost", map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectPost Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	
	public List<Map> replyList(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
				list = session.selectList("admin.selectReply", map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectReply Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public boolean sendmessage(Map map){
		SqlSession session = factory.openSession();
		try{
			String[] arr = (String[])map.get("email");
			String content = (String)map.get("content");
			Map send = new HashMap();
			map.put("content", content);
			map.put("admin", "MyType");
			for(String str : arr){
				int i  = session.insert("admin.sendinsert", map);
				map.put("email", str);
				i  = session.insert("admin.receiveinsert", map);
			}
			return true;
		}catch(Exception e){
			System.out.println("AdminSendMail Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public boolean deletePost(Map map){
		SqlSession session = factory.openSession();
		try{
			int i  = session.delete("admin.deletePost", map);
			return true;
		}catch(Exception e){
			System.out.println("AdminDeletePost Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public boolean deleteReply(Map map){
		SqlSession session = factory.openSession();
		try{
			int i  = session.delete("admin.deleteReply", map);
			return true;
		}catch(Exception e){
			System.out.println("AdminDeleteReply Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public List<Map> selectDepositApply(){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list  = session.selectList("admin.selectDepositApply");
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectDepositApply Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<Map> selectWithdrawApply(){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list  = session.selectList("admin.selectWithdrawApply");
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectWithdrawApply Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<Map> selectDeposit(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list  = session.selectList("admin.selectDeposit",map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectDeposit Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<Map> selectWithdraw(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list  = session.selectList("admin.selectWithdraw",map);
			return list;
		}catch(Exception e){
			System.out.println("AdminSelectWithdraw Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public boolean applyCharge(Map map){
		SqlSession session = factory.openSession();
		try{
			int i  = session.update("admin.applyCharge", map);
			i  = session.insert("admin.Charge", map);
			return true;
		}catch(Exception e){
			System.out.println("AdminApplyCharge Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public boolean applyWithdraw(Map map){
		SqlSession session = factory.openSession();
		try{
			int i  = session.update("admin.applyWithdraw", map);
			return true;
		}catch(Exception e){
			System.out.println("AdminApplyWithdraw Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public List<Map> noticeList(String type){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
/*			if(type.equals("main")){
				Map map = new HashMap();
				long first = System.currentTimeMillis()-(1000*60*60*24*7); 
				long last = System.currentTimeMillis()+(1000*60*60*24*7); 
				SimpleDateFormat week = new SimpleDateFormat("yy-MM-dd");
				map.put("type", "main");
				map.put("first", week.format(first));
				map.put("last", week.format(last));
				list = session.selectList("admin.noticeList", map);
				list = this.sublistReply(list, 180, "CONTENT", "SUBCONTENT");
			}*/
			list = session.selectList("admin.noticeList");
			list = this.sublistReply(list, 180, "FCONTENT", "SUBCONTENT");
			return list;
		}catch(Exception e){
			System.out.println("AdminNoticeList Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
}
