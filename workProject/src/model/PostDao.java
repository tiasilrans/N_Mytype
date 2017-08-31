package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
@Service
public class PostDao {	
	@Autowired
	SqlSessionFactory factory;
		
	public List<Map> listAll(){
		SqlSession session = factory.openSession();
		
		try{
			return session.selectList("post.listAll");
		}catch(Exception e){
			System.out.println("PostListAll Error");
			return null;
		}finally{
			session.close();
		}
	}
	
	public List<Map> listLike(String email){
		SqlSession session = factory.openSession();
		
		try{
			return session.selectList("post.listLike", email);
		}catch(Exception e){
			System.out.println("PostListLike Error");
			return null;
		}finally{
			session.close();
		}
	}
	
}
