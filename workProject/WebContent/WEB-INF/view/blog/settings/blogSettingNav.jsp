<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- blogSetting navbar menu-->
<nav class="secondary-nav navbar">
		<ul class="nav navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}">${blogTitle.TITLE}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/blog/admin/${url}/posts">포스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/categories">카테고리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/subscribers">구독자</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/blog/${url}/setting">설정</a>
			</li>
		</ul>
</nav>






