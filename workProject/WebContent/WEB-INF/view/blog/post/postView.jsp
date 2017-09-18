<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/postviewcss.css">

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
			<c:choose> 
				<c:when test="${post.CCONTENT ne ''}">
					<div class="charged-content">
						${post.CCONTENT }
					</div>
				</c:when>			
			
			</c:choose>
		</div>
		<div class="support" style="display: table; width: 100%;">
			<div class="message" style="display: table-cell; vertical-align: middle; padding-right: .75rem; line-height: 1.25;
			font-family: sans-serif; color: black; font-weight: 800px;">
				${post.nickname }님의 창작활동을 응원하고 싶으세요? 
			 
			</div>
			<div style="display: table-cell;">
				<button class="button button1" style="float: right;">후원하기</button>
			</div> 
		</div> 
		<footer class="post-footer">
		
		</footer>				
	</div> 
</div>


<!-- 본문 아래 블로그 포스트 목록 * 댓글 -->

<aside class="container aside">
	<!-- 블로그 소개 섹션 -->
	<section class="">
		<div class="body blog-info">
			<div class="media"> 
				<div class="media-body">
				</div>
			</div>					
		</div>
	</section>
	<!-- 블로그 포스트 리스트 섹션 -->
	<section class="">
	
	</section>
	<!-- 포스트 댓글 섹션 -->
	<section class="comments">
		<div class="body">
			<h4>댓글</h4>
			<div class="comments" id="comments">
				<form action="">
					<input type="hidden" value="" id="postNum">
					<textarea class="form-control autosize" name="content" id="mention" data-autosize-on="true"
						style="overflow: hidden; word-wrap: break-word; height: 60px;"></textarea>
					<div class="clearfix">
	            		<div class="checkbox-wrap" style="float: left;">
		                	<label class="custom-control custom-checkbox">
		                    <input type="checkbox" class="custom-control-input" name="is_secret" value="1">
		                    <span class="custom-control-indicator"></span>
		                    <span class="custom-control-description">비밀 댓글</span>
		                	</label>
	            		</div>
		            	<div style="float: right;">
		                	<button class="btn btn-primary btn-create-comment">댓글 남기기</button>
	           			</div>
        			</div>
				</form>
			</div>	
		</div>
	
	</section>

</aside>














