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
public class SubscribeDAO {
	@Autowired
	SqlSessionFactory factory;	
		
	public List<Map> blogList(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			String type = (String)map.get("type");
			if(type.equals("blog")){
				list = session.selectList("subscribe.list", map);
			}
			return list;
		}catch(Exception e){
			System.out.println("SubscribeList Error");
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
			list = session.selectOne("subscribe.selectcount", map);
			int result = ((BigDecimal)list.get("COUNT")).intValue();
			return result; 
		}catch(Exception e){
			System.out.println("Subscribeselectcount Error");
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
}
