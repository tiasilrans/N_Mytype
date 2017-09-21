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

a{ text-decoration: none; }

#secondlogo{
	height: 260px;
	width : 260px;
	border-radius: 5px;
	margin: 10px;
	border-radius : 5px;
    border : 1px solid silver;
}

.secondlogo-head{
	padding-top : 5px;
	padding-left : 0px;
	font-weight: bold;
}

.secondlogo-body{
	width : 100%;
	height: 15%;
}

.secondlogo-body-profileimg{
	float: left;
	width:32px;
	height:32px;
	border-radius: 50%;
	margin-right: 8px;
}
.secondlogo-body-title{
	padding-top : 5px;
}

.secondlogo-body-title-name,.secondlogo-body-title-name:LINK,.secondlogo-body-title-name:ACTIVE{
	font-size: 12;
	color : black;
	text-decoration: none;
}

.secondlogo-body-title-blog{
	font-size: 10;
	color : gray;
}
.secondlogo-body-content{
	padding: 8px;
	padding-top: 0px; 

}

body {
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
}

.box {
	position: relative;
	display: block;
	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
}

.lbox{
  float:left;
  width:50%;
  height: 80px;
}
  
.rbox{
  clear:right;
  float:right;
  width:50%;
  height: 80px;
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

.notice{
	margin-top: 14px;
	margin-bottom: 14px;
}

</style>
<div class="row">
<section style="min-height: 75%;">
<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12" style="margin-bottom: 0;">
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>오늘</b></span>
			<span style="float:right; font-size: 13px; padding-right:15px; color: #999999;" ><%=today %></span>
		</div>  
		<br/><hr/>
		<div align="left">
			<div class="lbox" >
				<a href="/my/point/plist" style="text-decoration: none;">
					<span class="boxsp">포인트 잔액</span> <br/>
					<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">monetization_on</label></span>
					<span style="font-size: 18px;">
					<fmt:formatNumber value="${pointsum.SUM}" pattern="#,###"/>
					 p
					 </span>
				</a>
            </div>
            <div class="rbox" > 
            	<a href="/my/point/withdraw" style="text-decoration: none;">
					<span class="boxsp">출금 가능 금액</span> <br/>
					<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">account_balance</label></span>
					<span style="font-size: 18px;">
					<fmt:formatNumber value="${pointsum.SUM}" pattern="#,###"/>
					 p
					 </span>
				</a>
			
            </div>
            <hr/>
            <div class="lbox" >
            <a style="text-decoration: none;">
            	<span class="boxsp">수익</span> <br/>
            	<span style="margin-left: 13px; color: #999999; float: left;"><label class="material-icons">store</label></span> 
					<span style="font-size: 18px;">
					<fmt:formatNumber value="${revenue}" pattern="#,###"/>
					 p
					 </span>
            </a>
            </div>  
            <div class="rbox">
            	<a style="text-decoration: none;">
            		<span class="boxsp">구매/후원</span> <br/>
            		<span style="margin-left: 15px; color: #999999; float: left;"><label class="material-icons">card_giftcard</label></span> <span>
					<span style="font-size: 18px;">
					<fmt:formatNumber value="${use}" pattern="#,###"/>
					 p
            		</span> 
					 </span>
            	</a>
            
            </div>  
		</div>
	</div>
	

<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12" style="min-height: 250px;">
		<div class="title row" style="margin-bottom: 20px;">
          <span style="float:left; font-size: 17px;"><b>공지사항</b></span>
          <span style="font-size: 13px; float:right; padding-right:15px;">
				<a href="/blog/MyTypeBlog1" style="text-decoration:none; color: #999999;"> 더 보기 > </a> 
			</span>
        </div>
        <div class="row" style="padding-left: 25px; width:780px; height: 180px;">
	        <c:forEach var="n" items="${notice}" begin="0" end="${notice.size() < 2 ? notice.size() : 2}">
	        	<div class="notice"><a style="text-decoration: none; color: #707070; " href="/MyTypeBlog1/post/${n.NUM }">${n.TITLE}</a></div>
				<!-- 
				<div id="secondlogo" class="col-xs-0 col-md-4">
					<div class="secondlogo-head">MyType 소식</div>
					<div class="secondlogo-body">
						<img class="secondlogo-body-profileimg" src="/images/blogMark.png">
						<div class="secondlogo-body-title">
							<span ><a href="/" class="secondlogo-body-title-name"><b>MyType 공식 블로그</b></a></span><br/>
							<span class="secondlogo-body-title-blog">blog.mytypeblog.com</span>
						</div>	
					</div>
					
					<div class="secondlogo-body-content">
						<span>
							<c:choose>
							<c:when test="${n.SUBCONTENT ne null}">
								${n.SUBCONTENT}
							</c:when>
							<c:otherwise>
								${n.CONTENT}
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
				-->
	        </c:forEach>
			
        </div>
</div>
</section>
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







    