<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
				<a class="navbar-brand" href="/"><img src="/images/title.png" style="margin: 5px;"></a>
				</div> 

			
				 <!-- 나브바 왼쪽 -->
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="header" href="/"
						id="home">홈</a></li>
					<li><a class="" href="">구독</a></li>
					
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