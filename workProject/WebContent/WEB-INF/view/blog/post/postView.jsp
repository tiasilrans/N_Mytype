<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/postviewcss.css">
<style>
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
}

input[type=checkbox]+label:before {
	content: "";
	display: inline-block;
	width: 17px;
	height: 17px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 3px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=checkbox]:checked+label:before {
	content: "\2714"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 15px;
	font-weight: 800;
	color: #fff;
	background: #1a1a1a;
	text-align: center;
	line-height: 18px;
}
</style>

<div class="content" style="margin-top: 100px; margin-left: 100px; padding: 0px;">
	<div class="container">
		<div class="header">
			<div class="category" style="margin-bottom: 120px; margin-left: 3px;"> 
				<a style="color: black; font-family: sans-serif;" href="">${post.CATEGORY }</a> 
			</div> 
			
			<div style="margin-top: -70px;">      
			<h1 class="title" style="font-family: sans-serif; font-weight: bold; color: black;">${post.TITLE }</h1>
			</div>
			<div class="subtitle" style="font-family: sans-serif; color: black; font-size: 18px; margin-left: 3px;">${post.SUBTITLE }</div>
			<div class="profile" style="margin-top: 45px;">  
				<div class="media-profile">   
                	<div class="media-left" style="margin: 10px;  vertical-align: middle;"> 
     						<img src="/images/avatar_yellow.png" class="media-object" style="width:45px; border-radius: 30px; width: 35px; height: 35px;">
   					</div>    
    				<div class="media-body">  
      					<h4 class="media-heading" style="font-family: sans-serif; color: black;">${post.NICKNAME }</h4>
     					<h4 style="font-family: sans-serif; color: #808080;"><small>${post.PDATE }</small> <small>조회 ${post.COUNT }</small></h4>
                	</div> 
				</div> 
			</div>	
		</div>
		<div class="post-content" style="margin-top: 50px; color: black; font-family: sans-serif; font-weight: 700px;">
			<div class="free-content">
				${post.FCONTENT }
			</div> 
		<!-- 유료 컨텐츠 부분 -->
			<c:choose>
			<c:when test="${buy || sessionScope.login eq post.EMAIL }">
				<div class="charged-content">
					${post.CCONTENT }
				</div>
			</c:when>
			<c:otherwise>
				구매하여 나머지 보기
			</c:otherwise>			
			</c:choose>
		</div>
		<div class="support" style="display: table; width: 100%;">
			<div class="message" style="display: table-cell; vertical-align: middle; padding-right: .75rem; line-height: 1.25;
			font-family: sans-serif; color: black; font-weight: 800px;">
				${post.NICKNAME }님의 창작활동을 응원하고 싶으세요? 
			 
			</div>
			<div style="display: table-cell;">
				<button class="button button1" style="float: right;">후원하기</button>
			</div> 
		</div> 
		<footer class="post-footer" style="margin-top: 40px;">
		<i class="material-icons" style="font-size: 20px; color: #0d0d0d; float: left; font-weight: bold;">favorite_border</i><span style="margin-left: 3px; color: #0d0d0d; font-size: 15px;">0</span>
		<i class="material-icons" title="링크복사" style="font-size: 25px; color: #0d0d0d; float: right; margin-right: 395px;">insert_link</i> 
		</footer>				
	</div> 
</div>


<!-- 본문 아래 블로그 포스트 목록 * 댓글 -->

<aside class="container aside">
	<!-- 블로그 소개 섹션 -->
	<section class="">
		<div class="body blog-info" style="margin-bottom: 30px; margin-top: 30px;">
			<div class="media" style="margin-left: 45px;"> 
				<img src="/images/avatar_yellow.png" style="border-radius: 15%; height: 70px; width: 70px;">
			</div>
			<div class="media-body">
				
			</div>	
			<button class="btn btn-default" style="float: right; margin-right: 345px; margin-top: -45px;">구독하기</button> 
		</div>
	</section>
	<!-- 블로그 포스트 리스트 섹션 --> 
	<section class="">
	<div style="margin-left: 45px; margin-bottom: 30px;">
	<h5>이 블로그의 다른 포스트</h5>
	</div>
	</section>
	<!-- 포스트 댓글 섹션 -->
	<section class="comments">
		<div class="body" style="margin-left: 45px;"> 
			<h5>댓글</h5>
			<div class="comments" id="comments">
				<form action="">
					<input type="hidden" value="" id="postNum">
					<textarea class="form-control autosize" name="content" id="mention" data-autosize-on="true"
						style="overflow: hidden; word-wrap: break-word; height: 60px; width: 750px; resize: none;"></textarea>
					<div class="clearfix">
	            		<div class="checkbox-wrap" style="float: left; margin-top: 20px; margin-left: 2px;">
		                <input type="checkbox" id="notice" class="checkbox-style"/>
						<label for="notice">비밀댓글</label> 
	            		</div>
		            	<div style="float: right; margin-top: 7px; margin-right: 343px;">
		                	<button class="button button1">댓글 남기기</button>
	           			</div>
        			</div>
				</form>
			</div>	
		</div>
	
	</section>

</aside>














