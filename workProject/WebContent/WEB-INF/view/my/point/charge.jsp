<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/my.css">
<link rel="stylesheet" href="/css/postviewcss.css">

<style>

.box {
	position: relative;
	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 70%;
	padding: 20px;
}

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


</style>

<section style="min-height: 90%;">
<form class="form-inline form-horizontal" action="/my/point/chargeExec">
	<div class="col-xs-0 col-md-2"></div>
	<div class="box col-xs-12 col-md-8 col-lg-12">
		<div class="title" style="margin-bottom: 40px;">
			<span style="float:left; font-size: 18px; margin-left: 5px;"><b><span style="margin-left: -12px;">충전하기</span></b></span>
		</div><hr/>
		
		<div class="title">
			<span style="float:left; font-size: 17px; margin-left: 5px;">1. 충전할 포인트의 양을 선택해 주세요.</span>
		</div><br/>
		
		<table class="table" style="margin-left: 15px;">
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
			<span style="float:left; font-size: 17px; margin-left: 5px; margin-right: 70%;">2. 결제 정보를 입력해 주세요.</span>
		</div> <br/><br/>
		
		<div class="card-block" style="float:left; padding-left:0; padding-right:60px;">
			<label style="color: #606060; width: 42px;">이름</label>
			<input type="text" name="name" class="form-control" style="width:70%;" 
			 <c:if test="${info.NICKNAME ne null }"> value="${info.NICKNAME }" </c:if> />
			 <br/>
			<label style="color: #606060; padding-top: 3px; margin-top: 12px;">연락처</label>
			<input type="text" name="phonenumber" class="form-control" style="width:70%;" />
		</div><br/>
			
		<div >			
			<div>
				<input type="radio" name="pay" value="card" style="margin: 5px;" checked/><b>카드 결제</b>
				<input type="radio" name="pay" value="untouched" style="margin: 5px;"/><b>무통장입금</b>
				<input type="radio" name="pay" value="phone" style="margin: 5px;"/><b>휴대폰 결제</b>
			</div>
				
			<div class="panel-body form-inline" id="cardpanel">
				<b style="margin-left: 4px;">카드 선택 : </b>
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
	
		<div>
			<span>
				<label style="width:100px; margin-top:10px; margin-left: 15px;">
					<b style="margin-left: -5px;">충전 포인트 : </b>
				</label>
				<label>
					<span id="chargepoint" style="font-size: 25px;"></span>
				</label>
			</span>
			
			<span style="float:right; margin-right:10px;">
				<a href="/"><button type="button" class="btn button button2">취소</button></a>
				<button type="submit" class="btn button button1">결제하기</button>
			</span>
		</div>
		
	</div>
</form>
</section>





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