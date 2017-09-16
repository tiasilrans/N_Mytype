package model;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MyDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	public Map info(String email){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("my.info", email);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	public String profileUp(Map map) {
		SqlSession session = factory.openSession();
		try{
			session.update("my.profileUp",map);
			session.commit();
			return "Success";
		}catch(Exception e){
			e.printStackTrace();
			return "Fail";
		}finally{
			session.close();
		}
	}
	
	public String bank(Map map) {
		SqlSession session = factory.openSession();
		try{
			session.update("my.bank",map);
			session.commit();
			return "Success";
		}catch(Exception e){
			e.printStackTrace();
			return "Fail";
		}finally{
			session.close();
		}
	}
	
	public String pwchange(Map map) {
		SqlSession session = factory.openSession();
		try{
			session.update("my.pwhchange",map);
			session.commit();
			return "Success";
		}catch(Exception e){
			e.printStackTrace();
			return "Fail";
		}finally{
			session.close();
		}
	}
	
	
	
}