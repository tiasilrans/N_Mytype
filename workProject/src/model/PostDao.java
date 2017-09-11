package model;

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
	
	//내용이 길경우 적당히 자르기
	public List<Map> sublist(List<Map> list){
		for(Map map : list){
			String fcontent = (String)map.get("FCONTENT");
			if(fcontent.length() > 148){
				fcontent = fcontent.substring(0, 148);
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
	
	
	
	
	//전체 게시물 불러오기
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
	
	//구독한 게시물 불러오기
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

	//좋아요
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
	
	//좋아요 취소
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
	
	//해쉬태그 불러오기(검색바쪽)
	public List hashlist(String keyword){
		SqlSession session = factory.openSession();
		List<Map> list = new ArrayList<>();
		List result = new ArrayList<>();
		try{
			list = session.selectList("post.selectHashtag", keyword);
			//가져온 해쉬태그 리스트 돌리면서 스플릿하고 겹치는지 확인후 result에 추가 
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
	
}
