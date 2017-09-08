<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">    
    
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
	String today = ft.format(new java.util.Date());
%>

<link rel="stylesheet" href="/css/my.css">

<div class="col-xs-offset-1 col-md-offset-1 container-fluid">
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>오늘</b></span>
			<span style="float:right; font-size: 13px; padding-right:15px; color: #999999;" ><%=today %></span>
		</div>  
		<br/><hr/>
		<div align="left">
			<div class="lbox" >
				<a style="text-decoration: none;">
					<span class="boxsp">포인트 잔액</span> <br/>
					<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">monetization_on</label></span> 0p
				</a>
            </div>
            <div class="rbox" > 
            	<a style="text-decoration: none;">
					<span class="boxsp">출금 가능 금액</span> <br/>
					<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">account_balance</label></span>0p 
				</a>
			
            </div>
            <hr/>
            <div class="lbox" >
            <a style="text-decoration: none;">
            	<span class="boxsp">수익</span> <br/>
            	<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">store</label></span> 0p
            </a>
            </div>  
            <div class="rbox">
            	<a style="text-decoration: none;">
            		<span class="boxsp">구매/후원</span> <br/>
            		<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">card_giftcard</label></span> <span>0p</span> 
            	</a>
            
            </div>  
		</div>
	</div>
	
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px;"><b>좋아요</b></span>
			<span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none; color: #999999;" href="/my/goods"> 더 보기 > </a> 
			</span>
			<br/><br/>
			<div class="incard" style="float: left;" >
				<div class="title">
					<a style="float:left; padding-right: 10px;"><img src="/images/avatar_yellow.png" style="border-radius: 50%;" width="40px" height="40px" /></a>
					<div>소히</div>
					<div style="color:#909090; font-size: 11px;">6일전 · TEST</div>
				</div>
                <div style="height:50px; margin:12px; padding-bottom: 3px;">
                	<div style="font-size: 15px; padding-bottom: 5px; ">제목 없음</div>
                	<div style="color:#909090; font-size: 13px; overflow: hidden;">
                		테스트글입니다.
                		
						데이터 보호 및 정보 관리 전문 기업 컴볼트가 '클라우드 도입 시에 기업 경영진의 고려사항' 
						
						주제로 실행한 설문조사 결과를 8월25일 발표했다.
						
                	</div>
                </div>
                <div style="margin:12px; padding-top: 17%;" >
                	<span class="glyphicon glyphicon-heart"></span>
                </div>
			</div>
			
			<div class="incard" style=" margin-left: 20px; clear: right;" >
				<div class="title">
					<a style="float:left; padding-right: 10px;"><img src="/images/avatar_yellow.png" style="border-radius: 50%;" width="40px" height="40px" /></a>
					<div>소히</div>
					<div style="color:#909090; font-size: 11px;">6일전 · TEST</div>
				</div>
                <div style="height:50px; margin:12px; padding-bottom: 3px;">
                	<div>~제목 없음~</div>
                	<div style="color:#909090; font-size: 13px; overflow: hidden;">
                		테스트글입니다.
                		
						데이터 보호 및 정보 관리 전문 기업 컴볼트가 '클라우드 도입 시에 기업 경영진의 고려사항' 
						
						주제로 실행한 설문조사 결과를 8월25일 발표했다.
						
                	</div>
                </div>
                <div style="margin:12px; padding-top: 17%;" >
                	<span class="glyphicon glyphicon-heart"></span>
                </div>
			</div>
			
		</div>
	</div>

    <div class="card col-xs-3 col-md-3 col-lg-2">
		<div class="title">
          <span style="float:left; font-size: 17px;"><b>공지사항</b></span>
          <span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none; color: #999999;"> 더 보기 > </a> 
			</span>
        </div>
	</div>
	
</div>







    