package model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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
	
	public boolean pwchange(Map map) {
		SqlSession session = factory.openSession();
		try{
			session.update("my.pwhchange",map);
			session.commit();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	
	public String revenue(Map map) {
		SqlSession session = factory.openSession();
		String rvn ="";
		try{
			if(map.get("sysdate") != null){
				long sys = System.currentTimeMillis();
				long sys2 = System.currentTimeMillis()+(24*60*60*1000);
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
				map.put("first", sdf.format(sys));
				map.put("last", sdf.format(sys2));
				Map post = session.selectOne("my.postRevenue",map);
				Map support = session.selectOne("my.supportRevenue",map);
				rvn += ((BigDecimal)post.get("SUM")).intValue()+((BigDecimal)support.get("SUM")).intValue();
			}
			session.commit();
			return rvn;
		}catch(Exception e){
			e.printStackTrace();
			return "0";
		}finally{
			session.close();
		}
	}
	
	public String usepoint(Map map) {
		SqlSession session = factory.openSession();
		String rvn ="";
		try{
			if(map.get("sysdate") != null){
				long sys = System.currentTimeMillis();
				long sys2 = System.currentTimeMillis()+(24*60*60*1000);
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
				map.put("first", sdf.format(sys));
				map.put("last", sdf.format(sys2));
				Map buy = session.selectOne("my.buyUse",map);
				Map support = session.selectOne("my.supportUse",map);
				rvn += ((BigDecimal)buy.get("SUM")).intValue()+((BigDecimal)support.get("SUM")).intValue();
			}
			session.commit();
			return rvn;
		}catch(Exception e){
			e.printStackTrace();
			return "0";
		}finally{
			session.close();
		}
	}
	
	
}