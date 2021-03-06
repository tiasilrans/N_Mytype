<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<section class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="">
					<div class="header">
						
					</div>
					<!-- 포스트 검색창 -->
					<div class="admin-search">
					
					</div>
					<!-- 포스트 리스트 -->
				<c:forEach var="obj" items="${list }">
					<div class="post-list-proup" style="padding: 1rem 1.75rem;">
						<label class="" style="position: absolute;">
							<input type="checkbox" value="${obj.NUM }">
						</label>
						<div class="media"> 
							<div class="media-body">
								<h4><a href="/${url}/post/${obj.NUM }">${obj.TITLE }</a></h4>
								<div class="media-text">
									${obj.CATEGORY }
								</div>
								<div class="media-text">
									<time><fmt:formatDate value="${obj.PDATE }" pattern="yyyy.MM.dd"/></time>
									<span> 조회 ${obj.COUNT }</span>
									<span> 댓글 </span>
								</div>
							</div>
						</div>
						<!-- 버튼 그룹 -->
						<div class="btn-group" style="position: absolute;">
							<a class="btn">카테고리 변경</a>
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