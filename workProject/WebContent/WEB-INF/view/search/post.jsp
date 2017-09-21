<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/searchcss.css">
<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
<style>

a{text-decoration: none;}

.card {
    position: relative;
    display: block;
    width : 630px;
	height: 330px;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
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
	padding-top: 5px;
}

.confooter-count{
	font-size: 17;
	color : red;
}

.div-pagination a {
    color: #0d0d0d;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #0d0d0d;
    border-color: black;
}

.div-pagination a:hover:not(.active) {background-color: #333333; color: white;}

</style>

<section style="min-height: 110%;">  
<div class="col-lg-3 col-md-3"></div>
<div class="col-lg-7 col-md-6" style="margin-left: auto;">
	<div class="w3-row w3-container" style="width:1100px;">
	
		<div class="w3-col s10" align="left">
			포스트 <span style="font-weight: bold; font-size: 20;">'${keyword}'</span><br/>
			<hr style="margin-top: 10px;"/>
		</div>
	
		<c:forEach var="like" items="${plist }" begin="0" end="${listLike.size() < 11 ? listLike.size() : 11}" varStatus="vs">
			<div class="incard col-xs-0 col-md-3" style="clear: right;" >
				<div class="title w3-col 3">
					<a style="float:left; padding-right: 10px;"><img src="/images/profile/${like.IMAGE }" onerror="this.src='/images/avatar_yellow.png'" style="border-radius: 50%;" width="40px" height="40px" /></a>
					<div>${like.NICKNAME }</div>
					<div style="color:#909090; font-size: 11px;"><fmt:formatDate value="${like.PDATE }" pattern="yy.MM.dd"/> · <a class="conhead-title-blog" href="/blog/${like.URL }">${like.URL }</a></div>
				</div>
				
				<div style="height:65px; margin:12px; padding-bottom: 5px;">
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
		</c:forEach>
	</div>

	<div class="div-pagination" align="center">
		<ul class="pagination">
			<c:forEach var="i" begin="1" end="${page}">
				<li ${np == i? "class=\"active\"": ""}><a
					href="/search/post.mt?np=${i}&keyword=${keyword}">${i}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
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