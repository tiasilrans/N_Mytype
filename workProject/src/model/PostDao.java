package model;

import java.math.BigDecimal;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
@Service
public class PostDao {	
	@Autowired
	SqlSessionFactory factory;
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌘몌옙占쏙옙
	public List<Map> sublist(List<Map> list){
		for(Map map : list){
			String fcontent = (String)map.get("FCONTENT");
			if(fcontent.length() > 75){
				fcontent = fcontent.substring(0, 75);
				fcontent += "...";
				map.put("FCONTENT", fcontent);
			}
		}
		return list;
	}
	
	public boolean postWrite(Map map){
		SqlSession session = factory.openSession();
		try{
			session.insert("post.write", map);
			return true;
		}catch(Exception e){
			System.out.println("postWrite Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		
	}
	
	public boolean postCounter(Map map){
		SqlSession session = factory.openSession();
		try {
			int update = session.update("post.counter", map);				
			return true;			
		} catch (Exception e) {
			System.out.println("postCounter Error");
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
		
	}
	
	public boolean postDelete(Map map){
		SqlSession session = factory.openSession();
		try {
			session.delete("post.delete", map);			
			return true;
		} catch (Exception e) {
			System.out.println("postDelete ERROR .." + e.toString());
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	public List<Map> categoryList(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("post.cate_list", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("categoryList ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}		
	}
	
	// 占쏙옙慣占� 占쏙옙占쏙옙 占쏙옙占쏙옙트 占쏙옙占�
		// 占쏙옙慣占� 占쏙옙 占쏙옙占쏙옙트 占쏙옙	
	public int postCount(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("post.post_count", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("postCount ERROR : " + e.toString());
			return 0;
		}finally {
			session.close();
		}
		
	}
	
		// 占쏙옙慣占� 占쏙옙占쏙옙징
	public List<Map> blogPostList(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("post.main_page_view", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("blogPostList ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}		
	}
	

	public HashMap onePost(Map map){
		SqlSession session = factory.openSession();
		try{
			HashMap r = session.selectOne("post.one_post", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("onePost ERROR : " + e.toString());
			return null;
		}finally {
			session.close();
		}
		
	}
	
	public List<Map> ad_postList(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("post.admin_postList", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ad_postList ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}		
	}
	
	
	
	//占쏙옙체 占쌉시뱄옙 占쌀뤄옙占쏙옙占쏙옙
	public List<Map> listAll(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("post.listall", map);
			return list; 
		}catch(Exception e){
			System.out.println("PostListAll Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	//占쏙옙占쏙옙占쏙옙 占쌉시뱄옙 占쌀뤄옙占쏙옙占쏙옙
	public List<Map> listLike(Map map){
		SqlSession session = factory.openSession();
		
		try{
			return session.selectList("post.listLike", map);
		}catch(Exception e){
			System.out.println("PostListLike Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	// 占승그곤옙 占쏙옙載� 占쏙옙占쏙옙트 占쏙옙占쏙옙트 占쌀뤄옙占쏙옙占쏙옙
	public List<Map> listTag(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		List<Map> result = new ArrayList<>();
		try{
			String keyword = (String)map.get("keyword");
			map.put("keyword", "%"+keyword+"%");
			list = session.selectList("post.listall", map);
			for(Map post : list){
				String[] arr = ((String)post.get("HASH")).split("\\s");
				for(String str : arr){
					if(str.equals(keyword)){
						result.add(post);
					}
				}
			}
			return result; 
		}catch(Exception e){
			System.out.println("PostlistTag Error");
			e.printStackTrace();
			return result;
		}finally{
			session.close();
		}
	}

	//占쏙옙占싣울옙
	public int postgoodAdd(Map map){
		SqlSession session = factory.openSession();
		try{
			int t = session.insert("post.postgoodAdd", map);
			if(t > 0){
				t = session.update("post.postgoodPlus", map);
			}
			return t;
		}catch(Exception e){
			System.out.println("PostgoodAdd Error");
			return 0;
		}finally{
			session.close();
		}
	}
	
	//占쏙옙占싣울옙 占쏙옙占�
	public int postgoodRemove(Map map){
		SqlSession session = factory.openSession();
		try{
			int t = session.delete("post.postgoodRemove", map);
			if(t > 0){
				t = session.update("post.postgoodMinus", map);
			}
			return t;
		}catch(Exception e){
			System.out.println("PostgoodRemove Error");
			return 0;
		}finally{
			session.close();
		}
	}
	
	//占쌔쏙옙占승깍옙 占쌀뤄옙占쏙옙占쏙옙(占싯삼옙占쏙옙占쏙옙)
	public List hashlist(String keyword){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		List result = new ArrayList<>();
		try{
			list = session.selectList("post.selectHashtag", keyword);
			//占쏙옙占쏙옙占쏙옙 占쌔쏙옙占승깍옙 占쏙옙占쏙옙트 占쏙옙占쏙옙占썽서 占쏙옙占시몌옙占싹곤옙 占쏙옙치占쏙옙占쏙옙 확占쏙옙占쏙옙 result占쏙옙 占쌩곤옙 
			for(Map m : list){
				String[] arr = ((String)m.get("HASH")).split("\\s");
				
				for(String ar : arr){
					if(!result.contains(ar) && ar.contains(keyword.substring(1, keyword.length()-1) )){
						result.add(ar);
					}
				}
			}
			return result; 
		}catch(Exception e){
			System.out.println("selectHashtag Error");
			e.printStackTrace();
			return result;
		}finally{
			session.close();
		}
	}
	
	
	//占쌉시뱄옙 占쏙옙占쏙옙 占쏙옙占싹깍옙(占쏙옙占쏙옙징)
	public int selectcount(Map map){
		SqlSession session = factory.openSession();
		Map list = new HashMap<>();
		try{
			list = session.selectOne("post.selectcount", map);
			int result = ((BigDecimal)list.get("COUNT")).intValue();
			return result; 
		}catch(Exception e){
			System.out.println("postSelectCount Error");
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
	
	
	
	
	
	
}
