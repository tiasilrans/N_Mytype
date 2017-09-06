package model;

import java.util.*;

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
			int r = session.insert("blog.create", map);
			if(r==1){
				session.insert("blog.create_cate", map);
				return true;
			}else{
				return false;
			}
			
		}catch(Exception e){
			System.out.println("BlogCreate Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public HashMap blogView(Map map){
		SqlSession session = factory.openSession();				
		try {
			HashMap r = session.selectOne("blog.view", map);
			return r;
		} catch (Exception e) {
			System.out.println("blogView : " + e.toString());
			return null;
		}finally {
			session.close();
		}		
	}
	
	public boolean categoryAdd(Map map){
		SqlSession session = factory.openSession();
		try{
			session.insert("blog.category_add", map);
			return true;
		}catch(Exception e){
			System.out.println("categoryAdd Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public List<Map> cate_List(Map map){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("blog.oneBlog_cList", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cate_List ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}			
	}
	
	
	
	public List<Map> mybloglist(Map map){
		SqlSession session = factory.openSession();				
		try {
			List<Map> r = session.selectList("blog.mybloglist", map);
			return r;
		} catch (Exception e) {
			System.out.println("mybloglist : " + e.toString());
			return null;
		}finally {
			session.close();
		}		
	}

}
