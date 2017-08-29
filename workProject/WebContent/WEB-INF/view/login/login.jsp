<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
#sbt{
	width : 360px;
	height: 60px;
}
#email,#password{
	width : 360px;
	height: 40px;
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
						<input class="form-control" type="email"
							placeholder="e-mail" name="email" id="email" required />
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password"
						placeholder="비밀번호" name="password" id="password" required />
				</div>
				<div align="center" class="row">

					<div class="form-group" align="right" style="margin-right: 45px;">
					<a>비밀번호 찾기</a>｜<a>회원가입</a>
					</div>
					<button id="sbt" type="submit" class="btn">로그인</button>
				</div>
			</form>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-4"></div>
</div>
