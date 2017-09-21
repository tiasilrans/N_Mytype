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


<form class="form-inline form-horizontal" action="/my/settings/password.mt" method="post">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>비밀번호 설정</b></span>
		</div>
		<br/><hr/>
		<div class="card-block">
			<label style="color: #606060;" >비밀번호</label>
			<input type="password" id="mypw2" name="password" class="form-control" style="width:65%;" placeholder="비밀번호" required>
		</div>
		<div class="card-block ">
			<label style="color: #606060;">새 비밀번호</label>
			<div class="form-group" style="margin-left: 1.5px;">
				<input type="password" id="pw1" name="newpw" class="form-control" style="width: 525px;" placeholder="새 비밀번호" required>
				<p style="color:#909090; font-size: 13px;">비밀번호는 복잡할수록 안전합니다.</p>
				<span style="color:red; font-size: 15px;" id="result"></span>
			</div>
		</div>
		<div class="card-block">
			<label style="color: #606060; width:120px; margin-right: 19.5%;">새 비밀번호 확인</label>
			<input type="password" id="pw2" name="newpw_ck" class="form-control" style="width:65%;" placeholder="새 비밀번호 확인" required>
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<button id="sbtn" class="w3-button w3-black w3-round" style="float:right" disabled>변경 내용 저장</button>
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
		var pw2 = $("#pw2").val();
		if(pw1.length > 0 && pw2.length > 0){
			if(pw1 != pw2){
				$("#result").html("비밀번호가 일치하지 않습니다.");
				$("#result").css("color","red");
			}else{
				$("#result").html("사용가능합니다.");
				$("#result").css("color","blue");
			}
		}
	};

	$("#pw2").on("keyup",pwcheck);

	function sbtn(){
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		var mypw1 = '${sessionScope.info.PASSWORD}'
		var mypw2 = $("#mypw2").val();
		if(pw1.length >0 && pw2.length >0 && pw1 == pw2 && mypw1 == mypw2){
				$("#sbtn").prop("disabled", false);
		}else{
				$("#sbtn").prop("disabled", true);
		}
	}
	$("#mypw2").on("keyup",sbtn);
	$("#pw1").on("keyup",sbtn);
	$("#pw2").on("keyup",sbtn);
</script>











