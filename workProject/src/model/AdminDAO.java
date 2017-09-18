package model;

import java.util.ArrayList;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDAO {
	@Autowired
	SqlSessionFactory factory;	
	
	// 리스트중 내용이 길경우 적당히 자르기
	public List<Map> sublistReply(List<Map> list, int size, String con, String subcon){
		//con : 자를 내용 / subcon : 자르고 저장할때 지정할 이름
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
	
	//멤버리스트
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
	
	//블로그 리스트
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
	
	// 포스트 리스트
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
	
	
	//댓글 리스트
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
	
	//쪽지 보내기
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
	
	//포스트 삭제
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
	
	//댓글 삭제
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
	
	//충전 신청 내역
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
	
	//출금 신청 내역
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
	
	//(개인)충전 신청 내역
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
	
	//(개인)출금 신청 내역
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
	
	//충전 승인
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
	
	//출금 승인
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
	
}
