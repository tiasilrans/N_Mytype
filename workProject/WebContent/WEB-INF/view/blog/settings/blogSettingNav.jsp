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
		
			<li class="nav-item" style="margin-left: 28px; margin-top: -2px;">
				<i class="material-icons" style="color: white; float: left; font-size: 22px;">border_color</i>
			</li>
		
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;"">${blogTitle.TITLE}</span></a>
			</li>
			
			
			<li class="nav-item" style="margin-left: 40px;">
				<a class="nav-link" href="/blog/admin/${url}/posts" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">포스트</span></a>
			</li>
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons"  style="color: white; float: left; font-size: 25px;">toc</i>
			</li>
			
			
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/categories" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;"">카테고리</span></a>
			</li>
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -1px;">
				<i class="material-icons" style="color: white; float: left; font-size: 22px;">face</i>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/subscribers" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;">구독자</span></a>
			</li>
			
			
			<li class="nav-item" style="margin-left: 30px; margin-top: -2px;">
				<i class="material-icons" style="color: white; float: left; font-size: 22px;">settings</i>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/setting" style="background-image: none; padding: 0px; background-color:opacity;"><span style="color: white; font-family: sans-serif;"">설정</span></a>
			</li>
		</ul>
</nav>






