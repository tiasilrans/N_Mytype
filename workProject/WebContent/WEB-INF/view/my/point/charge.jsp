<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="/css/postviewcss.css">

<style>

label{
	margin-bottom: 2%;
	width: 80px;
}

.scard {
    position: relative;
    display: block;
    width : 800px;
	height: 650px;
    margin-bottom: .75rem;
    background-color: #fff;
    border-radius: .25rem;
    border: 1px solid rgba(0,0,0,.125);
}

.card-block {
	margin-left: 15px;
    position: relative;
    vertical-align:middle;
}

.title{
	padding-top :20px;
	margin-left: 15px;
	margin-bottom:25;
}

.ptable{
	margin-left: 20px;
	margin-right:100%;
	margin-bottom: 5%;
	width: 80%;
}

</style>

<form class="form-inline form-horizontal" action="/my/point/chargeExec">
	<div class="scard col-xs-offset-2 col-md-offset-2">
		
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;"><b>1. 충전할 포인트의 양을 선택해 주세요.</b></span>
		</div><br/>
		
		<table class="card-block table ptable">
		<thead>
			<tr>
	        	<th width="30%">충전포인트</th>
	        	<th width="30%">결제하실금액</th>
	        </tr>
		</thead>
        <tbody>
        	<tr>
        		<td><input type="radio" name="point" value="3,000" required/> 3,000P</td>
        		<td>3,300원 <small class="text-muted">(VAT 10% 포함)</small></td>
        	</tr>
        	<tr>
        		<td><input type="radio" name="point" value="5,000"/> 5,000P</td>
        		<td>5,500원 <small class="text-muted">(VAT 10% 포함)</small></td>
        	</tr>
        	<tr>
        		<td><input type="radio" name="point" value="10,000"/> 10,000P</td>
        		<td>11,000원 <small class="text-muted">(VAT 10% 포함)</small></td>
        	</tr>
        	<tr>
        		<td><input type="radio" name="point" value="20,000"/> 20,000P</td>
        		<td>22,000원 <small class="text-muted">(VAT 10% 포함)</small></td>
        	</tr>
        	<tr>
        		<td><input type="radio" name="point" value="30,000"/> 30,000P</td>
        		<td>33,000원 <small class="text-muted">(VAT 10% 포함)</small></td>
        	</tr>
        </tbody>
		</table>
  
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px; margin-right: 70%;"><b>2. 결제 정보를 입력해 주세요.</b></span>
		</div> <br/><br/>
	
		<div class="card-block" style="float:left; padding-left:0; padding-right:60px;">
			<label style="color: #606060;">이름</label>
			<input type="text" name="name" class="form-control" style="width:70%;" 
			 <c:if test="${info.NICKNAME ne null }"> value="${info.NICKNAME }" </c:if> /> <br/>
		
			<label style="color: #606060;">연락처</label>
			<input type="text" name="phonenumber" class="form-control" style="width:70%;" />
		</div><br/>
			
		<div >			
			<div>
				<input type="radio" name="pay" value="card" style="margin: 5px;" checked/><b>카드 결제</b>
				<input type="radio" name="pay" value="untouched" style="margin: 5px;"/><b>무통장입금</b>
				<input type="radio" name="pay" value="phone" style="margin: 5px;"/><b>휴대폰 결제</b>
			</div>
				
			<div class="panel-body form-inline" id="cardpanel">
				<b>카드 선택 : </b>
				<select class="form-control" name="card" style="width: 45%;">
					<option value="null">카드를 선택해주세요.</option>
					<c:forEach var="card" items="${cards}">
						<option value="${card}">${card}</option>
					</c:forEach>
				</select>	
			</div>
			
			<div class="panel-body form-inline" id="untouchedpanel">
				<b>은행 선택 : </b>
				<select class="form-control" name="untouched" style="width: 45%;">
					<option value="null">은행을 선택해주세요.</option>
				<c:forEach var="bank" items="${banks}">
					<option value="${bank}">${bank}</option>
				</c:forEach>
				</select>	
			</div>
				
			<div class="panel-body form-inline" id="phonepanel">
				<b>통신사 선택 : </b>
				<select class="form-control" name="phone" style="width: 45%;">
					<option value="null">통신사를 선택해주세요.</option>
				<c:forEach var="telecom" items="${telecoms}">
					<option value="${telecom}">${telecom}</option>
				</c:forEach>
				</select>
			</div>
		</div> <br/>
	
		<div class="card-blcok " style="margin-bottom: 0px;">
			<span>
				<label style="width:100px; margin-top:10px; margin-left: 15px;">
					<b>충전 포인트 : </b>
				</label>
				<label>
					<span id="chargepoint" style="font-size: 25px;"></span>
				</label>
			</span>
			
			<span style="float:right; margin-right:10px;">
				<a href="/"><button type="button" class="btn btn-default">취소</button></a>
				<button type="submit" class="btn button button1">결제하기</button>
			</span>
		</div>
		
	</div>
</form>
	





<script type="text/javascript">
	//결제방식 폼 이벤트
    $('#untouchedpanel').hide();
    $('#phonepanel').hide();
    $('input[name="pay"]').click(function() {
        var selected = $(this).val();
        $('.panel-body').hide();
        $('#' + selected+"panel").fadeIn("slow");
    });

	//포인트 체크박스 누를때마다 밑에있는 포인트 텍스트 변환
    $('input[name="point"]').click(function() {
        var selected = $(this).val();
        $("#chargepoint").html(selected+"P");
    });
</script>