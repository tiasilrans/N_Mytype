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
	
	// 댓글 내용이 길경우 적당히 자르기
	public List<Map> sublistReply(List<Map> list, int size){
		for(Map map : list){
			String fcontent = (String)map.get("CONTENT");
			if(fcontent.length() > size){
				fcontent = fcontent.substring(0, size);
				fcontent += "...";
				map.put("SUBCONTENT", fcontent);
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
	
	
}
