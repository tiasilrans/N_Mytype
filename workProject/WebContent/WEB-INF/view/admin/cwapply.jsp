<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>충전 출금 신청 관리</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div align="left" style="margin-left: 100px;">
	<!-- 검색바 -->
	<div class="navbar-form form-horizontal" role="search" style="margin-bottom: 10px;">
					<div class="input-group">
						<input type="text" class="search-box" id="msearch" placeholder="회원 검색">
						<button type="button" class="btn">
							<span class="glyphicon glyphicon-search" style="margin-bottom: 7px; color: #999999;"></span>
						</button>
					</div>
		</div>

	<!-- 회원 리스트 -->
	<table class="table scrolltbody" style="width: 800px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>이메일</th>
				<th>닉네임</th>
				<th>가입 날짜</th>
				<th>보유포인트</th>
				<th>블로그 수</th>
				<th>포스트 수</th>
				<th>댓글 수</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 250px; overflow: auto; display: block;" id="mlist">
		<c:forEach var="m" items="${list}">
			<tr><td>${m.EMAIL}</td>
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
			<td><fmt:formatDate value="${m.JOINDATE}" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatNumber value="${m.POINT eq null ? 0 : m.POINT}" pattern="#,###"/>P</td>
			<td>${m.BLOG eq null ? 0 : m.BLOG}</td>
			<td>${m.POST eq null ? 0 : m.POST}</td>
			<td>${m.REPLY eq null ? 0 : m.REPLY}</td></tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
</div>