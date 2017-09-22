<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
@media screen and (max-width: 767px) {
    .search-navbar {
        display: none;
    }
}
</style>

<!-- blogSetting navbar menu-->
<nav class="secondary-nav navbar">
		<ul class="nav navbar-nav" style="margin-left: 105px; margin-top: 10px;">
			<li class="nav-item">
				<a class="nav-link dropdown-toggle" href="/search/main.mt?keyword=${keyword}" style="background-image: none; padding: 0px; background-color:rgba( 255, 0, 0, 0 ); margin-left: 45px;"><span style="color: white; font-family: sans-serif;">전체</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link dropdown-toggle" href="/search/post.mt?keyword=${keyword}" style="background-image: none; padding: 0px; background-color:rgba( 255, 0, 0, 0 );  margin-left: 45px;"><span style="color: white; font-family: sans-serif;">포스트</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link dropdown-toggle" href="/search/post.mt?keyword=${keyword}" style="background-image: none; padding: 0px; background-color:rgba( 255, 0, 0, 0 );  margin-left: 45px;"><span style="color: white; font-family: sans-serif;">태그</span></a>
			</li>

		</ul>
</nav>

