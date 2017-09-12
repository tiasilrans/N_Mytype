<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- navCss -->
<link rel="stylesheet" href="/css/navcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
				<a class="navbar-brand" href="/"><img src="/images/title.png" style="margin: 5px;"></a>
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
						<!-- 블로그 리스트 -->				
						<c:if test="${sessionScope.blog ne null }">
						<c:forEach var="blog" items="${sessionScope.blog}" begin="0" end="${sessionScope.blog.size()}">
							<li style="margin-left: 25px;"><a style="font-weight: bold;" href="/blog/${blog.URL}">${blog.TITLE}</a></li>
							<li style="margin-left: 25px;"><a href="">임시저장글 <i class="material-icons" style="margin-left: 10px; float: right; font-size: 23px;">mode_edit</i></a></li>
							<li style="margin-left: 25px;"><a href="">발행글</a></li>  
							<li style="margin-left: 25px;"><a href="/blog/${blog.URL}/categories">카테고리</a></li> 
							<li style="margin-left: 25px;"><a href="">구독자</a></li>   
							<li style="margin-left: 25px;"><a href="">설정</a></li>  
						</c:forEach>   
						</c:if>     
							<li><a href="/blog/create"><i class="glyphicon glyphicon-plus" style="margin-right: 7px;"></i> 새 블로그 만들기</a></li>
						</ul></li> 
				</ul>   
			   
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a id="account-toggler" class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" href="#" role="button" title="MY"
													style="padding: 0px; margin: 6px;">
                            <img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 32px; width: 32px; margin: 2px;">
                            <span class="sr-only">계정</span></a>
                            <ul class="dropdown-menu">     
                            	<li style="vertical-align: middle;"><a href="/my/home"><label class="material-icons" style="color: #999999; font-size: 23px; float: left;">dashboard</label>　　<font style="margin-top: 7px;">MY홈</font> </a></li>
                            	<li><a href="/my/goods"><i class="material-icons" style="color: #999999; font-size: 23px; float: left;">favorite</i>　　좋아요</a></li>   
                            	<li><a href="/my/purchases"><i class="material-icons" style="color: #999999; font-size: 23px; float: left;">get_app</i>　　구매항목 </a></li>
                            	<li><a href="/my/point/plist"><i class="material-icons" style="color: #999999; font-size: 23px; float: left;">monetization_on</i>　　포인트</a></li> 
                            	<li><a href="/my/settings/account"><i class="material-icons" style="color: #999999; font-size: 23px; float: left;">settings</i>　　설정</a></li>
                            	<li><a></a></li>
                            	<li><a></a></li>     
                            	<li><a></a></li>  
                            	<li><a href="/logout.mt"><i class="material-icons" style="color: #999999; font-size: 23px; float: left;">power_settings_new</i>　　로그아웃</a></li>
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
					<li style="margin: -7px;"><a href="/my/home"><i class="material-icons" style="color: #999999; font-size: 30px;">notifications_none</i></a></li>
				</ul>
				
				
				<ul class="nav navbar-nav navbar-right">
					<li><form class="navbar-form form-horizontal" role="search">
						<div class="input-group">
							<input type="text" class="search-box" placeholder="마이타입 검색">
							<button type="submit" class="btn">
								<span class="glyphicon glyphicon-search" style="margin-bottom: 7px; color: #999999;"></span>
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