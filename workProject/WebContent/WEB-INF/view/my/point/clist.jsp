<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="/css/postviewcss.css">

<style>

body {
	background: whitesmoke;
}
 
label{
	margin-bottom: 2%;
	width: 80px;
}

.scard {
    position: relative;
    display: block;
    width : 800px;
	height: 500px;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
}

.card-block {
	margin-left: 15px;
    position: relative;
    vertical-align:middle;
}

.title{
	padding-top :20px;
	margin-left: 15px;
	margin-bottom:25;
}
 

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

ul li a:hover, ul li a:focus {
	color: black;
}

</style>

	<div class="scard col-xs-offset-2 col-md-offset-2">
		<div align="center" style="min-height: 227px;">
			<div class="title" style="margin-bottom: 40px;">
				<span style="float:left; font-size: 18px; margin-left: 5px;"><b>충전내역</b></span>
			</div><hr/>
			
			<table class="table type07">
				<thead>
					<tr>
						<th>충전신청일</th>
						<th>신청포인트</th>
						<th>결제 금액</th>
						<th>처리 결과</th>
						<th>결제 방식</th>
						<th>결제 상세 정보</th>
						<th>충전 취소</th>
					</tr>
				</thead>
				<tbody style="font-size: 14px;">
				<c:choose>
				<c:when test="${list ne null}">
					<c:forEach var="deposit" items="${list}">
						<tr>
							<td style="vertical-align: middle;">
							<fmt:formatDate value="${deposit.DDATE }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td style="vertical-align: middle; height: 50px;"><fmt:formatNumber pattern="#,###">${deposit.POINT }</fmt:formatNumber>P</td>
							<td style="vertical-align: middle; v">
							<fmt:formatNumber pattern="#,###">
							${deposit.POINT + deposit.POINT/10}
							</fmt:formatNumber>원</td>
							<td style="vertical-align: middle; height: 50px;"><small style="color: ${deposit.ACCEPT eq 'N'? '#FF7171': '#74D36D'}">
							${deposit.ACCEPT eq 'N'? '충전진행중': '충전완료'}
							</small></td>
							<td style="vertical-align: middle; height: 50px;">${deposit.PAYMENT }</td>
							<td style="vertical-align: middle; height: 50px;">${deposit.PAYMENTOPTION }</td>
							<td style="vertical-align: middle; height: 50px;">
							<c:choose>
							<c:when test="${deposit.ACCEPT eq 'N'}">
								<button class="btn button button1" type="button" id="delete" value="${deposit.NUM}">결제취소</button>
							</c:when>
							<c:otherwise>
								<b>충전 완료</b>
							</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<td colspan="7" style="vertical-align: middle; height: 50px;">
							<b>충전 신청 내역이 없습니다.</b>
						</td>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	
		<div align="center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${page}">
					<li ${np == i? "class=\"active\"": ""}><a
						href="/my/point/clist.mt?np=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>


<script>
	$("#delete").on("click",function(){
		var num = this.value;
		$.ajax({
			url:"/my/point/delete",
			method : "get",
			data : {
			"num" : num,
			"type" : "chargeCancel",
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				window.alert("결제 취소 완료");
			}else{
				window.alert("결제 취소 실패");
			}
			window.location.reload();
		})
	});
</script>