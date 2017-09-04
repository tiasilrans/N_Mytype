<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
	String today = ft.format(new java.util.Date());
%>

<link rel="stylesheet" href="/css/my.css">

<div class="col-xs-offset-1 col-md-offset-1 container-fluid">
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px;"><b>오늘</b></span>
			<span style="float:right; font-size: 13px; padding-right:15px;"><%=today %></span>
		</div>
		<br/><hr/>
		<div align="left">
			<div class="lbox" >
				<a style="text-decoration: none;">
					<span class="boxsp">포인트 잔액</span> <br/>
					<span class="glyphicon glyphicon-usd boxsp bicon"></span> 0p
				</a>
            </div>
            <div class="rbox" >
            	<a style="text-decoration: none;">
					<span class="boxsp">출금 가능 금액</span> <br/>
					<span class="glyphicon glyphicon-piggy-bank boxsp bicon"></span> 0p
				</a>
            </div>
            <hr/>
            <div class="lbox" >
            <a style="text-decoration: none;">
            	<span class="boxsp">수익</span> <br/>
            	<span class="glyphicon glyphicon-saved boxsp bicon"></span> 0p
            </a>
            </div>
            <div class="rbox">
            	<a style="text-decoration: none;">
            		<span class="boxsp">구매/후원</span> <br/>
            		<span class="glyphicon glyphicon-gift boxsp bicon"></span> 0p
            	</a>
            </div>
		</div>
	</div>
	
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px;"><b>좋아요</b></span>
			<span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none;" href="/my/goods"> 더 보기 > </a> 
			</span>
			<br/><br/>
			<div class="incard" >
				<div class="title">
					<a style="float:left; padding-right: 10px;"><img src="/images/basic.png" width="40px" height="40px" /></a>
					<div>소히</div>
					<div>6일전 · TEST</div>
				</div>
                <div style="margin:12px; padding-bottom: 3px;">
                	<div>제목 없음</div>
                	<div>
                		테스트글입니다.
                		
						데이터 보호 및 정보 관리 전문 기업 컴볼트가 '클라우드 도입 시에 기업 경영진의 고려사항' 
						
						주제로 실행한 설문조사 결과를 8월25일 발표했다.
						
						기업 임원 81%, 클라우드 도입에 뒤처지는 것에 염려
                	</div>
                </div>
                <div style="margin:12px; padding-bottom: 3px;">
                	<span class="glyphicon glyphicon-heart"></span>
                </div>
			</div>
		</div>
	</div>

    <div class="card col-xs-3 col-md-3 col-lg-2">
		<div class="title">
          <span style="float:left; font-size: 17px;"><b>공지사항</b></span>
          <span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none;"> 더 보기 > </a> 
			</span>
        </div>
	</div>
	
</div>







    