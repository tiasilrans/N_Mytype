<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/navcss.css">
<style>
@media ( max-width : 767px) {	
	.search-nav{
		display: none;
	}	
}
</style>
<!--navbar menu-->
<section class="navbar-info ">
	<nav class="navbar navbar-default navbar-me" style="margin-bottom: 0px;">
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
				<a class="navbar-brand" href="/"><img src="/images/MTtitle.png" style="margin-top: -1px;"></a>
			</div>
			<div class="collapse navbar-collapse header-right-menu"
				id="navbar-primary-collapse">
				<c:choose>
				<c:when test="${sessionScope.login ne null }">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a class="header" href="/" id="home"><span style="color: #1a1a1a;">홈</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span style="color: #4d94ff;">내 블로그</span><span class="caret" style="color: #4d94ff;"></span></a>
						<ul class="dropdown-menu">						
						<!-- 블로그 리스트 -->				
						<c:if test="${sessionScope.blog ne null }">
						<c:forEach var="blog" items="${sessionScope.blog}" begin="0" end="${sessionScope.blog.size()}">
							<li style="margin-bottom: 8px;"><a style="font-weight: bold; background-color: #66a3ff; color: white;" href="/blog/${blog.URL}">${blog.TITLE}</a></li> 
							<li><a href="/blog/${blog.URL}/categories"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">toc</i>  <span style="margin-left: 10px;">카테고리</span></a></li> 
							<li><a href="/blog/${blog.URL}/subscribers"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">face</i>  <span style="margin-left: 10px;">구독자</span></a></li>   
							<li><a href="/blog/${blog.URL}/setting"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">settings</i>  <span style="margin-left: 10px;">설정</span></a></li>  
						</c:forEach>
						<hr/>
						</c:if>     
							<li><a href="/blog/create"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">add</i>  <span style="margin-left: 10px;">새 블로그 생성</span></a></li>
						</ul></li>
				</ul>  
			   
				<ul class="nav navbar-nav navbar-right" style="margin-right: 13px;">
				<!-- 알림 -->				
					<li style="margin: -7px;"><a href="/my/home"><i class="material-icons" style="color: #4d94ff; font-size: 30px;">notifications_none</i></a></li>
				<!-- 알림끝 -->				
					<li class="dropdown">
						<a id="account-toggler" class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" href="#" role="button" title="MY"
													style="padding: 0px; margin: 6px;">
													
                            <c:choose>
								<c:when test="${sessionScope.info.IMAGE eq null }">
									<img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 32px; width: 32px; margin: 2px;">
								</c:when>
								<c:otherwise>
									<img src="/images/profile/${sessionScope.info.IMAGE}" style="border-radius: 50%; height: 32px; width: 32px; margin: 2px;">
								</c:otherwise>
							</c:choose>
                            
                            <span class="sr-only">계정</span></a>
                            <ul class="dropdown-menu">     
                            	<li><a href="/my/home"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">dashboard</i><span style="margin-left: 10px;">MY홈</span></a></li>  
                            	<li><a href="/subscribe/blog.mt"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">turned_in</i><span style="margin-left: 10px;">구독</span></a></li>   
                            	<li><a href="/my/library/postgood"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">subject</i><span style="margin-left: 10px;">라이브러리</span> </a></li>
                            	<li><a href="/my/point/plist"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">monetization_on</i><span style="margin-left: 10px;">포인트</span></a></li> 
                            	<li><a href="/my/settings/account"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">settings</i><span style="margin-left: 10px;">설정</span></a></li>
                            	<li><a href="/mail/list.mt?type=send"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">mail</i><span style="margin-left: 10px;">쪽지</span></a></li>
                            	<c:if test="${sessionScope.info.POWER eq 1}">
	                            	<li><a href="/admin/main"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">vpn_key</i><span style="margin-left: 10px;">관리자 페이지</span></a></li>     
                            	</c:if>
                            	<li><a></a></li>  
                            	<li><a href="/logout.mt"><i class="material-icons" style="color: #66a3ff; font-size: 23px; float: left;">power_settings_new</i><span style="margin-left: 10px;">로그아웃</span></a></li>
                            </ul>
					</li>   
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="nav navbar-nav navbar-right" style="margin-right: 13px;">											
					<li><a class="bnt" href="/join.mt" id="join">회원가입</a></li>
					<li><a class="bnt" id="login" data-toggle="modal" data-target="#login-form">로그인</a></li>				
				</ul>
				</c:otherwise>
			</c:choose>	
			<ul class="nav navbar-nav navbar-right">
				<li><form class="navbar-form form-horizontal" role="search" action="/search/main.mt">
					<div class="input-group">
						<input type="text" class="search-box" placeholder="마이타입 검색" name="keyword" style="color: #1a1a1a;">
						<button type="submit" class="btn">
							<span class="glyphicon glyphicon-search" style="margin-bottom: 7px; color: #80b3ff;"></span>
						</button>
					</div>
				</form></li>				
			</ul>		
			</div>
			<!-- /.navbar-collapse -->			
	</nav>
</section>
<!-- end of navbar-->

<script>
	$(window).scroll(function() {
		if ($(this).scrollTop() > 5) {
			$(".navbar-me").addClass("fixed-me");
			$(".fixed-me").removeClass("navbar-me");
		} else {
			$(".fixed-me").addClass("navbar-me");
			$(".navbar-me").removeClass("fixed-me");
			
		}
	});
</script>


<!-- 쪽지왔을때 modal생성 -->
<c:if test="${sessionScope.login ne null }">
	<script>
		var ws = new WebSocket("ws://${initParam.realip }/ws/mail.ws");
		ws.onmessage = function(e) {
			if(e.data == "mail"){
			console.log(e.data);
				$("#mailmodal").modal();
			};
		};
	</script>
</c:if>



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
						<input class="form-control" type="text"
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
 
 <!-- 쪽지왔을때 modal -->
   <div class="modal fade" id="mailmodal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">메일이 도착했습니다.</h4>
        </div>
        
        <div class="modal-body">
          		<div class="form-group row" align="center">
          		<a href="/mail/list.mt?type=receive"><button type="button" class="btn btn-primary">쪽지함이동</button></a>
		</div>
        </div>

      </div>
      
    </div>
  </div>
