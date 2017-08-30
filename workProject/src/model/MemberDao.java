package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
@Service
public class MemberDao {	
	@Autowired
	SqlSessionFactory factory;
	
	public void join(Map map){
		SqlSession session = factory.openSession();
		try{
			int a = session.insert("member.join", map);
		}catch(Exception e){
			System.out.println("MemberJoin Error");
		}finally{
			session.commit();
		}
	}
	
	public Map emailCheck(Map map){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("member.emailCheck", map);
		}catch(Exception e){
			System.out.println("MemberEmailCheck Error");
			return null;
		}finally{
			session.commit();
		}
	}
	
	public Map Login(Map map){
		SqlSession session = factory.openSession();
		
		try{
			return session.selectOne("member.login", map);
		}catch(Exception e){
			System.out.println("Memberlogin Error");
			return null;
		}finally{
			session.commit();
		}
	}
}
