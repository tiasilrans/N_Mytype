<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src="/module/nailthumb/jquery.nailthumb.1.1.min.js"></script>
<link rel="stylesheet" href="/module/nailthumb/jquery.nailthumb.1.1.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body{
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
	background: linear-gradient(to bottom, #80c1ff, #cce6ff);
}
a{ text-decoration: none; }
.logo-frame{
	width:100%;
	border-radius: 5px;
}
#secondlogo{
	height: 350px;
	width : 300px;
	border-radius: 5px;
	margin: 10px;
	border-radius : 5px;
    border : 1px solid silver;
    background-color: white;
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
.confooter{
	padding-top: 5px;
}
.confooter-count{
	font-size: 17;
	color : red;
}
.title{
	padding-top :15px;
	margin-left: 10px;
}
.incard {
    float: left;
    width : 280px;
	height: 270px;
	margin: 8px;
    border-radius : 5px;
    border : 1px solid silver;
    background: white;
}
.conhead-profileimg{
	float: left;
	width:48px;
	height:48px;
	border-radius: 50%;
	margin-right: 8px;
}
.conhead-title-blog, .conhead-title-blog:LINK, .conhead-title-blog:ACTIVE{
	font-size: 12;
	color: gray; 
}
.conbody-hashtag{
	font-size: 13;
	background-color: #ebebeb;
	border-radius: 2px;
	margin-left: 12px;
	padding: 4px;
	padding-bottom:5px;
	text-decoration: none;
}
.confooter-like, .confooter-like:focus, .confooter-like:hover{
	font-size: 18;
	color : red;
	outline: none;
	text-decoration: none;
	margin-top: 10px;
	padding-left: 12px;
	border : 0px;
}
.confooter{
	width : 100%;
	height: 10%;
}
.confooter{
	padding-top: 7px;
}
.confooter-count{
	font-size: 17;
	color : red;
}
</style>

<section>
<div class="col-lg-2 col-md-3"></div>
	<div class="col-lg-7 col-md-6">
	
		<!-- 메인쪽 로고 부분 -->
		<div class="w3-row w3-container" style="width:1100px; height: 350px;" >
			<div id="myCarousel" class="carousel w3-col s5" data-ride="carousel" style="width:520px; margin: 10px; margin-right:0; border:1px solid silver;border-radius:5px;">
				
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
					
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="logo-frame item active">
						<img src="/images/mainimg/1.png" alt="Los Angeles" style="width:100%; height: 350px; border-radius: 5px;">
					</div>
				
					<div class="logo-frame item">
						<img src="/images/mainimg/2.png" alt="Chicago" style="width:100%; height: 350px; border-radius: 5px;">
					</div>
					    
					<div class="logo-frame item">
						<img src="/images/mainimg/3.png" alt="New york" style="width:100%; height: 350px; border-radius: 5px;">
					</div>
				</div>
			</div>
		
			
			<!-- 메인쪽 로고 오른쪽 부분 -->
			<div id="secondlogo" class="w3-col s3">
				<div class="secondlogo-head">MyType 소식</div>
					<div class="secondlogo-body">
						<img class="secondlogo-body-profileimg" src="/images/blogMark.png">
						<div class="secondlogo-body-title">
							<span ><a href="/blog/${notice.URL}" class="secondlogo-body-title-name"><b>MyType 공식 블로그</b></a></span><br/>
							<span class="secondlogo-body-title-blog">blog.mytypeblog.com</span>
						</div>	
					</div>
					<div class="secondlogo-body-content"><a href="/${notice.URL}/post/${notice.NUM}"><span style="color: gray; font-size: 12;">
						<c:choose>
						<c:when test="${notice.SUBCONTET ne null}">
							${notice.SUBCONTENT }
						</c:when>
						<c:otherwise>
							${notice.FCONTENT }
						</c:otherwise>
						</c:choose>
						</span></a>
					</div>
			</div>
		</div>

		<!-- 목록 nav -->
		<div class="w3-row w3-container" style="width:1100px;">
			<div style="margin-left: 10px;">
				<ul class="nav nav-tabs" style="width: 950px;">
					<li class="active"><a data-toggle="tab" href="#allList"><b>전체</b></a></li>
					<c:if test="${sessionScope.login ne null}">
						<li><a data-toggle="tab" href="#likeList"><b>구독</b></a></li>
					</c:if>
				</ul>
			</div>			
			
			
			<div class="tab-content" >
			<!-- 전체 게시글 배치 -->
			<div id="allList" class="tab-pane fade in active">
			<c:forEach var="all" items="${listAll }" begin="0" end="${listAll.size() < 8 ? listAll.size() : 8}" varStatus="vs">
				<div class="incard w3-col s3" style="clear: right;" >
					<div class="title">
						<a style="float:left; padding-right: 10px;"><img src="/images/profile/${all.IMAGE }" onerror="this.src='/images/avatar_yellow.png'" style="border-radius: 50%;" width="40px" height="40px" /></a>
						<div>${all.NICKNAME ne null ? all.NICKNAME : all.EMAIL }</div>
						<div style="color:#909090; font-size: 12px;"><fmt:formatDate value="${all.PDATE }" pattern="yy.MM.dd"/> · <a class="-title-blog" style="text-decoration: none; color:#909090" href="/blog/${all.URL }">${all.URL }</a></div>
					</div>
					
	                <div style="height:65px; margin:12px; padding-bottom: 5px;">
						<c:choose>
						<c:when test="${all.ADULT eq 'false' || (all.ADULT eq 'true' && sessionScope.info.CERTIFIED eq 'Y') || sessionScope.login eq all.EMAIL}">	
						<a href="/${all.URL}/post/${all.NUM}" style="font-size: 15px; text-decoration: none; color: #333333; padding-bottom: 5px;">
							${all.TITLE }
						
						<c:if test="${all.IMG.length() > 10}">
		                		<div class="nailthumb-column-metadata" id="thumbnail">
		                			${all.IMG }
		                		</div>  
	                	</c:if>
	                	</a>
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: gray; font-size: 13px;">
							${all.FCONTENT }
						</a>
						</c:when>
						<c:otherwise>
						<a href="/${all.URL}/post/${all.NUM}" style="text-decoration: none; color: gray; font-size: 13px;">
							성인인증이 필요한 글입니다.
						</a>						
						</c:otherwise>
						</c:choose>
					</div> <br/><br/><br/>
	                
	                <div>
		                <c:set var="msg" value="${all.HASH }"/>
						<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
						<c:forEach items="${hashtag}" var="hash">
						<span class="conbody-hashtag">
							<a href="/search/tag.mt?keyword=${hash}"><span style="color: #909090;">#${hash}</span></a>
						</span>
						</c:forEach>
	                </div>
	                
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
				<div style="width:600px; margin-top: 10px; margin-top: 50px;"><h4 style="color: gray;">게시물이 없습니다.</h4></div>
			</div>
			</c:when>
			<c:otherwise>
			<c:forEach var="like" items="${listLike }" begin="0" end="${listLike.size() < 5 ? listLike.size() : 5}" varStatus="vs">
				<div class="incard col-xs-0 col-md-3" style="clear: right;" >
					<div class="title">
						<a style="float:left; padding-right: 10px;"><img src="/images/profile/${like.IMAGE }" onerror="this.src='/images/avatar_yellow.png'" style="border-radius: 50%;" width="40px" height="40px" /></a>
						<div>${like.NICKNAME ne null ? like.NICKNAME : like.EMAIL }</div>
						<div style="color:#909090; font-size: 11px;"><fmt:formatDate value="${like.PDATE }" pattern="yy.MM.dd"/> · <a class="conhead-title-blog" href="/blog/${like.URL }">${like.URL }</a></div>
					</div>
					
	                <div style="height:65px; margin:12px; padding-bottom: 5px;">
						<c:choose>
						<c:when test="${like.ADULT eq 'false' || (like.ADULT eq 'true' && sessionScope.login eq like.EMAIL)}">	                
						<a href="/${like.URL}/post/${like.NUM}" style="font-size: 15px; text-decoration: none; color: #333333;padding-bottom: 5px;">
							${like.TITLE }
						<c:if test="${like.IMG.length() > 10}">
		                		<div class="nailthumb-column-metadata" id="thumbnail">
		                			${like.IMG }
		                		</div>  
	                	</c:if>
	                	</a>
						<a href="/${like.URL}/post/${like.NUM}" style="text-decoration: none; color: gray; font-size: 13px;">
							${like.FCONTENT }
						</a>
						</c:when>
						<c:otherwise>
						<a href="/${like.URL}/post/${like.NUM}" style="text-decoration: none; color: gray; font-size: 13px;">
							성인인증이 필요한 글입니다.
						</a>						
						</c:otherwise>
						</c:choose>
					</div> <br/><br/><br/>
	                
	                <div>
		                <c:set var="msg" value="${like.HASH }"/>
						<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
						<c:forEach items="${hashtag}" var="hash">
						<span class="conbody-hashtag">
							<a href="/search/tag.mt?keyword=${hash}"><span style="color: #909090;">#${hash}</span></a>
						</span>
						</c:forEach>
	                </div>
	                
	                <!-- footer -->
					<div class="confooter">
						<c:choose>
						<c:when test="${like.HEART == null}">
							<button type="button" class="btn-link glyphicon glyphicon-heart-empty confooter-like like oheart-${like.NUM}" value="heart-${like.NUM}"></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn-link glyphicon glyphicon-heart confooter-like like oheart-${like.NUM}" value="heart-${like.NUM}"></button>
						</c:otherwise>
						</c:choose>
							<span class="confooter-count heart-${like.NUM}">${like.GOOD }</span>
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
<div class="col-lg-2 col-md-3"></div>
</section>


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

<script>
	function imgsize(){
		$(".fr-fic").css("width","220px");
		$(".fr-fic").css("height","74px");
		$(".fr-fic").css("border-radius","2px");
	}
	imgsize();
</script>

