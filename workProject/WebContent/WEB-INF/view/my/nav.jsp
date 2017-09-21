<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- blogSetting navbar menu-->
<nav class="secondary-nav navbar">
		<ul class="nav navbar-nav" style="margin-left: 5px; margin-top: 10px;">
		
			<li class="nav-item" style="margin-left: 30px; margin-top: -1px;">
				<i class="material-icons" style="color: white; float: left; font-size: 22px;">dashboard</i>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="/my/home" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">My홈</span></a>
			</li>
						
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">turned_in</i>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">라이브러리</span></a>
						<ul class="dropdown-menu">						
							<li><a href="/subscribe/blog.mt">구독한 블로그</a></li>
						</ul>
			</li>

			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">subject</i>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">구독</span></a>
						<ul class="dropdown-menu">						
							<li><a href="/my/library/postgood">좋아요</a></li>
							<li><a href="/my/library/purchases">구매 항목</a></li>
						</ul>
			</li>
			
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">monetization_on</i>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">포인트</span></a>
						<ul class="dropdown-menu">						
							<li><a href="/my/point/plist">사용내역</a></li>
							<li><a href="/my/point/charge">충전하기</a></li>
							<li><a href="/my/point/clist">충전내역</a></li>
							<li><a href="/my/point/withdraw">출금하기</a></li>
							<li><a href="/my/point/wlist">출금내역</a></li>
						</ul>
			</li>
			
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">settings</i>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">설정</span></a>
						<ul class="dropdown-menu">						
							<li><a href="/my/settings/account">계정 설정</a></li>
							<li><a href="/my/settings/profile">프로필 편집</a></li>
							<li><a href="/my/settings/password">비밀번호 변경</a></li>
							<li><a href="/my/settings/bank">출금계좌 설정</a></li>
							<li><a href="/my/settings/memberdelete">회원 탈퇴</a></li>
						</ul>
			</li>
			
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">mail</i>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">쪽지</span></a>
						<ul class="dropdown-menu">						
							<li><a href="/mail/write.mt">쪽지보내기</a></li>
							<li><a href="/mail/list.mt?type=send">보낸쪽지함</a></li>
							<li><a href="/mail/list.mt?type=receive">받은쪽지함</a></li>
						</ul>
			</li>

		</ul>
</nav>






