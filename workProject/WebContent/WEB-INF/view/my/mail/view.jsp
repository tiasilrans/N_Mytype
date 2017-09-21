<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="/css/my.css">

<style>
  
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
 
.button2 {
	background-color: #80aaff;
}   

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

    
<form action="/mail/delete.mt">
<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12">
	<!--  --
	<div class="title" style="margin-bottom: 40px;">
		<span style="float:left; font-size: 18px; margin-left: 5px;"><b></b></span>
	</div>
	<br/><hr/>
	-->
	<ul class="list-group">
		<li class="list-group-item">
		${type == 'send'? '받은': '보낸'} 사람 : ${view.EMAIL }
		</li>
		<li class="list-group-item"style="padding: 25px;">
			${view.CONTENT}
	</ul>

<input type="hidden" name="part" value="view"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="num" value="${view.NUM}"/>
	<div align="right">
		<button type="submit" class="btn button button1" id="delete">삭제하기</button>
		<c:if test="${type != 'send'}">
			<a href="/mail/write.mt?reply=${view.EMAIL}"><button type="button" class="btn button button2" id="reply">답장하기</button></a>
		</c:if>
	</div>
</div>
</form>	