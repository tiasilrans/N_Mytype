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

    
<div align="center">
	<div style="width: 40%;" align="left">
	<h2>쪽지쓰기</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<form action="writeExec.mt">
	<table class="table type07" style="width: 35%; background-color: #F6F6F6;">
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
					<td colspan="3" style="width: 80%"><textarea class="form-control" cols="50" rows="15" name="content" style="resize: none;" required></textarea></td>
				</tr>
		</tbody>
	</table>
	<div style="width: 35%;" align="right">
		<input class="btn btn-default" type="submit" value="보내기" id="sbtn" disabled/>
	</div>
</form>

</div>

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








