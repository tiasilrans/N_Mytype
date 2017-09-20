<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${!urlLength }">
		<script>
			window.alert("블로그 url은 영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다.");
			location.href="/blog/create";
		</script>
	</c:when>
</c:choose>