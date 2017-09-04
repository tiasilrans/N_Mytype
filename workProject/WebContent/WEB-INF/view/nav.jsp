<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	margin: 0px;
	padding: 0px;
	min-height: 2500px;
	background-color: #fff;
}

.navbar-info {
	width: 100%;
}

.fixed-me {
	background-color: #fff !important;
	padding: 0px !important;
	margin-bottom: 5px;
	position: fixed;
	top: 0;
	z-index: 888;
	width: 100%;
	border-bottom: 3px solid #00134d !important;
	transition: all 1s;
}

HEAD
.navbar-me{
    padding: 10px 0px;
    background-color: transparent;
    top: 0px;
    border: 0px;
    border-radius: 0px;
    bottom : 0px;
    transition: all 1s;
}
  
.navbar-collapse{
    text-align: center;
    border-top-width: 0px;
    padding-top: 10px;
    margin-top: 5px;
}
  
.header-right-menu {
	padding: 5px 15px !important;
}

.navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover
	{
	background-color: transparent;
}

.menu-collapsed-button {
	margin: 10px 15px 10px 15px !important;
}

@media ( max-width : 767px) {
	.navbar-nav>li>a {
		line-height: 20px;
	}
	.navbar-brand {
		padding: 7px 15px;
	}
	.navbar-brand img {
		width: 144px;
	}
}

.navbar-form {
	margin: 0;
	margin-top: 5px;
	padding: 8px 0px;
}

.navbar-form .search-box {
	border: 1px solid rgba(0,0,0,.25);
	height: 35px;
	outline: none;
	width: 320px;
	padding-right: 3px;
	padding-left: 15px;
	margin: 4px;
	-webkit-border-radius: 22px;
	-moz-border-radius: 22px;
	border-radius: 22px;
}

.navbar-form button {
	border: 0;
	background: none;
	padding: 2px 5px;
	margin-top: 2px;
	position: relative;
	left: -34px;
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.search-box:focus+button {
	z-index: 3;
}

@media ( min-width : 768px) {
	.dropdown:hover {
		background-color: #fff;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		
	}
	.dropdown:hover .dropdown-menu {
		display: block;
	}
	.navbar-form {
		padding: 0px;
	}
	.navbar-form .search-box {
		width: 260px;
		height: 32px;
	}
	
	
}

/* 로그인창 */
#login-sbt,#login-alert{
	width : 360px;
	height: 60px;
}
#login-email,#login-pw{
	width : 360px;
	height: 40px;
}

</style>

<!--navbar menu-->
<section class="navbar-info ">
	<nav class="navbar navbar-default">
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
				<a class="navbar-brand" href="/"><img src="/images/mytype.png" ></a>
				</div>

			<div class="collapse navbar-collapse header-right-menu"
				id="navbar-primary-collapse">
				<c:choose>
				<c:when test="${sessionScope.login ne null }">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="header" href="/"
						id="home">홈</a></li>
					<li><a class="" href="">구독</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">내 블로그<span class="caret"></span></a>
						<ul class="dropdown-menu">
						
						<!-- 만든 블로그가 잇을 경우 보여준다 -->
						<c:if test="${sessionScope.blog ne null }">
						<c:forEach var="blog" items="${sessionScope.blog}" begin="0" end="${sessionScope.blog.size()}">
							<li><a href="/blog/${blog.URL}">${blog.TITLE}</a></li>
						</c:forEach>
						</c:if>
						
							<li><a href="/blog/create"><i class="glyphicon glyphicon-plus"  style="margin-right:7px;"></i> 새 블로그 만들기</a></li>
						</ul></li>
				</ul>
			
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a id="account-toggler" class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" href="#" role="button" title="MY"
													style="padding: 0px; margin: 6px;">
                            <img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 32px; width: 32px;">
                            <span class="sr-only">계정</span></a>
                            <ul class="dropdown-menu">
                            	<li><a href="/my/home"><i class="glyphicon glyphicon-th-list"></i>　　MY홈</a></li>
                            	<li><a href="/my/goods"><i class="glyphicon glyphicon-heart"></i>　　좋아요</a></li>
                            	<li><a href="/my/purchases"><i class="glyphicon glyphicon-save"></i>　　구매항목</a></li>
                            	<li><a href="/my/point/plist"><i class="fa fa-money"></i>　　포인트</a></li>
                            	<li><a href="/my/settings/account"><i class="glyphicon glyphicon-cog"></i>　　설정</a></li>
                            	<li><a></a></li>
                            	<li><a></a></li>
                            	<li><a></a></li>
                            	<li><a href="/logout.mt"><i class="glyphicon glyphicon-off "></i>　　로그아웃</a></li>
                            </ul>
					</li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="nav navbar-nav navbar-right">											
					<li><a class="bnt" href="/join.mt" id="join">회원가입</a></li>
					<li><a class="bnt" id="login" data-toggle="modal" data-target="#login-form">로그인</a></li>				
				</ul>
				</c:otherwise>
			</c:choose>	
				<ul class="nav navbar-nav navbar-right">
					<li><form class="navbar-form form-horizontal" role="search">
						<div class="input-group">
							<input type="text" class="search-box" placeholder="마이타입 검색">
							<button type="submit" class="btn">
								<span class="glyphicon glyphicon-search" style="margin-bottom: 7px;"></span>
							</button>
						</div>
					</form></li>				
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
</section>
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


<!-- 로그인창 modal  -->
  <div class="modal fade" id="login-form" role="dialog">
    <div class="modal-dialog" style="width: 450px;">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        
        <div class="modal-body">
          		<div class="form-group row" align="center">		
			<form action="/loginExec.mt" method="post">					
				<div class="form-group row">
						<input class="form-control" type="email"
							placeholder="e-mail" name="email" id="login-email" required />
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password"
						placeholder="비밀번호" name="pw" id="login-pw" required />
				</div>
				<div align="center" class="row">

					<div class="form-group row" align="right" style="width: 360px;">
					<a>비밀번호 찾기</a>｜<a href="join.mt">회원가입</a>
					</div>
					<button id="login-sbt" type="submit" class="btn">로그인</button>
				</div>
			</form>
		</div>
        </div>

      </div>
      
    </div>
  </div>
 