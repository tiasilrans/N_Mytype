<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.joinbox{
	background-color :#fcfcfc;
	margin: 20px;
	width: auto%;
	height: auto%;
	padding: 20px;
}

#sbt,#cnbt{
	width : 80%;
	height: 60px;
}
#email,#pw,#cn{
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
<div class="col-xs-0 col-sm-1 col-md-3 col-lg-3"></div>
<div class="col-xs-12 col-sm-10 col-md-6 col-lg-6" style="width:100%; height:70%; background : url('/images/hero.jpg');">

	<div class="hero" style= "position: relative; padding: 4rem 3rem;">	
	
	<div class="form-group row" style="float: left; margin-top: 50px; margin-left: 150px;">
		<img src="/images/fr.png">
	</div>
	
	
 	<div class="form-group joinbox row" style="width: 30%; float: right; margin-right: 80px; margin-top: 80px;">
			<form action="/joinExec.mt" method="post">	
				<div style="margin-left: 30px;">				
				<h6 align="left" style="color: #999999;">회원가입 </h6>
				</div>
				<br/>				
				<div class="form-group row">
						<input class="form-control" type="email"
							placeholder="이메일" name="email" id="email" required />
						
						<div id="emailtrue" style="display: none;">
						<br/><b>해당 이메일을 사용할 수 있습니다.사용하시겠습니까 ?<br/>
						<button id="emailuse" type="button" class="btn" style="display: block;">확인</button>
						</b>
						</div>	
						
						<b id="emailfalse" style="display: none; color: red"><br/>해당 이메일은 이미 사용중 입니다.</b>
						
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password" placeholder="비밀번호" name="pw" id="pw"required />
				</div>
				
				<div id="cnrow" class="form-group row" style="display: none;">
					<b>※해당 이메일로 인증번호를 발송하였습니다.</b><br/>
					<input class="form-control" type="text"
						placeholder="인증번호" name="cn" id="cn" required />
				</div>
				
				
				<div align="center" class="row">
					<button id="cnbt" type="button" class="button button1" style="display: block;" disabled>이메일인증</button>
					<button id="sbt" type="submit" class="btn" style="display: none;" disabled>회원가입</button>
				</div>
			</form>

		</div>		
	</div>
</div>		


		<div class="section">
			<div class="section">
				<div align="center">
			<img src="/images/head.png" >
				</div>
			</div>
		</div>

		<div class="section">
			<div class="section" style="margin-bottom: 60px; margin-left: 30px;">
				<div align="center">
			<img src="/images/first.png" >
				</div>
			</div>
		</div>
		
		
		<div class="section" style="margin-bottom: 60px; margin-left: -30px;">
			<div class="">
				<div align="center">
			<img src="/images/first2.png" >
				</div>
			</div>
		</div>
		
		
		<div class="section" style="margin-bottom: 60px; ">
			<div class="container">
				<div align="center">
			<img src="/images/second.png">
				</div>
			</div>
		</div>
		
		
		<div class="section" style="margin-bottom: 60px; margin-left: -30px;">
			<div class="container">
				<div align="center";>
			<img src="/images/second2.png">
				</div>
			</div>
		</div>
		
		<div class="section" style="margin-bottom: 60px; margin-left: -30px;">
			<div class="container">
				<div align="center";>
			<img src="/images/third.png">
				</div>
			</div>
		</div>
		
		
		<div class="section" style="margin-bottom: 60px;">
			<div class="container">
				<div align="center";>
			<img src="/images/third2.png">
				</div>
			</div>
		</div>
		
		<div class="section" style="margin-bottom: 200px;">
			<div class="container">
				<div align="center";>
			<img src="/images/third3.png">
				</div>
			</div>
		</div>
		

	
	<div class="col-xs-0 col-sm-1 col-md-3 col-lg-3"></div>
</div>

<c:if test="${uuid ne null }">
<script>
	window.alert("인증번호값을 잘못 입력하였습니다.");	
</script>
</c:if>






<script>
	
	//이메일 인증 버튼 활성화 
	//이메일 비밀번호 텍스트창, 이메일 사용확인 버튼 눌렀을때 이메일 인증 버튼 활성화
	function cnbtDisabled(){
		var e = $("#email").val().length;		//email 길이
		var p = $("#pw").val().length;	//password 길이
		var read = $("#email").prop("readonly");	//이메일 사용 여부
		if( e > 0 && p > 0 && read){
			$("#cnbt").prop("disabled", false);	
		}else{
			$("#cnbt").prop("disabled", true);	
		}
	}
	
	$("#email").keyup(cnbtDisabled);
	$("#pw").keyup(cnbtDisabled);
	$("#emailuse").on("click",cnbtDisabled);

	
	
	
	//이메일 사용여부 
	function emailUse(){
		$("#emailtrue").css("display","none");
		cnbtDisabled();
		$("#email").prop("readonly",true);
	}
	
	$("#emailuse").on("click",emailUse);
	
	
	
	
	//이메일 텍스트창에서 포커스 취소할때 마다 중복확인 이벤트 발생
	function emailCheck(){
		var e = $("#email").val().length;
		if(e > 0){
			$.ajax({
				url:"/emailcheck.mt",
				method : "get",
				data : {
					"email" : $("#email").val(),
				}
			}).done(function(result) {
				var rst = JSON.parse(result);
				if(rst.rst){
					$("#emailtrue").css("display", "block");
					$("#emailfalse").css("display", "none");
				}else{
					$("#emailtrue").css("display", "none");
					$("#emailfalse").css("display", "block");
				}
			});
		}
	}
	
	$("#email").blur(emailCheck);
	
	
	
	//이메일 인증을 눌럿을때의 이벤트
	$("#cnbt").on("click",function(){
		$("#cnrow").css("display", "block");
		$("#cnbt").css("display", "none");
		$("#sbt").css("display", "block");
		$.ajax({
			url:"/emailUuidSend.mt",
			method : "get",
			data : {
				"email" : $("#email").val(),
			}
		})
		
	});

	
	//이메일 비밀번호 인증번호를 모두 입력했을시 회원가입 버튼 활성화
	function sbtDisabled(){
		var e = $("#email").val().length;		//email 길이
		var p = $("#pw").val().length;	//password 길이
		var cn = $("#cn").val().length;	//이메일 사용 여부
		if( e > 0 && p > 0 && cn > 0){
			$("#sbt").prop("disabled", false);	
		}else{
			$("#sbt").prop("disabled", true);	
		}
	}
	$("#email").keyup(sbtDisabled);
	$("#pw").keyup(sbtDisabled);
	$("#cn").keyup(sbtDisabled);
	
	
</script>
























