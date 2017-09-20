<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 
<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="/css/postviewcss.css">

<style>

body {
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
	background: whitesmoke;
}

.box {
	position: relative;
	display: block;
	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
}


</style>


<c:choose>
<c:when test="${info.BANK ne null || info.ACCOUNT ne null || info.HOLDER ne null}">

<div class="col-xs-0 col-md-2"></div>
<div class="box col-xs-12 col-md-8 col-lg-12">
	<div class="title" style="margin-bottom: 40px;">
		<span style="float:left; font-size: 18px; margin-left: 5px;"><b>출금하기</b></span>
	</div><hr/>
		
	<div>
		<div style="width: 50%; float: left;">
			<label style="width:105px; margin-top:10px; margin-left: 15px;">
				<b>보유 포인트 &nbsp;&nbsp;&nbsp;&nbsp; : </b>
			</label>
			<span id="pointsum" style="color:gray; font-weight: bold; font-size: 30px;">
				<fmt:formatNumber pattern="#,###">		
					${pointsum.SUM }
				</fmt:formatNumber>
			</span> <b>Point</b>
		</div>
			
		<div style="width: 40%;">
			<label style="width:105x; margin-top:10px; margin-left: 15px;">
				<b>출금 후 포인트   :&nbsp; </b>
			</label>
			<span id="rpoint" style="color:gray; font-weight: bold; font-size: 30px;">
				<fmt:formatNumber pattern="#,###">		
					${pointsum.SUM }
				</fmt:formatNumber>
			</span>	 <b>Point</b>
		</div>
	</div>
	<hr/>

		<div align="left" style="padding-right: 15px; line-height: 2.4">
			<div style="width: 300px; float: left;">
				<label style="width:150x; margin-top:10px; margin-left: 15px;">출금 은행</label>
				<span style="font-weight: bold; font-size: 16px;">${info.BANK}</span>
			</div>
			<div style="width: 30%; float: left;">
				<label style="width:105x; margin-top:10px; margin-left: 15px;">계좌번호</label>
				<div><span style="font-weight: bold; font-size: 16px;">${info.ACCOUNT}</span></div>
			</div>
			<div style="width: 30%; float: left;">
				<label style="width:105x; margin-top:10px; margin-left: 15px;">예금주</label>
				<div><span style="font-weight: bold; font-size: 16px;">${info.HOLDER}</span></div>
			</div>
		</div>
		
	
	<form action="/my/point/withdrawExec">
		<div>
			<input type="hidden" name="bank" value="${info.BANK}"/>
			<input type="hidden" name="account" value="${info.ACCOUNT}"/>
			<input type="hidden" name="holder" value="${info.HOLDER}"/>
			
			<h5><b>출금하실 금액을 설정해 주세요.</b></h5>
			<div class="form-inline">
				<span style="padding-right: 15px;" >출금 금액</span><input class="form-control number" type="text" name="money" id="tval" style="width: 30%;" required/>
			</div>
			<div align="right">
				<button id="sbtn" type="submit" class="btn button button1">출금신청</button>
			</div>
		</div>
	</form>
</div>

<script>
//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};
</script>
<script>
	$("#tval").on("keyup",function(){
		var p = parseInt($("#pointsum").html().replace(",",""));
		var m = parseInt($("#tval").val());
		var point = p-m;
		if(point >= 0){
			$("#rpoint").html(point.format());
			$("#sbtn").prop("disabled", false)
		}else{
			$("#sbtn").prop("disabled", true)
			$("#rpoint").html("0");
		}
		if($("#tval").val().length == 0){
			$("#rpoint").html(p.format());
			$("#sbtn").prop("disabled", false)
		}
	});
</script>


	
<c:if test="${alert}">
<script>
	window.alert("출금 실패!!");
</script>
</c:if>
</c:when>

<c:otherwise>
<!--  출금정보 설정 안하고 들어오면 경고창 띄우면서 뒤로가기 --> -->
<script>
	window.alert("'설정 -> 출금계좌 설정' 에서 출금 정보를 수정하고오세요");
	history.go(-1);
</script>
</c:otherwise>
</c:choose>