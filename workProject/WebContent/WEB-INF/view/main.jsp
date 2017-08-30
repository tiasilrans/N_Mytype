<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>

#logo{
	height: 350px;
	width : 620px;
	background-color: gray;
	border-radius: 10px;
	margin: 10px;
	background-image: url("/image/바다.jpg");
}
#secondlogo{
	height: 350px;
	width : 300px;
	background-color: green;
	border-radius: 10px;
	margin: 10px;
}

#post{
	height: 350px;
	width : 300px;
	background-color: aqua;
	border-radius: 10px;
	margin: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
}
.conhead{
	width : 100%;
	height: 20%;
}

.conbody{
	width : 100%;
	height: 70%;
}

.confooter{
	width : 100%;
	height: 10%;
}

.conhead-profileimg{
	float: left;
	width:48px;
	height:48px;
	border-radius: 50%;
	margin-right: 8px;
}
.conhead-title{
	padding-top : 5px;
}

.conhead-title-name{
	font-size: 14;
}

.conhead-title-date{
	font-size: 12;
}

.conhead-title-blog{
	font-size: 12;
}
.conbody{
}

.conbody-title{
	font-size: 23;
}

.conbody-content{
	font-size: 13;
	color : gray;
	margin-bottom: 15px;
}

.conbody-hashtag{
	font-size: 13;
	color : #909090;
	background-color: silver;
	border-radius: 2px;
	padding: 3px;
	text-decoration: none;
}

.confooter-like{
	font-size: 20;
	color : red;
}

</style>    
<div class="container" style="margin-left: 300px;">

			<!-- 메인쪽 로고 부분 -->
			<div id="logo" class="col-xs-0 col-md-4"></div>
			
			<!-- 메인쪽 로고 오른쪽 부분 -->
			<div id="secondlogo" class="col-xs-0 col-md-4">3</div>
			<br/>
			
			
			<!-- 게시글 배치 -->
			<c:forEach begin="1" end="9" varStatus="vs">
				<div id="post" class="col-xs-0 col-md-4">
				
					<!-- head -->
					<div class="conhead">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
						<div class="conhead-title">
							<span class="conhead-title-name"><b>홍승택님</b></span><br/>
							<span class="conhead-title-date">21시간전 </span>|
							<span class="conhead-title-blog"><a>블로그명눌러서바로가기</a></span>
						</div>	
					</div>
					
					
					<!-- body -->
					<div class="conbody">
						<span class="conbody-title"><b>제에에에목</b></span><br/>
						<span class="conbody-content">내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나 내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나 내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나</span><br/>
						<span class="conbody-hashtag"><a href="/">#해쉬태그</a></span>
						
					</div>
					
					
					<!-- footer -->
					<div class="confooter">
						<span class="confooter-like"><b>&#9829</b></span>
					</div>
				
				</div>
			
			<c:if test="vs % 3 = 0">
				<br/>
			</c:if>
			</c:forEach>
</div>