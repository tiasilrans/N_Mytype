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
			<ul class="list-group" style="width: 50%; text-align: left">
				<c:forEach var="blog" items="${slist}">
					<li class="list-group-item" style="background-color: #F6F6F6;">
						<img class="conhead-profileimg" src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png"
						style="">
						${blog.EMAIL} / ${blog.TITLE} / ${blog.INTRO} / ${blog.URL} 
					</li>
				</c:forEach>
			</ul>
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