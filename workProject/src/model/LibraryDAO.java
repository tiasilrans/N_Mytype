package model;

import java.math.BigDecimal;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LibraryDAO {
	@Autowired
	SqlSessionFactory factory;	
		
	public List<Map> List(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			String type = (String)map.get("type");
			if(type.equals("buy")){
				list = session.selectList("library.buylist", map);
			}else{
				list = session.selectList("library.likelist", map);
			}
			return list;
		}catch(Exception e){
			System.out.println("LibraryList Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	
	//게시물 갯수 구하기(페이징)
	public int selectcount(Map map){
		SqlSession session = factory.openSession();
		Map list = new HashMap<>();
		try{
			String type = (String)map.get("type");
			if(type.equals("buy")){
				list = session.selectOne("library.selectbuycount", map);
			}else{
				list = session.selectOne("library.selectlikecount", map);
			}
			int result = ((BigDecimal)list.get("COUNT")).intValue();
			return result; 
		}catch(Exception e){
			System.out.println("Libraryselectcount Error");
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
	
	// 내가 좋아요 누른 포스트 가져오기 
	public List<Map> likelist(Map map){
		SqlSession session = factory.openSession();
		try{
			return session.selectList("library.likelist", map);
		}catch(Exception e){
			System.out.println("likelist Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
}