<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<style>
.loginbox{
	border: 1px solid;
	border-color: #d9d9d9;
	margin: 20px;
	width: auto;
	height: auto;
	padding: 20px;
}
#login-sbt,#login-alert{
	width : 80%;
	height: 60px;
}
#login-email,#login-pw{
	width : 80%;
	height: 40px;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 8px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 5px;
}

.button1 {
	background-color: #303030;
}


</style>   

<div align="center" class="row">
	<div class="col-xs-0 col-md-4"></div>
	<div class="col-xs-12 col-md-4">
		<div class="form-group loginbox row">		
			<form action="/loginExec.mt" method="post">					
				<h3 align="left">로그인 </h3>
				<br/>				
				<div class="form-group row">
						<input class="form-control" type="text"
							placeholder="이메일" name="email" id="login-email" required />
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password"
						placeholder="비밀번호" name="pw" id="login-pw" required />
				</div>
				<c:if test="${flag ne null}">
				<div class="alert alert-danger" id="login-alert">
					<b>입력한 정보가 올바르지 않습니다.</b>
				</div>
				</c:if>
				<div align="center" class="row">

					<div class="form-group" align="right" style="margin-right: 45px;">
					<a style="color: black;">비밀번호 찾기</a>｜<a style="color: black; href="join.mt">회원가입</a>
					</div>
					<button id="login-sbt" type="submit" class="button button1">로그인</button>
				</div>
			</form>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-4"></div>
</div>
