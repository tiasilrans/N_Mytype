<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/my.css">

<nav id="tertiary-nav" class="tertiary-nav navbar scroll-x">
    <div class="col-xs-offset-1 col-md-offset-1">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="/my/point/plist">포인트 내역</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/charge">포인트 충전</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/clist">충전 내역</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/withdraw">출금 신청</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/wlist">출금 내역</a>
            </li>
        </ul>
    </div>
</nav>

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

<table class="type07 col-xs-offset-1 col-md-offset-1">
    <thead>
    <tr>
        <th style="width: 100px;" >날짜</th>
        <th style="width:200px;">카테고리</th>
        <th style="width:100px;">포인트</th>
        <th style="width:300px;">상세내용</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <c:if test="${sessionScope.login eq null }">
    	<tr>
    		<td colspan="4" style="height:100px;">거래 내역이 없습니다.</td>
    	</tr>
    </c:if>
    </tbody>
</table>








