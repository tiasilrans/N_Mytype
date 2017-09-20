<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    background: whitesmoke;
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

select {
    width: 200px;
    height: 35px;
    font-size: 15px;
    border-radius: 3px;
}

</style>


<form class="form-inline form-horizontal" action="/my/settings/bankExec">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>출금계좌 설정</b></span>
		</div>
		<br/><hr/>
		<div class="card-block" style="padding-bottom: 0;">
			<div style="font-size:17px;">은행 계좌</div>
			<p style="color:#909090; font-size: 13px;">수익 출금시 사용할 본인 명의의 은행 계좌 정보를 입력해 주세요.</p>
		</div>
		<div class="card-block">
			<label style="color: #606060;">은행</label>
				<select name="bank">
					<option>은행을 선택해주세요.</option>
					<option value="기업은행">기업은행</option>
					<option value="국민은행">국민은행</option>
					<option value="농협은행">농협은행</option>
					<option value="대구은행">대구은행</option>
					<option value="부산은행">부산은행</option>
					<option value="새마을금고">새마을금고</option>
					<option value="신한은행">신한은행</option>
					<option value="씨티은행">씨티은행</option>
					<option value="우리은행">우리은행</option>
					<option value="우체국">우체국</option>
					<option value="하나은행">하나은행</option>
					<option value="SC은행">SC은행(SC제일)</option>
				</select>
		</div>
		<div class="card-block ">
			<label style="color: #606060;">계좌번호</label>
			<input type="text" name="account" class="form-control" style="width:65%;" 
			 <c:if test="${info.ACCOUNT ne null }"> value="${info.ACCOUNT }" </c:if> />
		</div>
		<div class="card-block">
			<label style="color: #606060; padding-right: 0">예금주명</label>
			<input type="text" name="holder" class="form-control" style="width:65%;" 
			 <c:if test="${info.HOLDER ne null }"> value="${info.HOLDER }" </c:if> />
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block">
	    	<button class="w3-button w3-black w3-round" style="float:right;">변경 내용 저장</button>
	    </div>
	</div>
</form>