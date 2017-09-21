<%@ page language="java" contentType="text/html; charset=UTF-8R"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
}

</style>


<form class="form-inline form-horizontal" action="/my/settings/passwordExec">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>회원 탈퇴</b></span>
		</div>
		<br/><hr/>
		<div class="card-block ">
			<label style="color: #606060;">비밀번호</label>
			<div class="form-group" style="margin-left: 1.5px;">
				<input type="password" id="pw1" name="newpw" class="form-control" style="width: 525px;" placeholder="비밀번호" required>
			</div>
		</div>
		<div style="margin-left: 300px;"><p><span style="color:red; font-size: 15px;" id="result"></span></p></div>
		<div class="card-block">
			<label style="color: #606060;">MyType에게 한마디</label>
			<textarea id="survey" name="survey" class="form-control"  cols="40" rows="5"  style="width: 525px; resize: none;"  required></textarea>
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<button id="sbtn" class="w3-button w3-black w3-round" style="float:right" disabled>탈퇴하기</button>
	    </div>
	</div>
</form>
<c:if test="${change}">
<script>
	window.alert("비밀번호 변경 완료!");
</script>
</c:if>

<script>
	function pwcheck(){
		var pw1 = $("#pw1").val();
		var pw2 = '${sessionScope.info.PASSWORD}'
		if(pw1 == pw2){
			$("#result").html("일치");
			$("#result").css("color","blue");
		}else{
			$("#result").html("비밀번호가 일치하지 않습니다.");
			$("#result").css("color","red");
		}
	};

	function sbtn(){
		var pw1 = $("#pw1").val();
		var pw2 = '${sessionScope.info.PASSWORD}'
		var survey = $("#survey").val();
		if(survey.length >0 && pw1 == pw2){
				$("#sbtn").prop("disabled", false);
		}else{
				$("#sbtn").prop("disabled", true);
		}
	}
	$("#survey").on("keyup",sbtn);
	$("#pw1").on("keyup",pwcheck);
	$("#pw1").on("keyup",sbtn);
</script>











