<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/my.css">

<style>

body {
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
}

.box {
	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
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

.div-pagination a {
    color: #0d0d0d;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #0d0d0d;
    border-color: #ffffff;
}

.div-pagination a:hover:not(.active) {background-color: #333333; color: white;}

</style>

<section style="min-height: 80%;">
<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12">
	<div class="title" style="margin-bottom: 40px;">
		<span style="float:left; font-size: 18px; margin-left: 5px;"><b><span style="margin-left: -12px;">사용내역</span></b></span>
		<span style="float:right;">
			<label>
				잔여 포인트 : 
			</label>
			<label style=" color:#80aaff; font-weight: bold; font-size: 25px; margin-right: 7px;">
			<fmt:formatNumber pattern="#,###">		
				${pointsum.SUM }
			</fmt:formatNumber></label> <b>Point</b>
		</span>
	</div><hr/>
	
	<div style="min-height: 294px;">
		<table class="table type07">
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
						<tr style="height:50px;">
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
							<td vertical-align: middle;">${point.CAUSE }</td>
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
	
	<div class="div-pagination" align="center">
		<ul class="pagination">
			<c:forEach var="i" begin="1" end="${page}">
				<li ${np == i? "class=\"active\"": ""}><a
					href="/my/point/plist.mt?np=${i}">${i}</a></li>
			</c:forEach>
		</ul>
	</div>
	
</div>

</section>




