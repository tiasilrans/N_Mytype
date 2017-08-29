<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.joinbox{
	border: 1px solid;
	border-color: #d9d9d9;
	margin: 20px;
	width: auto%;
	height: auto;
	padding: 20px;
}

#sbt,#cnbt{
	width : 360px;
	height: 60px;
}
#email,#password,#cn{
	width : 360px;
	height: 40px;
}


</style>   

<div align="center" class="row">
	<div class="col-xs-0 col-md-4"></div>
	<div class="col-xs-12 col-md-4">
		
 <div class="form-group joinbox row" >
			<form action="/" method="post">					
				<h3 align="left">회원가입 </h3>
				<br/>				
				<div class="form-group row">
						<input class="form-control" type="email"
							placeholder="e-mail" name="email" id="email" required />
						
						<div id="emailtrue" style="display: none;">
						<b><br/>해당 이메일을 사용할 수 있습니다.사용하시겠습니까 ?
						<button id="emailuse" type="button" class="btn" style="display: block;">확인</button>
						</b>
						</div>	
						
						<b id="emailfalse" style="display: none;"><br/>해당 이메일은 이미 사용중 입니다.</b>
						
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password" placeholder="비밀번호" name="pw" id="pw"required />
				</div>
				
				<div id="cnrow" class="form-group row" style="display: none;">
					<b>※해당 이메일로 인증번호를 발송하였습니다.</b>
					<input class="form-control" type="text"
						placeholder="인증번호" name="cn" id="cn" required /><br/>
				</div>
				
				
				<div align="center" class="row">
					<button id="cnbt" type="button" class="btn" style="display: block;" disabled>이메일인증</button>
					<button id="sbt" type="submit" class="btn" style="display: none;" disabled>회원가입</button>
				</div>
			</form>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-4"></div>
</div>










