<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
}

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

.scard {
    position: relative;
    display: block;
    width : 850px;
	height: 53%;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
}

.card-block {
	margin-left: 10px;
    padding: 15px;
    position: relative;
    vertical-align:middle;
}

</style>

<nav id="tertiary-nav" class="tertiary-nav navbar scroll-x">
	<div class="col-xs-offset-1 col-md-offset-1">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="/my/settings/account">계정</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/settings/profile">프로필</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/settings/password">비밀번호</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/settings/bank">수익</a>
            </li>
        </ul>
    </div>
</nav>
  
<form class="form-inline form-horizontal">
	<div class="scard col-xs-offset-1 col-md-offset-1">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>계정 설정</b></span>
		</div>
		<br/><hr/>
		<div class="card-block">
			<div style="padding-bottom: 10px; font-size:17px;">이메일 설정</div>
			<label style="color: #606060;" >이메일</label>
			<div class="input-group" style="width: 65%;">
				<input type="text" name="username" class="form-control" >
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
	    		<c:when test="${sessionScope.login eq null }">
	    			<button class="w3-button w3-white w3-border w3-round-large">성인 확인하기(휴대전화)</button>
	    			<button class="w3-button w3-white w3-border w3-round-large">성인 확인하기(신분증)</button>
	    		</c:when>
	    		<c:otherwise>
	    			<span><i class="fa fa-check-circle" style="font-size:20px; color:#14c880;"></i> 완료</span>
	    		</c:otherwise>
	    	</c:choose>
	    </div>
	    <hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<a href="#" style="color:#909090; font-size: 12px">계정 삭제</a>
	    	<button class="w3-button w3-black w3-round" style="float:right">변경 내용 저장</button>
	    </div>
	</div>
</form>


