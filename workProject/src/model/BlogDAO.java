package model;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogDAO {
	
	@Autowired
	SqlSessionFactory factory;	
	
	public boolean blogCreate(Map map){
		SqlSession session = factory.openSession();
		try{
			session.insert("blog.create", map);
			return true;
		}catch(Exception e){
			System.out.println("BlogCreate Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}

}
