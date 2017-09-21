<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.scrolltbody1 th:nth-of-type(1), .scrolltbody1 td:nth-of-type(1) { width: 230px; }
.scrolltbody1 th:nth-of-type(2), .scrolltbody1 td:nth-of-type(2) { width: 150px; }
.scrolltbody1 th:nth-of-type(3), .scrolltbody1 td:nth-of-type(3) { width: 100px; }
.scrolltbody1 th:nth-of-type(4), .scrolltbody1 td:nth-of-type(4) { width: 100px; }
.scrolltbody1 th:nth-of-type(5), .scrolltbody1 td:nth-of-type(5) { width: 130px; }
.scrolltbody1 th:nth-of-type(6), .scrolltbody1 td:nth-of-type(6) { width: 150px; }
.scrolltbody1 th:last-child { width: 100px; }
.scrolltbody1 td:last-child { width: calc( 100px - 18px ); }
</style>
<style>
.scrolltbody2 th:nth-of-type(1), .scrolltbody2 td:nth-of-type(1) { width: 230px; }
.scrolltbody2 th:nth-of-type(2), .scrolltbody2 td:nth-of-type(2) { width: 100px; }
.scrolltbody2 th:nth-of-type(3), .scrolltbody2 td:nth-of-type(3) { width: 100px; }
.scrolltbody2 th:nth-of-type(4), .scrolltbody2 td:nth-of-type(4) { width: 150px; }
.scrolltbody2 th:nth-of-type(5), .scrolltbody2 td:nth-of-type(5) { width: 90px; }
.scrolltbody2 th:nth-of-type(6), .scrolltbody2 td:nth-of-type(6) { width: 90px; }
.scrolltbody2 th:last-child { width: 90px; }
.scrolltbody2 td:last-child { width: calc( 90px - 18px ); }
</style>
   
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>충전 / 출금 신청 관리</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div align="left" style="margin-left: 100px;">
	<!-- 충전 리스트 -->
	<table class="table scrolltbody1" style="width: 960px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>이메일</th>
				<th>충전 신청일</th>
				<th>신청포인트</th>
				<th>결제 금액</th>
				<th>결제 방식</th>
				<th>결제 상세 정보</th>
				<th>충전 승인</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 250px; overflow: auto; display: block;">
			<c:forEach var="c" items="${clist}">
				<tr>
					<td style="vertical-align: middle;">${c.EMAIL}</td>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${c.DDATE }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td style="vertical-align: middle; height: 50px;"><fmt:formatNumber pattern="#,###">${c.POINT }</fmt:formatNumber>P</td>
					<td style="vertical-align: middle; v">
					<fmt:formatNumber pattern="#,###">
					${c.POINT + c.POINT/10}
					</fmt:formatNumber>원</td>
					<td style="vertical-align: middle; height: 50px;">${c.PAYMENT }</td>
					<td style="vertical-align: middle; height: 50px;">${c.PAYMENTOPTION }</td>
					<td style="vertical-align: middle; height: 50px;">
						<button class="btn btn-default" type="button" id="charge" value="${c.NUM}">충전 승인</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div>
</div>