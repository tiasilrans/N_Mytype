<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

a:hover {
	text-decoration: none;
}

label{
	width: 80px;
	font-weight: normal;
	margin-right: 24%;
}


.tertiary-nav {
    height: 43px;
    border-bottom: 1px solid rgba(0,0,0,.075);
}

.box {

	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
}

.card-block {
	margin-left: 10px;
    padding: 15px;
    position: relative;
    vertical-align:middle;
}

</style>

  
<form class="form-inline form-horizontal" method="post" >
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12" >
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>계정 설정</b></span>
		</div>
		<br/><hr/>
		<div class="card-block">
			<div style="padding-bottom: 10px; font-size:17px;">이메일 설정</div>
			<label style="color: #606060;" >이메일</label>
			<div class="input-group" style="width: 65%;">
				<input type="text" name="username" value="${email }" class="form-control" >
				<span class="input-group-addon" style="background-color:white; width:5%;">
					<i class="fa fa-check-circle" style="font-size:20px; color:#14c880;"></i>
				</span>
			</div>
		</div>
	    <br/><hr style="margin: 0px;" />
	    <div class="card-block">
	    	<div style="font-size:17px;">성인 확인</div>
	    	<p style="color:#909090; font-size: 13px;">성인 콘텐츠를 보거나 게시하기 위해서는 성인 확인이 필요합니다.</p>
	    	<label style="color: #606060;">성인 확인</label>
	    	<c:choose>
	    		<c:when test="${certified ne 'Y' }">
	    			<!-- 
	    			<button class="w3-button w3-white w3-border w3-round-large"><a href="/my/settings/certified1">성인 확인하기(휴대전화)</a></button>
	    			-->
	    			<button class="w3-button w3-white w3-border w3-round-large"><a href="/my/settings/certified2">성인 확인하기(신분증)</a></button>
	    		</c:when>
	    		<c:otherwise>
	    			<span><i class="fa fa-check-circle" style="font-size:20px; color:#14c880;"></i> 완료</span>
	    		</c:otherwise>
	    	</c:choose>
	    </div>
	    <hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<a href="#" style="color:#909090; font-size: 12px">계정 삭제</a>
	    	<!-- 
	    	<button class="w3-button w3-black w3-round" style="float:right">변경 내용 저장</button>
	    	-->
	    </div>
	</div>
</form>

