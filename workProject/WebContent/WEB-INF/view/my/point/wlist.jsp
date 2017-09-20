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


<div align="center" style="margin-top: 130px;">
	<div style="width: 40%;" align="left">
	<h2>출금 내역</h2>
	<hr style="margin-top: 10px;"/>
	</div>

	<table class="table type07" style="width: 40%;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>출금신청일</th>
				<th>신청포인트</th>
				<th>처리 결과</th>
				<th>충전 취소</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px;">
		<c:choose>
		<c:when test="${list ne null}">
			<c:forEach var="withdraw" items="${list}">
				<tr>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${withdraw.WDATE }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td style="vertical-align: middle; height: 50px;"><fmt:formatNumber pattern="#,###">${withdraw.MONEY }</fmt:formatNumber>P</td>
					<td style="vertical-align: middle; height: 50px;"><small style="color: ${withdraw.ACCEPT eq 'N'? '#FF7171': '#74D36D'}">
						${withdraw.ACCEPT eq 'N'? '출금진행중': '출금완료'}
					</small></td>
					<td style="vertical-align: middle; height: 50px;">
					<c:choose>
					<c:when test="${withdraw.ACCEPT eq 'N'}">
						<button class="btn btn-default" type="button" id="delete" value="${withdraw.PNUM}">출금취소</button>
					</c:when>
					<c:otherwise>
						<b>출금 완료</b>
					</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="4" style="vertical-align: middle; height: 50px;">
					<b>출금 내역이 없습니다.</b>
				</td>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/my/point/wlist.mt?np=${i}">${i}</a></li>
	</c:forEach>
	</ul>
</div>

<script>
	$("#delete").on("click",function(){
		var num = this.value;
		$.ajax({
			url:"/my/point/delete",
			method : "post",
			data : {
			"num" : num,
			"type" : "withdrawCancel",
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				window.alert("출금 취소 완료");
			}else{
				window.alert("출금 취소 실패");
			}
			window.location.reload();
		})
	});
</script>