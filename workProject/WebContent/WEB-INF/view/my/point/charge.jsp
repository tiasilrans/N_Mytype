<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/my.css">

<div align="center" >
	<div style="width: 50%;" align="left">
	<h2>포인트 충전</h2>
	<hr style="margin-top: 10px;"/>
	</div>
<form action="/my/point/chargeExec">
<ul class="list-group" style="width: 50%; text-align: left">
<li class="list-group-item" style="background-color: #F6F6F6;">
<h5><b>1. 충전할 포인트의 양을 선택해 주세요.</b></h5>
</li>

<li class="list-group-item">
  <table class="table table-hover" style="margin-bottom: 0px;">
    <thead>
      <tr>
        <th width="50%">충전할 포인트</th>
        <th width="50%">결제할 금액</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="radio" name="point" value="3,000" required/> 3,000P</td>
        <td>3,300원 <small class="text-muted">(부가가치세 10% 포함)</small></td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="5,000"/> 5,000P</td>
        <td>5,500원 <small class="text-muted">(부가가치세 10% 포함)</small></td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="10,000"/> 10,000P</td>
        <td>11,000원 <small class="text-muted">(부가가치세 10% 포함)</small></td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="20,000"/> 20,000P</td>
        <td>22,000원 <small class="text-muted">(부가가치세 10% 포함)</small></td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="30,000"/> 30,000P</td>
        <td>33,000원 <small class="text-muted">(부가가치세 10% 포함)</small></td>
      </tr>
    </tbody>
  </table></li>

<li class="list-group-item" style="background-color: #F6F6F6;">
<h5><b>2. 결제 정보를 입력해 주세요.</b></h5>
</li>

<li class="list-group-item">
<table class="table table-condensed">
<tbody >
	<tr>
	<td style="width: 50%; border-top-color: white;">
			<div class="form-inline" style="margin: 10px;">
				<label for="name" style="margin-right: 5px;">이　름 : </label>
				<input type="text" class="form-control" id="name" placeholder="이름" name="name" required>
			</div>
			<div class="form-inline" style="margin: 10px;">
				<label for="phonenumber" style="margin-right: 5px;">연락처 : </label>
				<input type="text" class="form-control" id="phonenumber" placeholder="연락처" name="phonenumber" required>
			</div>
	</td>
	<td style="width: 50%; border-top-color: white;">
		<div class="panel panel-info">
			<div class="panel-heading" style="  background-image: linear-gradient(to bottom,#F6F6F6 0,#F6F6F6 100%);">
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
		</div>
	</td>
	</tr>
</tbody>
</table>
</li>
<li class="list-group-item" >
<table class="table table-condensed" style="margin-bottom: 0px;">
<tbody >
	<tr>
	<td style="width: 15%; border-top-color: white; vertical-align: middle;">
	<b>충전 포인트    :</b>
	</td>
	<td style="width: 35%; border-top-color: white;">
	<span id="chargepoint" style="color: red; font-size: 30px;"></span>
	</td>
	<td style="width: 50%; border-top-color: white;">
	<div align="right" style="margin: 10px;">
		<a href="/"><button type="button" class="btn btn-default">취소</button></a>
		<button type="submit" class="btn btn-primary">결제하기</button>
	</div>
		
	</td>
	</tr>
</tbody>
</table>


</li>

</ul>
</form>

</div>





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