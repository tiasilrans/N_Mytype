package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	
	public boolean replyWrite(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.insert("reply.write", map);			
			return true;		
		}catch(Exception e){
			System.out.println("replyWrite Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public List<Map> replyList(Map map){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("reply.list", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("replyList ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}			
	}
	
	
	public int postReplyCount(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("reply.post_reply_count", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("postReplyCount ERROR : " + e.toString());
			return 0;
		}finally {
			session.close();
		}
		
	}
	
	
	
	
	
	
	
	

}
