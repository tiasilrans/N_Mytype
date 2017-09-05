<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<ul class="list-group" style="width: 60%; text-align: left">
<li class="list-group-item">
  <table class="table table-hover">
    <thead>
    <tr>
    <th colspan="2"><h4><b>1. 충전할 포인트의 양을 선택해 주세요.</b></h4></th>
    </tr>
      <tr>
        <th>충전할 포인트</th>
        <th>결제할 금액</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="radio" name="point" value="3000p"/> 3000P</td>
        <td>3300원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="5000p"/> 5000P</td>
        <td>5500원</td>
      </tr>
      <tr>
        <td><input type="radio" name="point" value="10000p"/> 10000P</td>
        <td>11000원</td>
      </tr>
    </tbody>
  </table></li>
</ul>
</div>