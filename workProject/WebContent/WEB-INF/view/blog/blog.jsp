<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0px;
	padding: 0px;
}

.box {
	border: 1px solid;
	border-color: #d9d9d9;
	width: 100%;
}

.navbar-form {
	margin: 0;
	margin-top: 5px;
	padding: 8px 0px;
}

.search-input {
	height: 48px;
	position: relative;
	padding: 6px 48px 6px 12px;
	font-size: 14px;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	position: relative;
}

.search {
	display: block;
	position: relative;
}

.btn-search {
	position: absolute;
	top: 0;
	right: 0px;
	width: 48px;
	height: 48px;
	padding: 12px;
	background-color: transparent;
	border: 0;
}

.navbar-form .search-box {
	border: 1px solid;
	height: 35px;
	outline: none;
	width: 320px;
	padding-right: 3px;
	padding-left: 15px;
	margin: 4px;
	-webkit-border-radius: 22px;
	-moz-border-radius: 22px;
	border-radius: 22px;
	border-color: #d9d9d9;
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
a:hover{
	color: red;
}
.search-box:focus+button {
	z-index: 3;
}

.section {
	padding: 15px;
	margin-bottom: 16px;
	background-color: #fff;
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
	.label.hashtag {
		display: inline-block;
		padding: 7px;
		margin-right: 2px;
		margin-bottom: 6px;
		font-weight: 400;
		font-size: 13px;
		line-height: 17px;
		color: #606060;
		border: 1px solid #e5e5e5;
		border-radius: 3px;
		text-decoration: none;
	}
	.button {
	    background-color: #4CAF50; /* Green */
	    border: none;
	    color: white;
	    padding: 8px 20px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 14px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.button1 {background-color: #303030;}

}
</style>

<div class="row" align="center">
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<div class="row">
			<div class="col-xs-8" align="left" style="color: black;">
				발행한 포스트가 없습니다.<br /> <br />
				<button class="button button1" title="새 포스트를 작성합니다.">새 포스트 쓰기</button>
			</div>
			
			<div class="col-xs-4">

				<section class="section box">
					<div class="form-group" align="left">
						<form class="search" aria-labelledby="search-toggler"
							role="search" action="/search" method="get">
							<input class="form-control form-control-sm search-input"
								type="search" name="keyword" value="" data-action="grow"
								placeholder="검색어를 입력해 주세요">
							<button type="submit" class="btn btn-search">
								<i class="glyphicon glyphicon-search" style="color: #999"></i>
							</button>
						</form>
					</div>
				</section>

				<section class="section box">
					<div class="media">
						<div class="media-body" align="left">
							<h3 class="media-heading" style="color: black;">블로그 제목</h3>
							<div style="color: #a6a6a6;">
								<span>구독자</span> 0 <span>포스트</span> 0 <br /> <br />
							</div>
							<button class="button button1">구독하기</button>

						</div>
						<div class="media-right">
							<img
								src="https://cdn.postype.com/assets/img/avatar/blog_blank_p.svg"
								class="media-object" style="width: 60px">

						</div>

					</div>
				</section>


				<section class="section box">
					<div class="form-group">
						<h3 align="left" style="color: black;">카테고리</h3>
						<ul class="Kategorie nav row">
							<li class="Kategorie nav-item"><a class="Kategorie nav-link"
								href="/blog/blogView" style="color: #a6a6a6;" align="left">
									전체 보기 <span class="post-count">3</span>
							</a></li>
							<li class="Kategorie nav-item"><a class="nav-link" href=""
								style="color: #a6a6a6;" align="left">일기<span
									class="post-count">3</span></a></li>
							<li class="Kategorie nav-item"><a class="nav-link" href=""
								style="color: #a6a6a6;" align="left">수필<span
									class="post-count">3</span></a></li>

						</ul>
					</div>
				</section>
				<section class="section box">
					<h3 align="left" style="color: black;">태그</h3>
					<div align="left">
						<a class="label hashtag" href="/">혼잣말</a> 
						<a class="label hashtag" href="/">일상</a> 
						<a class="label hashtag" href="/">테스트</a> 
						<a class="label hashtag" href="/">일기</a> 
						<a class="label hashtag" href="/">소설</a> 
						<a class="label hashtag" href="/">수필</a> 
						<a class="label hashtag" href="/">하루</a>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>








