<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%
	SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
	String today = ft.format(new java.util.Date());
%>

<link rel="stylesheet" href="/css/my.css">

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
	padding-top: 7px;
}

.confooter-count{
	font-size: 17;
	color : red;
}

</style>

<div class="col-xs-offset-2 col-md-offset-2 container-fluid">
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>오늘</b></span>
			<span style="float:right; font-size: 13px; padding-right:15px; color: #999999;" ><%=today %></span>
		</div>  
		<br/><hr/>
		<div align="left">
			<div class="lbox" >
				<a style="text-decoration: none;">
					<span class="boxsp">포인트 잔액</span> <br/>
					<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">monetization_on</label></span> 0p
				</a>
            </div>
            <div class="rbox" > 
            	<a style="text-decoration: none;">
					<span class="boxsp">출금 가능 금액</span> <br/>
					<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">account_balance</label></span>0p 
				</a>
			
            </div>
            <hr/>
            <div class="lbox" >
            <a style="text-decoration: none;">
            	<span class="boxsp">수익</span> <br/>
            	<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">store</label></span> 0p
            </a>
            </div>  
            <div class="rbox">
            	<a style="text-decoration: none;">
            		<span class="boxsp">구매/후원</span> <br/>
            		<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">card_giftcard</label></span> <span>0p</span> 
            	</a>
            
            </div>  
		</div>
	</div>
	
	<div class="card col-xs-6 col-md-6 col-lg-4">
		<div class="title">
			<span style="float:left; font-size: 17px;"><b>좋아요</b></span>
			<span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none; color: #999999;" href="/library/postgood"> 더 보기 > </a> 
			</span>
			<br/><br/>
			
			<c:forEach var="like" items="${listLike }" varStatus="vs">
				<div class="incard" style="<c:if test="${vs.last}">margin-left:15px;</c:if> clear: right;" >
					<div class="title">
						<a style="float:left; padding-right: 10px;"><img src="/images/profile/${like.IMAGE }" style="border-radius: 50%;" width="40px" height="40px" /></a>
						<div>${like.NICKNAME }</div>
						<div style="color:#909090; font-size: 11px;">6일전 · ${like.URL }</div>
					</div>
	                <div style="height:50px; margin:12px; padding-bottom: 3px;">
	                	<div style="font-size: 15px; padding-bottom: 5px; ">제목 없음</div>
	                	<div style="color:#909090; font-size: 13px; overflow: hidden;">
	                		${like.FCONTENT }
	                	</div>
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
	</div>

    <div class="card col-xs-3 col-md-3 col-lg-2">
		<div class="title">
          <span style="float:left; font-size: 17px;"><b>공지사항</b></span>
          <span style="font-size: 13px; float:right; padding-right:15px;">
				<a style="text-decoration:none; color: #999999;"> 더 보기 > </a> 
			</span>
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







    