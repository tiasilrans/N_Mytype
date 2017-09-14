<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<style>
  
table.type07 {
    line-height: 1.5;
    border: 1px solid #ccc;
    border-radius: 3px;
}
table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
}
table.type07 thead th {
	text-align: center;
	padding: 10px;
    border-bottom : 1px solid #ccc ;
}
table.type07 td {
	text-align: center;
    padding: 7px;
}
</style>


<div align="center">
	<div style="width: 50%;" align="left">
	<h2>구독중인 블로그</h2>
	<hr style="margin-top: 10px;"/>
	</div>

		<c:choose>
		<c:when test="${slist ne null}">
				<c:forEach var="blog" items="${slist}">
				
				<div class="panel panel-default"
					style="width: 40%; text-align: left">
					<div class="panel-body" style="background-color: #F6F6F6;">
					<div class="col-md-2" style="padding : 0px;">
					<a href="/blog/${blog.URL }" style="color: #616161;">
						<c:choose>
							<c:when test="${blog.IMAGE eq null}">
								<img src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png" style="width: 65px; height: 65px; border-radius: 5px;">
							</c:when>
							<c:otherwise>
								<img src="/images/profile/${blog.IMAGE}" style="width: 65px; height: 65px; border-radius: 5px;">
							</c:otherwise>
						</c:choose>
					</a>
					</div>
					<div class="col-md-8" style="padding : 0px;">
						<div style="font-size: 20px; font-weight: bold; padding-top: 5px;">
						<a href="/blog/${blog.URL }" style="color: #616161; text-decoration: none;">
						${blog.TITLE}</a></div>
						<div style="padding: 5px; padding-left: 5px; padding-top: 0px;">${blog.INTRO}</div>
					</div>
					
					<div class="col-md-2" style="padding : 0px;" style="vertical-align: middle;">
						<button class="btn btn-dafault" type="button">구독취소</button>
					</div>
					</div>
				</div>
				
			</c:forEach>
		</c:when>
		<c:otherwise>
			<ul class="list-group" style="width: 50%; text-align: left">
				<c:forEach var="blog" items="${slist}">
					<h5>구독중인 블로그가 없습니다.</h5>
				</c:forEach>
			</ul>
			</c:otherwise>
		</c:choose>
	
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/subscribe/blog.mt?np=${i}">${i}</a></li>
	</c:forEach>
	</ul>
</div>