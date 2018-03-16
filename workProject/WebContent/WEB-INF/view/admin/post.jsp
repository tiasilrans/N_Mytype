<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 230px; vertical-align: middle; text-align: center}
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 230px; vertical-align: middle; text-align: center}
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 100px; vertical-align: middle; text-align: center}
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 100px;  text-align: center}
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 130px;  text-align: center}
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { width: 110px;  text-align: center}
.scrolltbody th:last-child { width: 100px;  text-align: center}
.scrolltbody td:last-child { width: calc( 100px - 18px );  text-align: center}
</style>
    
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>포스트 관리</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div align="left" style="margin-left: 100px; margin-top: 50px;">
	<table class="table scrolltbody" style="width: 1000px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>제목</th>
				<th>작성자</th>
				<th>좋아요</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>상세보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 250px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="p" items="${plist}">
			<tr>
			<td style="text-align: left;">
			<c:choose>
			<c:when test="${p.SUBTITLE eq null}">
			${p.TITLE}
			</c:when>
			<c:otherwise>
			<a href="#" data-toggle="popover" data-trigger="hover" data-content="${p.TITLE}" style="color: black; text-decoration: none;">
				${p.TITLE}
			</a>
			</c:otherwise>
			</c:choose>
			</td>
			<td>${p.EMAIL}</td>
			<td>${p.GOOD}</td>
			<td>${p.COUNT}</td>
			<td><fmt:formatDate value="${p.PDATE}" pattern="yyyy-MM-dd"/></td>
			<td>
			<a href="/${p.URL}/post/${p.NUM}"><button type="button" class="btn btn-link" style="font-size: 13;">글보기</button></a></td>
			<td><button type="button" class="btn btn-link" id="delete" style="font-size: 13;" value="${p.NUM}">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

$("#delete").on("click",function(){
	var rst = window.confirm("삭제하시겠습니까?");
	if(rst){
		var num = this.value;
		$.ajax({
			url:"/admin/deletePost",
			method : "get",
			data : {
			"num" : num,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("삭제에 실패하였습니다.");
			}
			});
	}
});
</script>






