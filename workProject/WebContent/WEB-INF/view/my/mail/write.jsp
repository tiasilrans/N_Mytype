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
table.type07 td {
	text-align: center;
    padding: 7px;
}
</style>

    
<section style="min-height: 90%;">
<form action="writeExec.mt">
<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12">
	<div class="title" style="margin-bottom: 40px;">
		<span style="float:left; font-size: 18px; margin-left: 5px;"><b>쪽지보내기</b></span>
	</div><hr/>
	<table class="table type07">
		<tbody style="font-size: 14px;">
			<tr>
				<td style="vertical-align: middle; width: 20%;"><label>받는사람</label></td>
				
				<td style="width: 70%">
					<input class="form-control" type="text" name="receiver" id="receiver" value="${email}" ${email ne null ? 'readonly':''} required />
				</td>
				<td style="width: 5%; vertical-align: middle;">
					<i class="fa fa-check-circle" id="emailtrue" style="font-size:23px; color:#14c880; ${email ne null ? 'display: block;':'display: none;'}"></i>
					<i class="fa fa-times-circle" id="emailfalse" style="font-size:23px; color:red; ${email eq null ? 'display: block;':'display: none;'} "></i>
				</td>
				<td style="width: 5%"></td>
				
			</tr>
			<tr>
				<td style="vertical-align: middle; width: 20%;"><label>내용</label></td>
				<td colspan="2" style="width: 60%"><textarea class="form-control" cols="40" rows="15" name="content" style="resize: none;" required></textarea></td>
				<td style="width: 20%"></td>
			</tr>
		</tbody>
	</table>
	
	<div align="right">
		<input class="btn button button2" type="submit" value="보내기" id="sbtn" disabled/>
	</div>
	
</div>
</form>
</section>


<script>
//이메일 텍스트창에서 포커스 취소할때 마다 중복확인 이벤트 발생
	function emailCheck(){
		var e = $("#receiver").val().length;
		if(e > 0){
			$.ajax({
				url:"/emailcheck.mt",
				method : "get",
				data : {
					"email" : $("#receiver").val(),
				}
			}).done(function(result) {
				var rst = JSON.parse(result);
				if(!rst.rst){
					$("#emailtrue").css("display", "block");
					$("#emailfalse").css("display", "none");
					$("#sbtn").prop("disabled", false);
				}else{
					$("#emailtrue").css("display", "none");
					$("#emailfalse").css("display", "block");
					$("#sbtn").prop("disabled", true);
				}
			});
		}
	};
	
	$("#receiver").on("keyup",emailCheck);
	$("#receiver").blur(emailCheck);
</script>

<c:if test="${result ne null}">
<script>
	if(${result}){
		window.alert("쪽지보내기 완료");
	}else{
		window.alert("쪽지보내기에 실패하였습니다.");
	}
</script>
</c:if>

<c:if test="${alert ne null}">
<script>
	window.alert("로그인후 이용 가능합니다.");
</script>
</c:if>








