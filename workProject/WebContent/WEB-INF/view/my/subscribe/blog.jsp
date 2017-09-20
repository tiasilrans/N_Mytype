<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/postviewcss.css">
    
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


<div align="center" >
	<div style="width: 50%;" align="left" >
	<h2>구독중인 블로그</h2>
	<hr style="margin-top: 10px;"/>
	</div>

		<c:choose>
		<c:when test="${slist ne null}">
				<c:forEach var="blog" items="${slist}">
				
				<div class="panel panel-default"
					style="width: 40%; text-align: left">
					<div class="panel-body" style="background-color: #F6F6F6;">
					<div class="col-md-2" style="padding : 0px;">
					<a href="/blog/${blog.URL }" style="color: #616161;">
						<c:choose>
							<c:when test="${blog.IMAGE eq null}">
								<img src="https://cdn.postype.com/assets/img/avatar/avatar_blue.png" style="width: 100px; height: 100px; border-radius: 5px;">
							</c:when>
							<c:otherwise>
								<img src="/images/profile/${blog.IMAGE}" style="width: 100px; height: 100px; border-radius: 5px;">
							</c:otherwise>
						</c:choose>
					</a>
					</div>
					<div class="col-md-7" style="padding : 0px;">
						<div style="font-size: 20px; font-weight: bold; padding-top: 10px;">
						<a href="/blog/${blog.URL }" style="color: #616161; text-decoration: none;">
						${blog.TITLE}</a></div>
						<div style="padding: 5px; padding-left: 5px; padding-top: 5px;">${blog.INTRO}</div>
					</div>
					
					<div class="col-md-3" style="padding : 0px; padding-top: 25px;" align="center">
						<button class="btn subscribe" id="${blog.URL}" value="${blog.URL}" type="button" style="width: 60%; height: 50px; font-size: 15; background-color: black;"><b class="${blog.URL }" style="color: white;">구독취소</b></button>
					</div>
					</div>
				</div>
				
			</c:forEach>
		</c:when>
		<c:otherwise>
			<ul class="list-group" style="width: 50%; text-align: left">
				<c:forEach var="blog" items="${slist}">
					<h5>구독중인 블로그가 없습니다.</h5>
				</c:forEach>
			</ul>
			</c:otherwise>
		</c:choose>
	
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/subscribe/blog.mt?np=${i}">${i}</a></li>
	</c:forEach>
	</ul>
</div>

<script>
function subscribe(){
	var url = this.value;
	var v = this.classList.contains("subscribe");
		$.ajax({
			url:"/subscribe/update.mt",
			method : "get",
			data : {
			"url" : url,
			"type" : v,
			}
		}).done(function(result) {
			var rst = JSON.parse(result);
			if(rst.rst){
				if(v){
					$("."+url).html("구독하기");
					$("#"+url).removeClass("subscribe");
				}else{
					$("."+url).html("구독취소");
					$("#"+url).addClass("subscribe");
				}
			}
		});
}
$(".btn").on("click", subscribe);
</script>





