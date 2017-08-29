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
#email,#pw,#cn{
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
						<br/><b>해당 이메일을 사용할 수 있습니다.사용하시겠습니까 ?<br/>
						<button id="emailuse" type="button" class="btn" style="display: block;">확인</button>
						</b>
						</div>	
						
						<b id="emailfalse" style="display: none;"><br/>해당 이메일은 이미 사용중 입니다.</b>
						
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
					<button id="cnbt" type="button" class="btn" style="display: block;" disabled>이메일인증</button>
					<button id="sbt" type="submit" class="btn" style="display: none;" disabled>회원가입</button>
				</div>
			</form>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-4"></div>
</div>
<script>
	
	//이메일 인증 버튼 활성화 
	//이메일 비밀번호 텍스트창, 이메일 사용확인 버튼 눌렀을때 이메일 인증 버튼 활성화
	function cnbtDisabled(){
		var e = $("#email").val().length;		//email 길이
		var p = $("#pw").val().length;	//password 길이
		var dis = $("#email").prop("disabled");	//이메일 사용 여부
		if( e > 0 && p > 0 && dis){
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
		$("#email").prop("disabled",true);
		cnbtDisabled();
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
























