<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/css/my.css" rel="stylesheet" type="text/css">
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
	margin-right: 20%;
}

select {
    width: 100px;
    height: 35px;
    font-size: 15px;
    border-radius: 3px;
}

.tertiary-nav {
    height: 43px;
    border-bottom: 1px solid rgba(0,0,0,.075);
}

.scard {
    position: relative;
    display: block;
    width : 850px;
	height: 32%;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
}

.card-block {
	margin-left: 10px;
    padding: 15px;
    position: relative;
    vertical-align:middle;
}

</style>

<form class="form-inline form-horizontal" method="post">
	<div class="scard col-xs-offset-1 col-md-offset-1">
		<div class="card-block" style="padding-top: 3%;">
			<p style="color:#909090; font-size: 13px;">성인 콘텐츠를 보거나 게시하기 위해서는 본인 확인이 필요합니다.</p>
			<label style="color: #606060;" >통신사</label>
			<select >
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LGU+</option>
					<option value="알뜰폰">알뜰폰</option>
			</select>
		</div>
		<div class="card-block">
			<label style="color: #606060;" >휴대전화</label>
			<input type="text" name="phone" class="form-control" style="width:65%;" placeholder="01012345678">
		</div>
		<div class="card-block">
	    	<button class="w3-button w3-black w3-round" style="float:left;">다음</button>
	    </div>
	</div>
</form>