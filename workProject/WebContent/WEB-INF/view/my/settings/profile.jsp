<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.*" %>

<link href="/css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

</style>


<form class="form-inline form-horizontal" action="/my/settings/profile.mt" method="post" enctype="multipart/form-data">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>프로필 편집</b></span>
		</div>
		<br/><hr/>
		<div class="card-block">
			<label style="color: #606060;" >프로필 사진</label>
			<div class="input-group">
				<c:choose>
					<c:when test="${info.IMAGE eq null }">
						<img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 75px; width: 75px; margin-top: -20px;">
					</c:when>  
					<c:otherwise>
						<img src="/images/profile/${info.IMAGE}" id="profile-img" src="${info.IMAGE }" style="border-radius: 50%; height: 75px; width: 75px; margin-top: -20px;">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="input-group">
				<input type="file" name="image" id="upload-profile-photo" class="w3-button w3-white w3-border w3-round-large" style="width:100%;" >
				<p style="padding-top: 5px; margin-bottom:0; color:#909090; font-size: 13px;">최대 5MB의 이미지 파일</p>
				<p><input class="w3-check" type="checkbox" style="width:15px; height:15px;"> <label style="font-size: 12px;">사진 삭제</label></p>
			</div>
		</div>
		<div class="card-block ">
			<label style="color: #606060;">이름</label>
			<input type="text" name="nickname" class="form-control" style="width:65%;" 
			 <c:if test="${info.NICKNAME ne null }"> value="${info.NICKNAME }" </c:if> />
		</div>
		<div class="card-block">
			<label style="color: #606060;">자기 소개</label>
			<input type="text" name="introduce" class="form-control" style="width:65%;"
			 <c:if test="${info.INTRODUCE ne null}"> value="${info.INTRODUCE}" </c:if>/>
		</div>
		<hr style="margin: 0px;" />
	    <div class="card-block ">
	    	<a href="/my/settings/memberdelete" style="color:#909090; font-size: 12px">계정 삭제</a>
	    	<button class="w3-button w3-black w3-round" style="float:right">변경 내용 저장</button>
	    </div>
	</div>
</form>

<script>
	$("#upload-profile-photo").on("change", function(){
		console.log(this.files[0]);
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profile-img").attr("src", e.target.result);
		}
		reader.readAsDataURL(this.files[0]);
		
	});
	
</script>
