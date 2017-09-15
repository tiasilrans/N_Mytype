<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<section class="navbar-info ">
	<nav class="navbar navbar-default" style="margin-bottom: 0px; ">
		<div>
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
			</div> 

			
				 <!-- 나브바 왼쪽 -->
				<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="background-image: none; background-color: white; margin: 0px;"><i class="material-icons" style="font-size: 30px; color: black;">menu</i></a>
						<ul class="dropdown-menu">		  				
									  
						<c:if test="${sessionScope.blog ne null }">
						<c:forEach var="blog" items="${sessionScope.blog}" begin="0" end="${sessionScope.blog.size()}">
							<li style="margin-bottom: 20px;"><a href="/"><img src="/images/title.png" style="height: 18px;"></a></li>
							<li style="margin-left: 20px; font-family: sans-serif; color: black; font-size: 15px; font-weight: 700%"><span>${post.TITLE}</span></li> 
							<li style="margin-left: 20px; color: #999999; font-size: 12px; margin-bottom: 10px;">0 <span>포스트</span> 0 <span>구독자</span></li>
							<li style="margin-left: 20px; margin-bottom: 40px;"><button class="btn btn-default" style="width: 200px;">구독하기</button></li>
							<li style="margin-bottom: 10px; margin-left: 23px;"><span style="color: #999999; font-family: sans-serif; font-size: 13px; ">작가</span></li>     
							<li style="margin-left: 20px; margin-bottom: 35px;"><img src="/images/avatar_yellow.png" style="width:45px; border-radius: 30px; width: 30px; height: 30px;"><span style="margin-left: 10px; font-family: sans-serif; color: black;">작가의 닉네임</span></li>
							<li style="margin-top: 10px; margin-left: 20px;"><span style="color: #999999; font-family: sans-serif; font-size: 13px;">카테고리</span></li>
						</c:forEach>   
						</c:if>         
						</ul></li>     
				</ul>       
				
				<ul class="nav navbar-nav navbar-left">
					<li style="margin-top: 3px;"><a href="/blog/${post.url}"><i class="material-icons" style="color: black;">arrow_back</i></a></li>
				</ul>    
				       
				
			   <!-- 나브바 오른쪽 -->
				<ul class="nav navbar-nav navbar-right"> 
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="background-image: none; background-color: white; margin: 0px;"><i class="material-icons" style="color: black;">more_vert</i></a>
						<ul class="dropdown-menu">		  		 		
								  
						<li><i class="material-icons" style="float: left;">bookmark_border</i><span>읽기 목록에 추가</span></li>
						<li><i class="material-icons" style="float: left; margin-left: -24px;">insert_link</i><span>링크 복사</span></li>
						<li><i class="material-icons" style="float: left; margin-left: -22px;">flag</i><span>신고하기</span></li>
					      
						</ul></li>   
				</ul>		
		</div>
	</nav>
</section>


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