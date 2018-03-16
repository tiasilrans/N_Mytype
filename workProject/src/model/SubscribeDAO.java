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
	
	
	public HashMap subCheck(Map map){
		SqlSession session = factory.openSession();
		try{
			HashMap r = session.selectOne("subscribe.sub_check", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("subCheck ERROR : " + e.toString());
			return null;
		}finally {
			session.close();
		}
		
	}
	
	
	public HashMap subCount(Map map){
		SqlSession session = factory.openSession();
		try{
			HashMap r = session.selectOne("subscribe.count", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("subCount ERROR : " + e.toString());
			return null;
		}finally {
			session.close();
		}
		
	}
	
	
		
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
	
	
	//�Խù� ���� ���ϱ�(����¡)
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
	
	
	//구독취소
	public boolean deletesubscribe(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.delete("subscribe.deletesubscribe", map);
			return true; 
		}catch(Exception e){
			System.out.println("SubscribeDelete Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}

	//구독하기
	public boolean insertsubscribe(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.insert("subscribe.insertsubscribe", map);
			return true; 
		}catch(Exception e){
			System.out.println("SubscribeInsert Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	// 블로그 설정 구독자들
	public List<Map> blogSubscribers(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("subscribe.subscribers", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("blogSubscribers ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}		
	}
	
	
	
	
	
	
	
	
	
}
