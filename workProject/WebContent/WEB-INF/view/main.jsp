<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
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

.btn-primary{
	background-color: green;
}


#post{
	height: 330px;
	width : 300px;
	background-color: #F6F6F6;
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

<div class="container" style="margin-left: 300px;">

			<!-- 메인쪽 로고 부분 -->
			<div id="logo" class="col-xs-0 col-md-4">
			</div>
			

			<!-- 메인쪽 로고 오른쪽 부분 -->
			<div id="secondlogo" class="col-xs-0 col-md-4">3</div>
			
			<!-- 목록 nav -->
			<div class="col-xs-0 col-md-12">			
			
			<div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-default active">
			    <input type="radio" name="listbtn" id="allListbtn" value="all"  autocomplete="off" checked>전체
			  </label>
			  <label class="btn btn-default">
			    <input type="radio" name="listbtn" id="likeListbtn" value="like"  autocomplete="off">구독
			  </label>
			</div>
            
			</div>
			
			<!-- 전체 게시글 배치 -->
			<div id="allList">
			<c:forEach var="all" items="${listAll}" begin="0" end="${listAll.size() < 8 ? listAll.size() : 8}" varStatus="vs">
				<div id="post" class="col-xs-0 col-md-4">
				
					<!-- head -->
					<div class="conhead">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
						<div class="conhead-title">
							<span class="conhead-title-name"><b>${all.NICKNAME }</b></span><br/>
							<span class="conhead-title-date">${all.PDATE } </span>|
							<span class="conhead-title-blog"><a>${all.URL }</a></span>
						</div>	
					</div>
					
					
					<!-- body -->
					<div class="conbody">
						<span class="conbody-title"><b>${all.TITLE }</b></span><br/>
						<span class="conbody-content">${all.FCONTENT }</span><br/><br/>
						
					</div>
					
					
					<c:set var="msg" value="${all.HASH }"/>
					<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
					<c:forEach items="${hashtag}" var="hash">
					<span class="conbody-hashtag">
						<a href="/"><span style="color: #909090;">#${hash}</span></a>
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
			<div id="likeList" style="display: none;">
				<c:forEach var="all" items="${listLike}" begin="0" end="${listLike.size() < 8 ? listLike.size() : 8}" varStatus="vs">
				<div id="post" class="col-xs-0 col-md-4">
				
					<!-- head -->
					<div class="conhead">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
						<div class="conhead-title">
							<span class="conhead-title-name"><b>${all.NICKNAME }</b></span><br/>
							<span class="conhead-title-date">${all.PDATE } </span>|
							<span class="conhead-title-blog"><a>${all.URL }</a></span>
						</div>	
					</div>
					
					
					<!-- body -->
					<div class="conbody">
						<span class="conbody-title"><b>${all.TITLE }</b></span><br/>
						<span class="conbody-content">${all.FCONTENT }</span><br/><br/>
						
					</div>
					
					
					<c:set var="msg" value="${all.HASH }"/>
					<c:set var="hashtag" value="${fn:split(msg,' ')}"/>
					<c:forEach items="${hashtag}" var="hash">
					<span class="conbody-hashtag">
						<a href="/"><span style="color: #909090;">#${hash}</span></a>
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

			
</div>

<c:choose>
	<c:when test="${sessionScope.login == null}">
	<script>
	function likechange(){
		window.alert("로그인후 이용 가능합니다.");
	}
	function postset(){
		window.alert("로그인후 이용 가능합니다.");
	}
	$(".like").on("click", likechange);
	$("input[name='listbtn']:radio").change(postset);
	</script>
	</c:when>
	
	<c:otherwise>
	<script>
		//좋아요 버튼 눌렀을때 마다 하트가 변하는 스크립트 
		function likechange(){
			var str = this.value;
			if(this.classList.contains("glyphicon-heart-empty")){
				$("."+str).html(parseInt($("."+str).html())+1);
				$(".o"+str).removeClass("glyphicon-heart-empty");
				$(".o"+str).addClass("glyphicon-heart");
			}else{
				$("."+str).html(parseInt($("."+str).html())-1);
				$(".o"+str).removeClass("glyphicon-heart");
				$(".o"+str).addClass("glyphicon-heart-empty");
			}
		}
		$(".like").on("click", likechange);
		
		
		//전체,구독 누를때 목록불러오는 스크립트
		function postset(){
			if(this.value == "all"){
				$("#likeList").css("display","none");
				$("#allList").css("display","block");
			}else{
				$("#likeList").css("display","block");
				$("#allList").css("display","none");
			}
		}
		$("input[name='listbtn']:radio").change(postset);
	</script>
	</c:otherwise>
</c:choose>










