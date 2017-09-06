<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/blogViewcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

#app-menu-toggler:hover {
    box-shadow: 0 0 0 1px rgba(0,0,0,.15), 0 5px 10px 0 rgba(0,0,0,.05), 0 10px 20px 0 rgba(0,0,0,.05);
}

#app-menu-toggler {
    z-index: 1060;
    padding: 8px;
    border: 0;
    background-color: #fff;
    box-shadow: 0 0 0 1px rgba(0,0,0,.15);
}

.btn-secondary:hover, .btn-secondary.focus, .btn-secondary:focus {
    color: #303030!important;
    background-color: #f5f5f5;
    border-color: #e5e5e5;
}

.btn-secondary:hover {
    color: #373a3c;
    background-color: #e6e6e6;
    border-color: #adadad;
}

.btn{
	padding: 0px;
}

#app-menu-container {
    position: fixed;
    right: 16px;
    bottom: 16px;
    z-index: 1050;
}

 #app-menu {
    display: none;
    position: fixed;
    z-index: 1050;
    bottom: 48px;
    right: 0;
    width: 100%;
    max-width: 288px;
    max-height: 700px;
    margin: 16px 16px 30px 16px;
    overflow-y: auto;
    border: 0;
    border-radius: 3px;
    background-color: #fff;
    box-shadow: 0 0 0 1px rgba(0,0,0,.05), 0 5px 10px 0 rgba(0,0,0,.05), 0 10px 20px 0 rgba(0,0,0,.05);
}


</style>

<div class="row" align="center">
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<div class="row">
			<div class="col-xs-8" align="left" style="color: black;">
				발행한 포스트가 없습니다.<br /> <br />
				<a href="/blog/postWrite"><button class="button button1" title="새 포스트를 작성합니다.">새 포스트 쓰기</button></a>
			</div>
			
			<div class="col-xs-4">

				<section class="section box">
					<div class="form-group" align="left" style="margin-bottom: -15px;">
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
							<h5 class="media-heading" style="color: black; font-weight: bold;">${map.TITLE }</h5>
							<div style="color: #a6a6a6;">
								<span style="font-size: 12px;">구독자</span> 0 <span style="font-size: 12px;">포스트</span> 0
							</div>
							<button class="button button1" style="margin-top: 10px;">구독하기</button>

						</div>
						<div class="media-right">
							<img
								src="https://cdn.postype.com/assets/img/avatar/blog_blank_p.svg"
								class="media-object" style="width: 60px">
						</div>

					</div>
				</section>


				<section class="section box">
					<div class="form-group" style="font-family:sans-serif;">
						<h6 align="left" style="color: black;">카테고리</h6>
						<ul class="Kategorie nav row">
							<li class="Kategorie nav-item"><a class="Kategorie nav-link"
								href="/blog/blogView" style="color: black; font-weight :light;" align="left">
									전체 보기 <span class="post-count">3</span>
							</a></li>
							<li class="Kategorie nav-item"><a class="nav-link" href=""
								style="color: #8c8c8c;" align="left">일기<span
									class="post-count">3</span></a></li>
							<li class="Kategorie nav-item"><a class="nav-link" href=""
								style="color: #8c8c8c;" align="left">수필<span
									class="post-count">3</span></a></li>

						</ul>
					</div>
				</section>
				
				<section class="section box">
					<h6 align="left" style="color: black; font-family: sans-serif;">태그</h6>
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
			
			<div id="app-menu-container">
			    <button id="app-menu-toggler" class="btn btn-secondary" type="button">
			       <img src="/images/button.png" width="40px;" height="40px;">
			    </button>		    
			</div>
			
		</div>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>

 <div id="app-menu" style="display: none;">
 	<div>
 		<div>
 			<div class="menu-header">
 				<div class="col-xs-8 px-0" style="margin-bottom: 5px; margin-top: 20px;">
 					<a><img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 32px; width: 32px;"><span style="margin: 10px; font-weight: bold; color:#262626;;">사용자 이름</span></a>
 					
 				</div>
 				<div class="col-xs-2 px-0" style="margin-top: 23px;">
 					<span><i class="material-icons" style="color: #a6a6a6; font-size: 26px;">notifications_none</i></span> 
 				</div>
 				
 				<div class="col-xs-2 px-0" style="margin-top: 23px;">
 					<i class="material-icons" style="color: #a6a6a6; font-size: 26px;">power_settings_new</i></span>
 				</div>
 				
 				<div class="col-xs-8 px-0" style="margin : 5px; margin-top: 10px;">
 					<a class="home" href="/"
						id="home"><i class="material-icons" style="color: #a6a6a6; font-size: 26px;">home</i></a><span style="margin-left: 10px;">홈</span>
 				</div>
 				
 				<div class="col-xs-8 px-0" style="margin : 5px; margin-bottom: 30px;">
 					<i class="material-icons" style="color: #a6a6a6; font-size: 25px;">check_circle</i> <span style="margin-left: 10px;">구독</span>
 				</div>
 			
 				
 			</div>
 			
 			
 		</div>
 	</div>
 </div>
  
<script>
	$("#app-menu-toggler").on("click", function(){
		var menu = $("#app-menu");
		if(menu.css("display") == "none"){
			menu.css("display", "block");
		}else{
			menu.css("display", "none");
		}
		
	});

</script>










 				