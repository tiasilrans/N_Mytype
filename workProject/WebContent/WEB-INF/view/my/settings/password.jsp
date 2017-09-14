<%@ page language="java" contentType="text/html; charset=UTF-8R"
    pageEncoding="UTF-8"%>

<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	height: 49%;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
}

.card-block {
	margin-left: 10px;
    padding: 15px;
    position: relative;
}

</style>


<form class="form-inline form-horizontal">
	<div class="scard col-xs-offset-1 col-md-offset-1">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>비밀번호 설정</b></span>
		</div>
		<br/><hr/>
		<div class="card-block">
			<label style="color: #606060;" >비밀번호</label>
			<input type="text" name="pw" class="form-control" style="width:65%;" placeholder="비밀번호">
		</div>
		<div class="card-block ">
			<label style="color: #606060;">새 비밀번호</label>
			<div class="form-group" style="margin-left: 1.5px;">
				<input type="text" name="newpw" class="form-control" style="width: 525px;" placeholder="새 비밀번호">
				<p style="color:#909090; font-size: 13px;">비밀번호는 복잡할수록 안전합니다.</p>
			</div>
		</div>
		<div class="card-block">
			<label style="color: #606060; width:120px; margin-right: 19.5%;">새 비밀번호 확인</label>
			<input type="text" name="newpw_ck" class="form-control" style="width:65%;" placeholder="새 비밀번호 확인">
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<button class="w3-button w3-black w3-round" style="float:right">변경 내용 저장</button>
	    </div>
	</div>
</form>