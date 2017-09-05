<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/my.css">

<nav id="tertiary-nav" class="tertiary-nav navbar scroll-x">
    <div class="col-xs-offset-1 col-md-offset-1">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="/my/point/plist">포인트 내역</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/charge">포인트 충전</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/clist">충전 내역</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/withdraw">출금 신청</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/my/point/wlist">출금 내역</a>
            </li>
        </ul>
    </div>
</nav>
<div align="center">

<form action="/">
<ul class="list-group" style="width: 50%; text-align: left">
<li class="list-group-item">
<h5><b>1. 충전할 포인트의 양을 선택해 주세요.</b></h5>
</li>

<li class="list-group-item">
  <table class="table table-hover" style="margin-bottom: 0px;">
    <thead>
      <tr>
        <th>충전할 포인트</th>
        <th>결제할 금액</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="radio" name="point" value="3000p"/> 3000P</td>
        <td>3000원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="5000p"/> 5000P</td>
        <td>5000원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="10000p"/> 10000P</td>
        <td>10000원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="22000p"/> 22000P</td>
        <td>20000원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="30000p"/> 30000P</td>
        <td>30000원</td>
      </tr>
    </tbody>
  </table></li>

<li class="list-group-item">
<h5><b>2. 결제 정보를 입력해 주세요.</b></h5>
</li>

<li class="list-group-item">
<table class="table table-condensed">
<tbody >
	<tr>
	<td style="width: 40%; border-top-color: white;">
			<div class="form-inline" style="margin: 10px;">
				<label for="name" style="margin-right: 5px;">이　름 : </label>
				<input type="text" class="form-control" id="name" placeholder="이름" name="name" >
			</div>
			<div class="form-inline" style="margin: 10px;">
				<label for="email" style="margin-right: 5px;">이메일 : </label>
				<input type="email" class="form-control" id="email" placeholder="이메일" name="email">
			</div>
			<div class="form-inline" style="margin: 10px;">
				<label for="contact" style="margin-right: 5px;">연락처 : </label>
				<input type="text" class="form-control" id="contact" placeholder="연락처" name="contact" >
			</div>
	</td>
	<td style="width: 60%; border-top-color: white;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<input type="radio" name="pay" value="card" style="margin: 5px;" checked/><b>카드 결제</b>
				<input type="radio" name="pay" value="untouched" style="margin: 5px;"/><b>무통장입금</b>
				<input type="radio" name="pay" value="phone" style="margin: 5px;"/><b>휴대폰 결제</b>
			</div>
			
			<div class="panel-body form-inline" id="cardpanel">
			<b>카드 선택 : </b>
			<select class="form-control" style="width: 45%;">
			<c:forEach var="card" items="${cards}">
				<option value="${card}">${card}</option>
			</c:forEach>
			</select>	
			</div>
			
			<div class="panel-body form-inline" id="untouchedpanel">
			<b>은행 선택 : </b>
			<select class="form-control" style="width: 45%;">
			<c:forEach var="bank" items="${banks}">
				<option value="${bank}">${bank}</option>
			</c:forEach>
			</select>	
			</div>
			
			<div class="panel-body form-inline" id="phonepanel">
			<b>통신사 선택 : </b>
			<select class="form-control" style="width: 45%;">
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
<table class="table table-condensed">
<tbody >
	<tr>
	<td style="width: 40%; border-top-color: white;">
	<b>충전 포인트 :</b> <span id="chargepoint" style="color: red; font-size: 30px;"></span>

	</td>
	<td style="width: 60%; border-top-color: white;">
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
        $()
    });
</script>