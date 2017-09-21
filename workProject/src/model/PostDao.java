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
	//fcontent에서 이미지 따로 빼서 IMG으로 map.put / fcontent는 글만 적용 
	public List<Map> imgRedefinition(List<Map> list){
		for(Map m :list){
			String[] arr = ((String)m.get("FCONTENT")).split("</p>");
			String fc = "";//글만
			String img = "";//사진만
			for(String ar : arr){
				ar += "</p>";
				if(ar.indexOf("froala") > -1){
					if(img.length() == 0){
						ar = ar.replaceAll("<br>", "");
						ar = ar.replaceAll("\">", "\"onerror=\"this.src='/images/error.jpg'\">");
						System.out.println(ar);
						img+=ar;
					}
				}else{
					fc+=ar;
				}
			}
			m.put("FCONTENT", fc);
			m.put("IMG", img);
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
	
	public boolean postEdit(Map map){
		SqlSession session = factory.openSession();
		try {
			int update = session.update("post.edit", map);				
			return true;			
		} catch (Exception e) {
			System.out.println("replyEdit Error");
			e.printStackTrace();
			return false;
		}finally {
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
	
	
	public int postLikeCount(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("post.post_Like_count", map);
			return r;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("postLikeCount ERROR : " + e.toString());
			return 0;
		}finally {
			session.close();
		}
		
	}
	
	
	
	public List<Map> blogPostList(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			System.out.println(map);
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
	
	
	
	public List<Map> categoryPostList(Map map){		
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("post.category_post_list", map);			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("categoryPostList ERROR : " + e.toString());
			return list;
		}finally {
			session.close();
		}		
	}
	

	public List<Map> listAll(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("post.listall", map);
			list = this.imgRedefinition(list);
			return list; 
		}catch(Exception e){
			System.out.println("PostListAll Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	

	public List<Map> listLike(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("post.listLike", map);
			list = this.imgRedefinition(list);
			return list;
		}catch(Exception e){
			System.out.println("PostListLike Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	

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
			list = this.imgRedefinition(list);
			return result; 
		}catch(Exception e){
			System.out.println("PostlistTag Error");
			e.printStackTrace();
			return result;
		}finally{
			session.close();
		}
	}


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
	

	public List hashlist(String keyword){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		List result = new ArrayList<>();
		try{
			list = session.selectList("post.selectHashtag", keyword);
 
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
	
	public boolean buyCheck(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		boolean buy = false;
		try{
			list = session.selectList("post.buyCheck", map);
			if(list.size() > 0){
				buy =true;
			}
			return buy; 
		}catch(Exception e){
			System.out.println("PostBuyCheck Error");
			e.printStackTrace();
			return buy;
		}finally{
			session.close();
		}
	}
	
	public boolean buyPost(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.insert("point.buypostlog", map);
			i = session.insert("point.salespostlog", map);
			i = session.insert("point.buypost", map);
			return true; 
		}catch(Exception e){
			System.out.println("PostBuyPost Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public boolean surpport(Map map){
		SqlSession session = factory.openSession();
		try{
			int i = session.insert("point.support", map);
			i = session.insert("point.supportlog", map);
			i = session.insert("point.supportedlog", map);
			return true; 
		}catch(Exception e){
			System.out.println("PostSupport Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	public List<Map> blogSearch(Map map){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		try{
			list = session.selectList("post.search", map);
			return list; 
		}catch(Exception e){
			System.out.println("blogSearch Error");
			e.printStackTrace();
			return list;
		}finally{
			session.close();
		}
	}
	
	
	
	
}
