<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 230px; vertical-align: middle;}
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 200px; vertical-align: middle;}
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 100px; vertical-align: middle;}
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 120px; }
.scrolltbody th:last-child { width: 80px; }
.scrolltbody td:last-child { width: calc( 80px - 18px ); }
</style>
    
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>댓글 관리</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div align="left" style="margin-left: 180px; margin-top: 50px;">
	<table class="table scrolltbody" style="width: 730px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>원본글보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 250px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="r" items="${list}">
			<tr><td>
			<c:choose>
			<c:when test="${r.SUBCONTENT eq null}">
			${r.CONTENT}
			</c:when>
			<c:otherwise>
			<a href="#" data-toggle="popover" data-trigger="hover" data-content="${r.CONTENT}" style="color: black; text-decoration: none;">	${r.SUBCONTENT}</a>
			</c:otherwise>
			</c:choose>
			</td>
			<td>${r.EMAIL}</td>
			<td><fmt:formatDate value="${r.CDATE}" pattern="yyyy-MM-dd"/></td>
			<td><a href="/${r.URL}/post/${r.PNUM}" title="글제목" data-toggle="popover" data-trigger="hover" data-content="${r.TITLE}">
			<button type="button" class="btn btn-link" style="font-size: 13;">글보기</button></a></td>
			<td><button type="button" class="btn btn-link" id="delete" style="font-size: 13;" value="${r.NUM}">삭제</button></td>
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
		var num = this.value;
		$.ajax({
			url:"/admin/deleteReply",
			method : "get",
			data : {
			"num" : num,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("댓글 삭제에 실패하였습니다.");
			}
			});
});
</script>