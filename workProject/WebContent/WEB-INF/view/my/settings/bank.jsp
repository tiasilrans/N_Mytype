<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	height: 55%;
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

select {
    width: 200px;
    height: 35px;
    font-size: 15px;
    border-radius: 3px;
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
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>프로필 편집</b></span>
		</div>
		<br/><hr/>
		<div class="card-block" style="padding-bottom: 0;">
			<div style="font-size:17px;">은행 계좌</div>
			<p style="color:#909090; font-size: 13px;">수익 출금시 사용할 본인 명의의 은행 계좌 정보를 입력해 주세요.</p>
		</div>
		<div class="card-block">
			<label style="color: #606060;">은행</label>
				<select >
					<option>은행을 선택해주세요.</option>
					<option value="">은행을 선택해주세요.</option>
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
			<input type="text" name="nickname" class="form-control" style="width:65%" >
		</div>
		<div class="card-block">
			<label style="color: #606060; padding-right: 0">예금주명</label>
			<input type="text" name="nickname" class="form-control" style="width:65%" >
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block">
	    	<button class="w3-button w3-black w3-round" style="float:right;">변경 내용 저장</button>
	    </div>
	</div>
</form>