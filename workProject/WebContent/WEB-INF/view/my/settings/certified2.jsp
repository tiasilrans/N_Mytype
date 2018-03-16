<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

a:hover {
	text-decoration: none;
}

label{
	font-weight: normal;
	margin-right: 20%;
}

.tertiary-nav {
    height: 43px;
    border-bottom: 1px solid rgba(0,0,0,.075);
}

.scard {
    position: relative;
    display: block;
    width : 850px;
	height: 75%;
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

<section style="min-height: 90%;">
<form class="form-inline form-horizontal" action="/my/settings/adult" method="post" enctype="multipart/form-data">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="card-block col-xs-10" style="padding-top: 3%; font-size: 15px;">
			<p style="color:#909090; font-size: 13px;">성인 콘텐츠를 보거나 게시하기 위해서는 본인 확인이 필요합니다.</p>
			<label>신분증으로 본인 확인하기</label>
			<img src="/images/id_cert_guide.png" width="650" height="300" />
			<ol style="padding-top: 3%;">
				<li>종이에 현재 사용 중인 포스타입 이메일 주소를 적어주세요.
				<li>이메일 주소를 적은 종이를 신분증 위에 올려서 생년월일을 제외한 개인정보(실명, 주민등록<br/>
				번호 뒷자리 등)를 가려주세요.</li>
				<li>생년월일과 이메일 주소가 잘 보이도록 사진을 찰영하여 아래 양식에 첨부해주세요.</li>
			</ol> <br/>
			<div class="row" style="margin-bottom: 15px;">
			<div class="col-md-4">
				<label style="width: 100px;">신분증 업로드</label>
			</div>
			<div class="col-md-6">
				<input type="file" name="image" id="upload-profile-photo" class="w3-button w3-white w3-border w3-round-large" style="width:300px;" >
			</div>
			<div class="col-md-2" style="padding : 8px;">
				<button class="btn" type="submit" style="background-color: black; color: white; ">보내기</button>
			</div>
			</div>
		</div>
	</div>
</form>
</section>


<c:if test="${result ne null}">
<script>
	var r = '${result}';
	if(r){
		window.alert("성공");
	}else{
		window.alert("실패");
	}
</script>
</c:if>