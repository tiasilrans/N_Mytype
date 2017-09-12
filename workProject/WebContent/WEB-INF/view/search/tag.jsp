<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/searchcss.css">  

    
<div align="center">

<div style="width: 60%;" align="left">
<span style="font-weight: bold; font-size: 20;">#${keyword}</span><br/>
<hr style="margin-top: 10px;"/>
</div>

<div style="width: 59%;" align="left">
<div class="row">
<div align="left" style="width: 100%;">
<c:forEach var="all" items="${plist}" begin="0" end="${plist.size() < 11 ? plist.size() : 11}" varStatus="vs">
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
			
			</c:forEach>
</div>
</div>
</div>

<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/search/tag.mt?np=${i}&keyword=${keyword}">${i}</a></li>
	</c:forEach>
</ul>

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