<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!--navbar menu-->
	<nav class="navbar navbar-default" style="border-top-style: none; min-height: 45px;">
		<div class="container">
			<div class="collapse navbar-collapse header-right-menu"
				id="navbar-primary-collapse" style="padding: 0px;">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="" href="/my/home" style="padding: 5px; padding-left: 10px; padding-right:10px; height: 5px;">My 홈</a></li>
					<li class="dropdown gd"><a class="dropdown-toggle" href="#" style="padding: 5px;">구독</a>
						<ul class="dropdown-menu">						
							<li><a href="/subscribe/blog.mt">구독한 블로그</a></li>
							<li><a href="/subscribe/tag.mt">(미완)구독한 태그</a></li>
						</ul>
					</li> 
					<li class="dropdown gd"><a class="dropdown-toggle" href="#" style="padding: 5px; padding-left: 10px; padding-right:10px;">라이브러리</a>
						<ul class="dropdown-menu">						
							<li><a href="/my/library/postgood">(미완)좋아요</a></li>
							<li><a href="/my/library/purchases">(미완)구매 항목</a></li>
						</ul>
					</li> 
					<li class="dropdown gd"><a class="dropdown-toggle" href="#" style="padding: 5px; padding-left: 10px; padding-right:10px;">포인트</a>
						<ul class="dropdown-menu">						
							<li><a href="/my/point/plist">사용내역</a></li>
							<li><a href="/my/point/charge">충전하기</a></li>
							<li><a href="/my/point/clist">충전내역</a></li>
							<li><a href="/my/point/withdraw">출금하기</a></li>
							<li><a href="/my/point/wlist">출금내역</a></li>
						</ul>
					</li> 
					<li class="dropdown gd"><a class="dropdown-toggle" href="#" style="padding: 5px; padding-left: 10px; padding-right:10px;">설정</a>
						<ul class="dropdown-menu">						
							<li><a href="/my/settings/account">계정 설정</a></li>
							<li><a href="/my/settings/profile">프로필 편집</a></li>
							<li><a href="/my/settings/password">비밀번호 변경</a></li>
							<li><a href="/my/settings/bank">출금계좌 설정</a></li>
						</ul>
					</li> 
					<li class="dropdown gd"><a class="dropdown-toggle" href="#" style="padding: 5px; padding-left: 10px; padding-right:10px;">쪽지</a>
						<ul class="dropdown-menu">						
							<li><a href="/mail/write.mt">쪽지보내기</a></li>
							<li><a href="/mail/list.mt?type=send">보낸쪽지함</a></li>
							<li><a href="/mail/list.mt?type=receive">받은쪽지함</a></li>
						</ul>
					</li> 
				</ul>
			</div>
		</div>
	</nav>

<script>
	$(window).scroll(function() {
		if ($(this).scrollTop() > 5) {
			$(".navbar-default").addClass("fixed-me");
		} else {
			$(".navbar-default").removeClass("fixed-me");
			
		}
	});
</script>