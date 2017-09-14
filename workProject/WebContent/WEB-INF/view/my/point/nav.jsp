<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!--navbar menu-->
	<nav class="navbar navbar-default" style="border-top-style: none; min-height: 45px;">
		<div class="container">
			<div class="collapse navbar-collapse header-right-menu"
				id="navbar-primary-collapse" style="padding: 0px;">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="header" href="/my/point/plist" id="home" style="padding-top: 6px; height: 5px;">포인트 내역</a></li>
					<li class=""><a class="header" href="/my/point/charge" id="home" style="padding-top: 6px; height: 5px;">포인트 충전</a></li>
					<li class=""><a class="header" href="/my/point/clist"  id="home" style="padding-top: 6px; height: 5px;">충전 내역</a></li>
					<li class=""><a class="header" href="/my/point/withdraw"  id="home" style="padding-top: 6px; height: 5px;">출금 신청</a></li>
					<li class=""><a class="header" href="/my/point/wlist"  id="home" style="padding-top: 6px; height: 5px;">출금 내역</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
<!-- end of navbar-->

<script>
	$(window).scroll(function() {
		if ($(this).scrollTop() > 5) {
			$(".navbar-me").addClass("fixed-me");
		} else {
			$(".navbar-me").removeClass("fixed-me");
		}
	});
</script>
