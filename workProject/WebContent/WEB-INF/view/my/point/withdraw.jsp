<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 
<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="/css/postviewcss.css">

<c:choose>
<c:when test="${info.BANK ne null || info.ACCOUNT ne null || info.HOLDER ne null}">
<div align="center" >
	<div style="width: 40%;" align="left">
	<h2>출금 신청</h2>
	<hr style="margin-top: 10px;"/>
	</div>
	<div class="panel panel-default" style="width: 40%; background-color: #F6F6F6;" align="left">
		
		<div class="panel-body">
		<div style="width: 50%; float: left;">
		출금 가능 포인트  <br/>
		<span id="pointsum" style="color: red; font-weight: bold; font-size: 30px;">
		<fmt:formatNumber pattern="#,###">		
			${pointsum.SUM }
		</fmt:formatNumber>
		
		</span> 
		<b>Point</b>
		</div>
		<div style="width: 40%; float: left;">
		출금 후 잔여 포인트  <br/>
		<span id="rpoint" style="color: red; font-weight: bold; font-size: 30px;">
		<fmt:formatNumber pattern="#,###">		
			${pointsum.SUM }
		</fmt:formatNumber>
		</span>
		 <b>Point</b>
		</div>
		</div>
		
		<div class="panel-body">
			<div align="left" style="padding-right: 15px; line-height: 2.4">
			<div style="width: 23%; float: left;">
			<div>출금 은행</div><div><span style="font-weight: bold; font-size: 16px;">${info.BANK}</span></div>
			</div>
			<div style="width: 43%; float: left;">
			<div>계좌번호</div><div><span style="font-weight: bold; font-size: 16px;">${info.ACCOUNT}</span></div>
			</div>
			<div style="width: 33%; float: left;">
			<div>예금주</div><div><span style="font-weight: bold; font-size: 16px;">${info.HOLDER}</span></div>
			</div>

			</div>
		</div>
		
	</div>
	
	<form action="/my/point/withdrawExec">
	<input type="hidden" name="bank" value="${info.BANK}"/>
	<input type="hidden" name="account" value="${info.ACCOUNT}"/>
	<input type="hidden" name="holder" value="${info.HOLDER}"/>
	
	<ul class="list-group" style="width: 40%; text-align: left">
	<li class="list-group-item" style="background-color: #F6F6F6;">
	<h5><b>출금하실 금액을 설정해 주세요.</b></h5>
	</li>
	<li class="list-group-item" >
	<div class="form-inline">
		<span style="padding-right: 15px;" >출금 금액</span><input class="form-control number" type="text" name="money" id="tval" style="width: 30%;" required/>
	</div>
	</li>
	<li class="list-group-item" >
	<div align="right">
		<button id="sbtn" type="submit" class="btn button button1">출금신청</button>
	</div>
	</li>
	
	</ul>
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
	window.alert("'설정 -> 계정' 에서 출금 정보를 수정하고오세요");
	history.go(-1);
</script>
</c:otherwise>
</c:choose>