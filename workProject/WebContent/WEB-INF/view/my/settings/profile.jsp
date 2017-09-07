<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

a:hover {
	text-decoration: none;
}

label{
	font-weight: normal;
	margin-right:20%;
}

.scard {
    position: relative;
    display: block;
    width : 80%;
	height: 53%;
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


<div class="scard col-xs-offset-1 col-md-offset-1">
	<div class="title">
		<span style="float:left; font-size: 17px; margin-left: 5px;"><b>프로필 편집</b></span>
	</div>
	<br/><hr/>
	<div class="card-block">
		<div>
			<label>프로필 사진</label>
			<div>
				<button class="w3-button w3-white w3-border w3-round-large">파일 선택...</button>
				<p style="color:#909090; font-size: 13px;">최대 5MB의 이미지 파일</p>
			</div>
		</div>
	</div>
    
   
</div>