<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<style>
.logo-frame{
	width:100%;
	border-radius: 5px;
}

#secondlogo{
	height: 350px;
	width : 330px;
	background-color: #F6F6F6;
	border-radius: 5px;
	margin: 10px;
}

.secondlogo-head{
	padding-top : 15px;
	padding-left : 8px;
	font-weight: bold;
}

.secondlogo-body{
	width : 100%;
	height: 15%;
}

.secondlogo-body-profileimg{
	float: left;
	width:48px;
	height:48px;
	border-radius: 50%;
	margin-right: 8px;
}
.secondlogo-body-title{
	padding-top : 5px;
}

.secondlogo-body-title-name,.secondlogo-body-title-name:LINK,.secondlogo-body-title-name:ACTIVE{
	font-size: 14;
	color : black;
	text-decoration: none;
}

.secondlogo-body-title-blog{
	font-size: 12;
	color : gray;
}
.secondlogo-body-content{
	padding: 8px;
	padding-top: 0px; 

}

#post{
	height: 330px;
	width : 300px;
	background-color: #F6F6F6;
	border-radius: 5px;
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

.conhead-title-blog, .conhead-title-blog:LINK, .conhead-title-blog:ACTIVE{
	font-size: 12;
	color: gray; 
}
.conbody{
	height: 60%;
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
	margin-right: 3px;
	padding: 4px;
	text-decoration: none;
}

.confooter{
	padding-top: 7px;
}

.confooter-like, .confooter-like:focus, .confooter-like:hover{
	font-size: 18;
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

<div class="container" style="margin-left: auto; width: 65%">

			<!-- 메인쪽 로고 부분 -->
			  <div class="container col-md-4" style="width:620px; height: 350px;">
			  <div id="myCarousel" class="carousel" data-ride="carousel" style="width:580px; margin: 10px;">
			  
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			      <div class="logo-frame item active">
			        <img src="/images/mainimg/바다.jpg" alt="Los Angeles" style="width:100%; height: 350px; border-radius: 5px;">
			      </div>
			
			      <div class="logo-frame item">
			        <img src="/images/mainimg/겨울.jpg" alt="Chicago" style="width:100%; height: 350px; border-radius: 5px;">
			      </div>
			    
			      <div class="logo-frame item">
			        <img src="/images/mainimg/봄.jpg" alt="New york" style="width:100%; height: 350px; border-radius: 5px;">
			      </div>
			    </div>
			  </div>
			</div>
			

			<!-- 메인쪽 로고 오른쪽 부분 -->
			<div id="secondlogo" class="col-xs-0 col-md-4">
				<div class="secondlogo-head">MyType 소식</div>
					<div class="secondlogo-body">
						<img class="secondlogo-body-profileimg" src="/images/blogMark.png">
						<div class="secondlogo-body-title">
							<span ><a href="/" class="secondlogo-body-title-name"><b>MyType 공식 블로그</b></a></span><br/>
							<span class="secondlogo-body-title-blog">blog.mytypeblog.com</span>
						</div>	
					</div>
				<div class="secondlogo-body-content"><span>공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용</span></div>
			</div>
			
			<!-- 목록 nav -->
			<div class="col-xs-0 col-md-12">
			<div style="margin-left: 10px;">
			<ul class="nav nav-tabs" style="width: 950px;">
			<li class="active"><a data-toggle="tab" href="#allList"><b>전체</b></a></li>
			<c:if test="${sessionScope.login ne null}">
				<li><a data-toggle="tab" href="#likeList"><b>구독</b></a></li>
			</c:if>
			</ul>
			</div>			
			
			
			<div class="tab-content">
			
			<!-- 전체 게시글 배치 -->
			<div id="allList" class="tab-pane fade in active">
			<c:forEach var="all" items="${listAll}" begin="0" end="${listAll.size() < 8 ? listAll.size() : 8}" varStatus="vs">
				<div id="post" class="col-xs-0 col-md-4">
				
					<!-- head -->
					<div class="conhead">
					<c:choose>
					<c:when test="${all.IMAGE eq null}">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
					</c:when>
					<c:otherwise>
						<img class="conhead-profileimg" src="/images/profile/${all.IMAGE}">
					</c:otherwise>
					</c:choose>
						<div class="conhead-title">
							<span class="conhead-title-name"><b>${all.NICKNAME }</b></span><br/>
							<span class="conhead-title-date"><fmt:formatDate value="${all.PDATE }" pattern="yyyy-MM-dd"/></span> |
							<span><a class="conhead-title-blog" href="/blog/${all.URL }">${all.URL }</a></span>
						</div>	
					</div>
					
					
					<!-- body -->
					<div class="conbody">
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: #333333;"><span class="conbody-title"><b>${all.TITLE }</b></span></a><br/>
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: gray;"><span class="conbody-content">${all.FCONTENT }</span></a><br/><br/>
						
					</div>
					
					
					
					<c:set var="msg" value="${all.HASH }"/>
					<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
					<c:forEach items="${hashtag}" var="hash">
					<span class="conbody-hashtag">
						<a href="/search/tag.mt?keyword=${hash}"><span style="color: #909090;">#${hash}</span></a>
					</span>
					</c:forEach>
						
					
					<br/>
					<!-- footer -->
					<div class="confooter">
					<c:choose>
					<c:when test="${all.HEART == null}">
						<button type="button" class="btn-link glyphicon glyphicon-heart-empty confooter-like like oheart-${all.NUM}" value="heart-${all.NUM}"></button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn-link glyphicon glyphicon-heart confooter-like like oheart-${all.NUM}" value="heart-${all.NUM}"></button>
					</c:otherwise>
					</c:choose>
						<span class="confooter-count heart-${all.NUM}">${all.GOOD }</span>
					</div>
				
				</div>
			
			<c:if test="(vs+1) % 3 = 0">
				<br/>
			</c:if>
			</c:forEach>
			</div>
			
			
			<!-- 구독 게시물 배치 -->
			<div id="likeList" class="tab-pane fade">

			<c:choose>
			<c:when test="${listLike.size() == 0}">
			<div align="center">
				<div style="width:600px; margin-top: 10px;"><h1>게시물이 없습니다.</h1></div>
			</div>
			</c:when>
			<c:otherwise>
			<c:forEach var="all" items="${listLike}" begin="0" end="${listLike.size() < 5 ? listLike.size() : 5}" varStatus="vs">
				<div id="post" class="col-xs-0 col-md-4">
				
					<!-- head -->
					<div class="conhead">
					<c:choose>
					<c:when test="${all.IMAGE eq null}">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
					</c:when>
					<c:otherwise>
						<img class="conhead-profileimg" src="/images/profile/${all.IMAGE}">
					</c:otherwise>
					</c:choose>
						<div class="conhead-title">
							<span class="conhead-title-name"><b>${all.NICKNAME }</b></span><br/>
							<span class="conhead-title-date">${all.PDATE } </span>|
							<span><a class="conhead-title-blog" href="/blog/${all.URL }">${all.URL }</a></span>
						</div>	
					</div>
					
					
					<!-- body -->
					<div class="conbody">
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: #333333;"><span class="conbody-title"><b>${all.TITLE }</b></span></a><br/>
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: gray;"><span class="conbody-content">${all.FCONTENT }</span></a><br/><br/>
						
					</div>
					
					
					<c:set var="msg" value="${all.HASH }"/>
					<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
					<c:forEach items="${hashtag}" var="hash">
					<span class="conbody-hashtag">
						<a href="/search/tag.mt?keyword=${hash}"><span style="color: #909090;">#${hash}</span></a>
					</span>
					</c:forEach>
						
					
					<br/>
					<!-- footer -->
					<div class="confooter">
					<c:choose>
					<c:when test="${all.HEART == null}">
						<button type="button" class="btn-link glyphicon glyphicon-heart-empty confooter-like like oheart-${all.NUM}" value="heart-${all.NUM}"></button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn-link glyphicon glyphicon-heart confooter-like like oheart-${all.NUM}" value="heart-${all.NUM}"></button>
					</c:otherwise>
					</c:choose>
						<span class="confooter-count heart-${all.NUM}">${all.GOOD }</span>
					</div>
				
				</div>
			
			<c:if test="(vs+1) % 3 = 0">
				<br/>
			</c:if>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			
			</div>

			
			</div>
</div>
</div>

<c:choose>
	<c:when test="${sessionScope.login == null}">
	<script>
	function likechange(){
		window.alert("로그인후 이용 가능합니다.");
	}
	$(".like").on("click", likechange);
	</script>
	</c:when>
	
	<c:otherwise>
	<script>
		//좋아요 버튼 눌렀을때 마다 하트가 변하는 스크립트 
		function likechange(){
			var str = this.value;
			var heart = this.classList.contains("glyphicon-heart-empty");
				$.ajax({
					url:"/postgood.mt",
					method : "get",
					data : {
					"num" : str,
					"type" : heart,
					}
				}).done(function(result) {
					var rst = JSON.parse(result);
					if(rst.rst){
						if(heart){
							$("."+str).html(parseInt($("."+str).html())+1);
							$(".o"+str).removeClass("glyphicon-heart-empty");
							$(".o"+str).addClass("glyphicon-heart");
							
						}else{
							$("."+str).html(parseInt($("."+str).html())-1);
							$(".o"+str).removeClass("glyphicon-heart");
							$(".o"+str).addClass("glyphicon-heart-empty");
						}
					}
				});
		}
		$(".like").on("click", likechange);
	</script>
	</c:otherwise>
</c:choose>










