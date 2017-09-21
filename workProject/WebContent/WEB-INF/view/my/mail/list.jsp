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
	background: whitesmoke;
}

.box {
	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 8px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 5px;
}

.button1 {
	background-color: #303030;
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
</style>


<form action="/mail/delete.mt">
<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12">
	<div class="title" style="margin-bottom: 40px;">
		<span style="float:left; font-size: 18px; margin-left: 5px;"><b>${type == 'send' ? '보낸': '받은'}쪽지함</b></span>
	</div><hr/>
	
	<input type="hidden" name="part" value="list"/>
	<input type="hidden" name="type" value="${type}"/>
	<table class="table type07">
		<thead>
			<tr>
				<th width="5%"><input type="checkbox" id="allcheck"/></th>
				<th width="20%">${type == 'send' ? '받은': '보낸'}사람</th>
				<th width="55%">내용</th>
				<th width="20%">${type == 'send' ? '보낸': '받은'}날짜</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px;">
		<c:choose>
			<c:when test="${mlist.size() > 0}">
				<c:forEach var="mail" items="${mlist}">
					<tr>
						<td style="vertical-align: middle; height: 50px;"><input class="ch" type="checkbox" name="num" value="${mail.NUM}" style="vertical-align: middle;"/></td>
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
		<button class="button button1" type="submit" id="delete" >삭제하기</button>
	</div>
	
	<div align="center">
		<ul class="pagination">
			<c:forEach var="i" begin="1" end="${page}">
				<li ${np == i? "class=\"active\"": ""}><a
					href="/mail/list.mt?np=${i}&type=${type}">${i}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
</form>

<script>
$("#allcheck").on("click",function(){
	var v = $(this).prop("checked");
	
	$(".ch").each(function() {
		$(this).prop("checked", v);
	})
});


</script>