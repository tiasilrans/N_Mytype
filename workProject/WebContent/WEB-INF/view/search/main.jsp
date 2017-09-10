<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<style>
#post{
	height: 330px;
	width : 300px;
	background-color: #F6F6F6;
	border-radius: 5px;
	padding-top: 15px;
	padding-bottom: 15px;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
    margin: 10px;
    
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
<div align="center">

<div style="width: 50%;" align="left">
<h2>검색 메인</h2>
<hr style="margin-top: 10px;"/>
</div>

<div style="width: 49%;" align="left">
<div class="row">
<div align="left" style="width: 100%;">
<c:forEach var="all" items="${plist}" begin="0" end="${plist.size() < 5 ? plist.size() : 5}" varStatus="vs">
			<c:if test="(vs+1) % 3 = 0">
			</c:if>
			<div class="col-xs-0 col-md-4" style="padding-left: 0px; padding-right: 0px;">
				<div id="post">
				
					<!-- head -->
					<div class="conhead">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png">
						<div class="conhead-title">
							<span class="conhead-title-name"><b>${all.NICKNAME }</b></span><br/>
							<span class="conhead-title-date">${all.PDATE } </span>|
							<span><a class="conhead-title-blog">${all.URL }</a></span>
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
				</div>
			
			<c:if test="(vs+1) % 3 = 0">
			</c:if>
			</c:forEach>
</div>
</div>
</div>
<a class="btn btn-block " href="/search/post.mt?keyword=${keyword}" style="background-color: #F6F6F6; width: 50%; margin-bottom: 10px;">검색 결과 더 보기</a>
<div class="row" style="width: 50%;">
<c:forEach items="${hash}" var="tag">
	<div class="col-md-3" style=" padding: 5px;">
	<div style="background-color: #F6F6F6;">
		# ${tag }
	</div>
	</div>
</c:forEach>

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
