package model;

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

}
