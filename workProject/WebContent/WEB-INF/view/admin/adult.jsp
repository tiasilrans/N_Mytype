<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 200px; vertical-align: middle;}
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 120px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 100px; }
.scrolltbody th:last-child { width: 80px; }
.scrolltbody td:last-child { width: calc( 80px - 18px ); }
</style>
    
<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>댓글 관리</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div class="row" >
<div class="col-md-4">
<div align="left" style="margin-left: 0px; margin-top: 50px;">
	<table class="table scrolltbody" style="width: 500px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>작성자</th>
				<th>이미지보기</th>
				<th>승인</th>
				<th>반려</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 250px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="m" items="${mlist}">
			<tr>
			<td>${m.EMAIL}</td>
			<td>
			<button type="button" class="btn btn-link" style="font-size: 13;" id="detail" value="${m.CERTIFIED}">보기</button></td>
			<td><button type="button" class="btn btn-link" id="apply" style="font-size: 13;" value="${m.EMAIL}">승인</button></td>
			<td><button type="button" class="btn btn-link" id="companion" style="font-size: 13;" value="${m.EMAIL}">반려</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>
<div class="col-md-1" align="center">
<i class="material-icons" style="color: #999999; font-size: 100px; vertical-align: middle; padding-top: 170px;">forward</i>
</div>
<div class="col-md-7" style="padding-top: 50px;" >
	<img id="view" onerror="this.src='/images/avatar_yellow.png'" style="border-radius: 10px; width: 500; height: 400; display: none;">
</div>
</div>
</div>

<script>
$("#detail").on("click", function(){
	var path = '/images/adult/'+$(this).val();
	console.log(path);
	
	$("#view").css("display", "none");
	$("#view").attr("src",path);
	$("#view").fadeIn();
});


$("#companion").on("click",function(){
	var rst = window.confirm("반려하시겠습니까?");
	if(rst){
		var email = this.value;
		$.ajax({
			url:"/admin/deleteadult",
			method : "get",
			data : {
			"email" : email,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("실패");
			}
			});
	}
});


$("#apply").on("click",function(){
	var rst = window.confirm("승인하시겠습니까?");
	if(rst){
		var email = this.value;
		$.ajax({
			url:"/admin/applyadult",
			method : "get",
			data : {
			"email" : email,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("실패");
			}
			});
	}
});
</script>