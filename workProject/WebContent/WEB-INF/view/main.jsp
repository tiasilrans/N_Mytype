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
	background-image: url("/images/mainimg/바다.jpg");
}

#secondlogo{
	height: 350px;
	width : 300px;
	background-color: green;
	border-radius: 10px;
	margin: 10px;
}

.list-nav-item{
	font-size: 16px;
	border-radius: 5px;
	padding: 4px;
	background-color: #E6FFFF;
	color: black;
}

.list-nav-item-active{
	font-size: 16px;
	border-radius: 5px;
	padding: 4px;
	background-color: #5A5A5A;
	color : white;
}

#post{
	height: 330px;
	width : 300px;
	background-color: #DAFFFF;
	border-radius: 10px;
	margin: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
}
#post:hover{
	outline: 1px solid #EAEAEA;
	border-radius: 5px;
	
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
}

.conbody-hashtag{
	font-size: 13;
	background-color: #D8D8D8;
	border-radius: 2px;
	padding: 3px;
	text-decoration: none;
}

.confooter-like, .confooter-like:focus, .confooter-like:hover{
	font-size: 20;
	color : red;
	outline: none;
	text-decoration: none;
	padding: 0px;
	border : 0px;
}

.confooter-count{
	font-size: 17;
	color : red;
}

</style>   
<div class="container" style="margin-left: 300px;">

			<!-- 메인쪽 로고 부분 -->
			<div id="logo" class="col-xs-0 col-md-4">
			</div>
			

			<!-- 메인쪽 로고 오른쪽 부분 -->
			<div id="secondlogo" class="col-xs-0 col-md-4">3</div>
			
			<!-- 목록 nav -->
			<div class="col-xs-0 col-md-12">
			<a><span class="list-nav-item-active"><b>전체</b></span></a>
			<a><span class="list-nav-item"><b>구독</b></span></a>
			
			
			<div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary active">
			    <input type="radio" name="options" id="option1" autocomplete="off" checked>전체
			  </label>
			  <label class="btn btn-primary">
			    <input type="radio" name="options" id="option2" autocomplete="off">구독
			  </label>
			</div>
            
			</div>
			
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
						<span class="conbody-content">내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나 내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나 내용이 들어갈껀데 작고 길게 많이 많이 들어갈수잇게 아무말이나 아무말이나</span><br/><br/>
						<span class="conbody-hashtag"><a href="/"><span style="color: #909090;">#해쉬태그</span></a></span>
						
					</div>
					
					
					<!-- footer -->
					<div class="confooter">
						<button type="button" class="btn-link glyphicon glyphicon-heart-empty confooter-like like"></button>
						<span class="confooter-count">5</span>
					</div>
				
				</div>
			
			<c:if test="vs % 3 = 0">
				<br/>
			</c:if>
			</c:forEach>
</div>
<script>
	//좋아요 버튼 눌렀을때 마다 하트가 변하는 스크립트 
	function likechange(){
		if(this.className == "btn-link glyphicon glyphicon-heart-empty confooter-like like"){
			this.className = "btn-link glyphicon glyphicon-heart confooter-like like";
		}else{
			this.className = "btn-link glyphicon glyphicon-heart-empty confooter-like like";
		}
	}
	$(".like").on("click", likechange);
	
	
	//전체,구독 누를때 목록불러오는 스크립트
	function listchange(){
		window.alert(this.className);
	}
	$(".btn btn-primary").on("click", listchange);
</script> 









