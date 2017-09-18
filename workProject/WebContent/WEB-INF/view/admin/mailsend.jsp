<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 30px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 230px; }
.scrolltbody th:last-child { width:100px; }
.scrolltbody td:last-child { width: calc( 100px - 18px ); }
</style>
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>관리자 쪽지 보내기</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<form action="/admin/mailsendExec">
<div style="margin-left: 100px;">
	<div class="col-md-4">
	<!-- 회원 리스트 -->
	<table class="table scrolltbody" style="width: 360px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th><input type="checkbox" id="all" style="vertical-align: middle;"/></th>
				<th>이메일</th>
				<th>닉네임</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 380px; overflow: auto; display: block;" id="mlist">
		<c:forEach var="m" items="${mlist}">
			<tr>
			<td><input class="ch" type="checkbox" name="email" value="${m.EMAIL}" style="vertical-align: middle;"/></td>
			<td>${m.EMAIL}</td>
			<td>
			<c:choose>
			<c:when test="${m.NICKNAME eq null}">
				<span style="color: red;">미지정</span>
			</c:when>
			<c:otherwise>
				${m.NICKNAME}
			</c:otherwise>
			</c:choose>
			</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="col-md-8">
	<table class="table" style="width: 35%; background-color: #F6F6F6; border: 1px solid #ccc;">
		<tbody style="font-size: 14px;">
				<tr>
					<td style="vertical-align: middle; width: 20%; font-weight: bold;" align="center">내용</td>
					<td style="width: 80%"><textarea class="form-control" cols="50" rows="15" name="content" style="resize: none;" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input class="btn btn-default" type="submit" value="보내기"/></td>
				</tr>
		</tbody>
	</table>
	</div>
</div>
</form>		
</div>
<c:if test="${exec ne null}">
<script>
	window.alert("보내기 완료");
</script>
</c:if>

<script>
	$("#all").on("click",function(){
		var v = $(this).prop("checked");
		
		$(".ch").each(function() {
			$(this).prop("checked", v);
		})
	});

</script>