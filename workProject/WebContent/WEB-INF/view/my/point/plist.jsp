<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/my.css">

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
	height: 450px;
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

<form class="form-inline form-horizontal">
	<div class="scard col-xs-offset-2 col-md-offset-2">
		<div>
			<label style="width:100px; margin-top:10px; margin-left: 80px;">
				잔여 포인트 : 
			</label>
			<label style=" color:#909090; font-weight: bold; font-size: 25px; margin-right: 7px;">
			<br/><fmt:formatNumber pattern="#,###">		
				${pointsum.SUM }
			</fmt:formatNumber></label> <b>Point</b>
		</div>
		
		<div align="center" style="min-height: 227px;">
			<table class="table type07" style="width: 80%;">
				<thead>
					<tr>
						<th style="width: 20%;">날짜</th>
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
								<td style="vertical-align: middle;">${point.CAUSE }</td>
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
		</div>
	
		<div align="center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${page}">
					<li ${np == i? "class=\"active\"": ""}><a
						href="/my/point/plist.mt?np=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
	
	</div>
</form>






