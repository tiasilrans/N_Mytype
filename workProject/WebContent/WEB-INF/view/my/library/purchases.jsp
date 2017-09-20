<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/searchcss.css">  
<link rel="stylesheet" href="/css/my.css">
<script src="/module/nailthumb/jquery.nailthumb.1.1.min.js"></script>
<link rel="stylesheet" href="/module/nailthumb/jquery.nailthumb.1.1.min.css">

<style>

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

</style>
    
<div align="center">

<div style="width: 60%;" align="left">
	<h2>구매한 항목</h2>
	<hr style="margin-top: 10px;"/>
</div>

<div style="width: 59%;" align="left">
	<div class="row">
		<div align="left" style="width: 100%;">
			<c:forEach var="all" items="${list }" begin="0" end="${listAll.size() < 8 ? listAll.size() : 8}" varStatus="vs">
				<div class="incard col-xs-0 col-md-3" style="clear: right;" >
					<div class="title">
						<a style="float:left; padding-right: 10px;"><img src="/images/profile/${all.IMAGE }" style="border-radius: 50%;" width="40px" height="40px" /></a>
						<div>${all.NICKNAME }</div>
						<div style="color:#909090; font-size: 11px;"><fmt:formatDate value="${all.PDATE }" pattern="yy.MM.dd"/> · <a class="conhead-title-blog" href="/blog/${all.URL }">${all.URL }</a></div>
					</div>
					
	                <div style="height:65px; margin:12px; padding-bottom: 5px;">
						<a href="/${all.URL}/post/${all.NUM}" style="font-size: 15px; text-decoration: none; color: #333333;padding-bottom: 5px;">
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
	</div>
</div>

<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/library/purchases.mt?np=${i}">${i}</a></li>
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

<script>
	function imgsize(){
		$(".fr-fic").css("width","220px");
		$(".fr-fic").css("height","74px");
		$(".fr-fic").css("border-radius","2px");
	}
	imgsize();
</script>