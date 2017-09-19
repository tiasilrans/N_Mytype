<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


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
	width: 15px;
	height: 15px;
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
	font-size: 12px;
	font-weight: 800;
	color: #fff;
	background: #1a1a1a;
	text-align: center;
	line-height: 18px;
}
</style>

 
<section class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="">
					<div class="header" style="margin-left: 17px; margin-bottom: 40px;">
						<input type="checkbox" id="postck" class="checkbox-style"/>
						<label for="postck"></label> 
					</div>
					<!-- 포스트 검색창 -->
					<div class="admin-search">
					
					</div>
					<!-- 포스트 리스트 -->
				<c:forEach var="obj" items="${list }">
					<div class="post-list-proup" style="padding: 1rem 1.75rem; margin-top: -40px;">
						<label class="" style="float: left; left: 0.8rem; position: absolute; top:8rem;">
							<input type="checkbox" value="${obj.NUM }" id="postck" class="checkbox-style"/>
							<label for="postck"></label> 
						</label>
						<div class="media"> 
							<div class="media-body">
								<h4><a  style="color: black; font-family: sans-serif; font-size: 15px;"  href="/${url}/post/${obj.NUM }">${obj.TITLE }</a></h4>
								<div class="media-text" style="color: #808080;">
									${obj.CATEGORY }
								</div>
								<div class="media-text">
									<time style="color: #808080; font-family: sans-serif; font-size: 12px;"><fmt:formatDate value="${obj.PDATE }" pattern="yyyy.MM.dd"/></time>
									<span style="color: #808080; font-family: sans-serif; font-size: 12px;"> 조회 ${obj.COUNT }</span>
									<span style="color: #808080; font-family: sans-serif; font-size: 12px;"> 댓글 </span>
								</div> 
							</div>
						</div>
						<!-- 버튼 그룹 -->
						<div class="btn-group" style="float: right; margin-right: 30px;">
						<a class="btn"><i class="material-icons" title="카테고리 변경" style="margin-top: -3px; color: #999999;">folder_open</i></a>
						<a class="btn"><i class="material-icons" title="휴지통으로 이동" style="margin-top: -3px; color: #999999;">delete</i></a>
						
				
			
                 	
						</div>	
					</div>
				</c:forEach>
				</div>
				<div class="pagination">
					
				</div>
			</div>
		</div>
	</div>
</section>