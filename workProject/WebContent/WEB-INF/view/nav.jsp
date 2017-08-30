<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
body {
	margin: 0px;
	padding: 0px;
	min-height: 2500px;
	background-color: #f28281;
}

.navbar-info {
	width: 100%;
}

.fixed-me {
	transition: all 1s;
}

.fixed-me {
	background-color: #fff !important;
	padding: 0px !important;
	margin-bottom: 5px;
	position: fixed;
	top: 0;
	z-index: 888;
	width: 100%;
	border-bottom: 3px solid #e65100 !important;
}

.navbar-me {
	transition: all 1s;
}

.header-right-menu {
	padding: 5px 15px !important;
}

.navbar-me {
	padding: 10px 0px;
	background-color: transparent;
	top: 0px;
	border: 0px;
	border-radius: 0px;
}

.navbar-collapse {
	text-align: center;
	border-top-width: 0px;
	padding-top: 10px;
	margin-top: 5px;
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
	border: 0px;
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
		background-color: #000;
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
</style>

<!--navbar menu-->
<section class="navbar-info">
	<nav class="navbar navbar-default navbar-me">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button"
					class="navbar-toggle collapsed menu-collapsed-button"
					data-toggle="collapse" data-target="#navbar-primary-collapse"
					aria-expanded="false" style="float: left;">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">MyType</a>
			</div>

			<div class="collapse navbar-collapse header-right-menu"
				id="navbar-primary-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="header" href="javascript:"
						id="home">홈</a></li>
					<li><a class="" href="javascript:" id="services-menu">구독</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">내 블로그<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href=""></a></li>
							<li><a href=""></a></li>
							<li><a href="/blog/create">새 블로그 만들기</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<li><form class="navbar-form form-horizontal" role="search">
					<div class="input-group">
						<input type="text" class="search-box" placeholder="Search">
						<button type="submit" class="btn">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</form></li>				
					<li><a class="bnt" href="/join.mt" id="join">회원가입</a></li>
					<li><a class="bnt" href="/login.mt" id="login">로그인</a></li>
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
