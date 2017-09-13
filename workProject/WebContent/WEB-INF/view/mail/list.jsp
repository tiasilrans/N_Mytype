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
	<div style="width: 50%;" align="left">
	<h2>${type == 'send' ? '보낸': '받은'}쪽지함</h2>
	<hr style="margin-top: 10px;"/>
	</div>

	<table class="table type07" style="width: 50%;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th width="5%"></th>
				<th width="20%">${type == 'send' ? '받은': '보낸'}사람</th>
				<th width="55%">내용</th>
				<th width="20%">${type == 'send' ? '보낸': '받은'}날짜</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px;">
		<c:choose>
		<c:when test="${mlist ne null}">
			<c:forEach var="mail" items="${mlist}">
				<tr>
					<td style="vertical-align: middle; height: 50px;"><input type="checkbox" class="cb" value="${mail.NUM}" style="vertical-align: middle;"/></td>
					<td style="vertical-align: middle; height: 50px;">${mail.EMAIL}</td>
					<td style="vertical-align: middle; height: 50px;"><a href="/mail/view.mt?num=${mail.NUM}&type=${type}">${mail.CONTENT}</a></td>
					<td style="vertical-align: middle;">
						<fmt:formatDate value="${mail.MDATE }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="4" style="vertical-align: middle; height: 50px;">
					<b>쪽지함이 비었습니다.</b>
				</td>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>

	<div style="width: 50%;" align="left">
	<hr style="margin-top: 10px;"/>
	<button class="btn btn-default" type="button" id="delete">삭제하기</button>
	</div>

</div>
