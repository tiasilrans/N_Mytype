<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<link rel="stylesheet" href="/css/searchcss.css">   

<div align="center">

<div style="width: 60%;" align="left">
태그 <span style="font-weight: bold; font-size: 20;">'${keyword}'</span><br/>
<hr style="margin-top: 10px;"/>
</div>

<div class="row" style="width: 60%; min-height: 10%">
<c:forEach items="${hash}" var="tag">
	<div class="col-md-3" style=" padding: 5px;">
	<div style="background-color: #F6F6F6; padding: 15px;" align="left">
		<a href="/search/tag.mt?keyword=${tag}"><span style="font-size: 18px;">#${tag }</span></a>
	</div>
	</div>
</c:forEach>
</div>
<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/search/tagsearch.mt?np=${i}&keyword=${keyword}">${i}</a></li>
	</c:forEach>
</ul>
</div>