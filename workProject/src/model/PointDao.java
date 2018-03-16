package model;

import java.math.BigDecimal;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
@Service
public class PointDao {	
	@Autowired
	SqlSessionFactory factory;
	
	//포인트 충전
	public boolean pointcharge(Map map){
		SqlSession session = factory.openSession();
		boolean flag = false;
		try{
			session.insert("point.charge", map);
			return true;
		}catch(Exception e){
			System.out.println("pointCharge Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	//포인트 충전 취소
	public boolean chargeCancel(String num){
		SqlSession session = factory.openSession();
		boolean flag = false;
		try{
			session.insert("point.chargeCancel", num);
			return true;
		}catch(Exception e){
			System.out.println("pointchargeCancel Error");
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
	}
	
	//포인트 충전 신청 내역 불러오기
	public List<Map> selectdeposit(Map map){
		SqlSession session = factory.openSession();
		try{
			return session.selectList("point.selectdeposit", map);
		}catch(Exception e){
			System.out.println("selectDeposit Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	//포인트 사용 신청 내역 불러오기
	public List<Map> selectpoint(Map map){
		SqlSession session = factory.openSession();
		try{
			return session.selectList("point.selectpoint", map);
		}catch(Exception e){
			System.out.println("Selectpoint Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	//출금 내역 불러오기
	public List<Map> selectwithdraw(Map map){
		SqlSession session = factory.openSession();
		try{
			return session.selectList("point.selectwithdraw", map);
		}catch(Exception e){
			System.out.println("selectWithdraw Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	//잔여 포인트 조회 (SUM)
	public Map selectpointsum(String email){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("point.selectpointsum", email);
		}catch(Exception e){
			System.out.println("selectPoinSum Error");
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	//출금 신청
	public boolean withdraw(Map map){
		SqlSession session = factory.openSession();
		boolean flag = false;
		try{
			/* 1. 처음에 포인트 로그에 추가 후
			 * 2. 추가한 로그의 번호를 가져와서
			 * 3. map에 다시넣어서 출금내역에 추가
			 * */
			session.insert("point.withdrawlog", map);
			Map num = session.selectOne("point.selectpnum", map);
			String pnum = ((BigDecimal)num.get("NUM")).toString();
			map.put("num", pnum);
			System.out.println(map);
			session.insert("point.withdraw", map);
			return true;
		}catch(Exception e){
			System.out.println("withdraw Error");
			e.printStackTrace();
			session.rollback();
			return false;
		}finally{
			session.close();
		}
	}
	
	//출금 취소
	public boolean withdrawCancel(String num){
		SqlSession session = factory.openSession();
		boolean flag = false;
		try{
			session.delete("point.withdrawCancel", num);
			session.delete("point.withdrawlogCancel", num);
			return true;
		}catch(Exception e){
			System.out.println("withdrawCancel Error");
			e.printStackTrace();
			session.rollback();
			return false;
		}finally{
			session.close();
		}
	}
	
	//갯수 구하기(페이징)
	public int selectcount(Map map){
		SqlSession session = factory.openSession();
		Map list = new HashMap<>();
		try{
			list = session.selectOne("point.selectcount", map);
			int result = ((BigDecimal)list.get("COUNT")).intValue();
			return result; 
		}catch(Exception e){
			System.out.println("PointSelectCount Error");
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
	
	
}
