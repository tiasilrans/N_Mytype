package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailDAO {
	@Autowired
	SqlSessionFactory factory;	
	
	//내용이 길경우 적당히 자르기
	public List<Map> sublist(List<Map> list){
		for(Map map : list){
			String content = (String)map.get("CONTENT");
			if(content.length() > 30){
				content = content.substring(0, 30);
				content += "...";
				map.put("CONTENT", content);
			}
		}
		return list;
	}
	
	public List<Map> mailList(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			String type = (String)map.get("type");
			if(type.equals("send")){
				list = session.selectList("mail.sendlist", map);
			}else{
				list = session.selectList("mail.receivelist", map);
			}
			return sublist(list);
		}catch(Exception e){
			System.out.println("MailSelectlist Error");
			e.printStackTrace();
			return sublist(list);
		}finally{
			session.close();
		}
	}
	
	
	public boolean send(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.insert("mail.sendinsert", map);
			i = session.insert("mail.receiveinsert", map);
			return true;
		}catch(Exception e){
			System.out.println("MailSend Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public Map mailView(Map map){
		SqlSession session = factory.openSession();
		Map list = new HashMap();
		try{
			String type = (String)map.get("type");
			list = session.selectOne("mail.selectView", map);
			return list;
		}catch(Exception e){
			System.out.println("MailSelectlist Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	public boolean deletemail(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.delete("mail.deletemail", map);
			return true;
		}catch(Exception e){
			System.out.println("DeleteMail Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	//게시물 갯수 구하기(페이징)
	public int selectcount(Map map){
		SqlSession session = factory.openSession();
		Map list = new HashMap<>();
		try{
			list = session.selectOne("mail.selectcount", map);
			int result = ((BigDecimal)list.get("COUNT")).intValue();
			return result; 
		}catch(Exception e){
			System.out.println("Mailselectcount Error");
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
}
