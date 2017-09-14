<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/postViewNavcss.css">

<section class="navbar-info ">
	<nav class="navbar navbar-default" style="margin-bottom: 0px; ">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header navbar-me">
				<button type="button"
					class="navbar-toggle collapsed menu-collapsed-button"
					data-toggle="collapse" data-target="#navbar-primary-collapse"
					aria-expanded="false" style="float: left;">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				</div> 

			
				 <!-- 나브바 왼쪽 -->
				<ul class="nav navbar-nav navbar-left">
				<li class="dropdown" style="margin-left: -210px;"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="background-image: none; background-color: white; margin: 0px;"><i class="material-icons" style="font-size: 30px; color: black;">menu</i></a>
						<ul class="dropdown-menu">		  				
						<!-- 블로그 리스트 -->				  
						<c:if test="${sessionScope.blog ne null }">
						<c:forEach var="blog" items="${sessionScope.blog}" begin="0" end="${sessionScope.blog.size()}">
							<li><a style="font-weight: bold;" href="/blog/${blog.URL}"><img src="/images/title.png" style="height: 25px;"> <span style="font-family: sans-serif;">방문중인 블로그</span></a></li>
							<li><h5>${map.TITLE }</h5></li>
							<li>0<span>포스트</span> 0<span>구독자</span></li>
							<li><button class="btn btn-default">구독하기</button></li>
							<li style="margin-bottom: 10px;"><span>작가</span></li>
							<li><img src="/images/avatar_yellow.png" style="width:45px; border-radius: 30px; width: 30px; height: 30px;"><span style="margin-left: 15px;">작가의 닉네임</span></li>
							<li style="margin-top: 10px;"><span>카테고리</span></li>
						</c:forEach>   
						</c:if>      
						</ul></li>   
				</ul>    
				
				<ul class="nav navbar-nav navbar-left">
					<li style="margin-top: -20px; margin-left: -10px;"><a href="/blog/${map.url }"><i class="material-icons">arrow_back</i></a></li>
				</ul>  
				    
				
			   <!-- 나브바 오른쪽 -->
				<ul class="nav navbar-nav navbar-right"> 
					
				</ul>		
		</div>
	</nav>
</section>

















<script>
	$(window).scroll(function() {
		if ($(this).scrollTop() > 5) {
			$(".navbar-me").addClass("fixed-me");
		} else {
			$(".navbar-me").removeClass("fixed-me");
		}
	});
</script>