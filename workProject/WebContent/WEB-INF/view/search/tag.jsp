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
		<span style="font-size: 18px;">#${tag }</span>
	</div>
	</div>
</c:forEach>
</div>
<ul class="pagination">
	<c:forEach var="i" begin="1" end="${page}">
		<li ${np == i? "class=\"active\"": ""}><a
			href="/search/tag.mt?np=${i}&keyword=${keyword}">${i}</a></li>
	</c:forEach>
</ul>
</div>
   
<c:choose>
	<c:when test="${sessionScope.login == null}">
	<script>
	function likechange(){
		window.alert("로그인후 이용 가능합니다.");
	}
	$(".like").on("click", likechange);
	</script>
	</c:when>
	
	<c:otherwise>
	<script>
		//좋아요 버튼 눌렀을때 마다 하트가 변하는 스크립트 
		function likechange(){
			var str = this.value;
			var heart = this.classList.contains("glyphicon-heart-empty");
				$.ajax({
					url:"/postgood.mt",
					method : "get",
					data : {
					"num" : str,
					"type" : heart,
					}
				}).done(function(result) {
					var rst = JSON.parse(result);
					if(rst.rst){
						if(heart){
							$("."+str).html(parseInt($("."+str).html())+1);
							$(".o"+str).removeClass("glyphicon-heart-empty");
							$(".o"+str).addClass("glyphicon-heart");
							
						}else{
							$("."+str).html(parseInt($("."+str).html())-1);
							$(".o"+str).removeClass("glyphicon-heart");
							$(".o"+str).addClass("glyphicon-heart-empty");
						}
					}
				});
		}
		$(".like").on("click", likechange);
	</script>
	</c:otherwise>
</c:choose>
