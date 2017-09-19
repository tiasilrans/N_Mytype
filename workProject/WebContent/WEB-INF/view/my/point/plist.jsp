<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/my.css">

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
	<div style="width: 40%; margin-top: 130px;" align="left">
	<h2>포인트 내역</h2>
	<hr style="margin-top: 10px;"/>
	</div>
	
	<div class="panel panel-default" style="width: 40%; background-color: #F6F6F6;" align="left">
		<div class="panel-body">
		잔여 포인트 : <span style="color: red; font-weight: bold; font-size: 30px;">
		<br/><fmt:formatNumber pattern="#,###">		
			${pointsum.SUM }
		</fmt:formatNumber></span> <b>Point</b>
		</div>
	</div>
	
	<table class="table type07" style="width: 40%;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th style="width: 20%;">일자</th>
				<th style="width: 20%;">시간</th>
				<th style="width: 20%;">획득 / 사용</th>
				<th style="width: 40%;">내용</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px;">
		<c:choose>
		<c:when test="${list ne null}">
			<c:forEach var="point" items="${list}">
				<tr>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${point.PTDATE }" pattern="yyyy-MM-dd"/>
					</td>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${point.PTDATE }" pattern="HH:mm"/>
					</td>
					<td style="vertical-align: middle; font-size: 14px;">
					<span style="color: ${point.CHARGE eq null? 'red' : 'green'};">
					${point.CHARGE eq null? '-' : '+'}
					<fmt:formatNumber pattern="#,###">
					${point.CHARGE eq null? point.USE : point.CHARGE}
					</fmt:formatNumber>
					</span>
					</td>
					<td style="vertical-align: middle;">${point.CAUSE }
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<td colspan="4" style="vertical-align: middle; height: 50px;">
				<b>포인트 사용 내역이 없습니다.</b>
			</td>
		</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/my/point/plist.mt?np=${i}">${i}</a></li>
	</c:forEach>
	</ul>
</div>








