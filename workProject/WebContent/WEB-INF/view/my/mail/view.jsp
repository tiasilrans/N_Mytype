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
table.type07 td {
	text-align: center;
    padding: 7px;
}
</style>

    
<div align="center" style="margin-top: 130px;">
<form action="/mail/delete.mt">
	<div style="width: 35%;" align="left">
	<h2>쪽지 상세보기</h2>
	<hr style="margin-top: 10px;"/>
	</div>
	<ul class="list-group" style="width: 35%; text-align: left">
		<li class="list-group-item" style="background-color: #F6F6F6;">
		${type == 'send'? '받은': '보낸'} 사람 : ${view.EMAIL }
		</li>
		<li class="list-group-item"style="padding: 25px;">
			${view.CONTENT}
		</li>
	</ul>
	<hr style="margin-top: 10px; width: 35%;"/>
<input type="hidden" name="part" value="view"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="num" value="${view.NUM}"/>
	<div style="width: 35%;" align="right">
		<button type="submit" class="btn btn-default" id="delete">삭제하기</button>
		<c:if test="${type != 'send'}">
			<a href="/mail/write.mt?reply=${view.EMAIL}"><button type="button" class="btn btn-primary" id="reply">답장하기</button></a>
		</c:if>
	</div>
</form>	
</div>