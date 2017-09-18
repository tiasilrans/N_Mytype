<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.member th:nth-of-type(1), .member td:nth-of-type(1) { width: 230px; }
.member th:nth-of-type(2), .member td:nth-of-type(2) { width: 100px; }
.member th:nth-of-type(3), .member td:nth-of-type(3) { width: 100px; }
.member th:nth-of-type(4), .member td:nth-of-type(4) { width: 110px; }
.member th:nth-of-type(5), .member td:nth-of-type(5) { width: 90px; }
.member th:nth-of-type(6), .member td:nth-of-type(6) { width: 90px; }
.member th:last-child { width: 90px; }
.member td:last-child { width: calc( 90px - 18px ); }
</style>
<style>
.post th:nth-of-type(1), .post td:nth-of-type(1) { width: 190px; vertical-align: middle; text-align: center}
.post th:nth-of-type(2), .post td:nth-of-type(2) { width: 100px; vertical-align: middle; text-align: center}
.post th:nth-of-type(3), .post td:nth-of-type(3) { width: 100px;  text-align: center}
.post th:nth-of-type(4), .post td:nth-of-type(4) { width: 130px;  text-align: center}
.post th:nth-of-type(5), .post td:nth-of-type(5) { width: 110px;  text-align: center}
.post th:last-child { width: 100px;  text-align: center}
.post td:last-child { width: calc( 100px - 18px );  text-align: center}
</style>
<style>
.reply th:nth-of-type(1), .reply td:nth-of-type(1) { width: 230px; vertical-align: middle;}
.reply th:nth-of-type(2), .reply td:nth-of-type(2) { width: 100px; vertical-align: middle;}
.reply th:nth-of-type(3), .reply td:nth-of-type(3) { width: 120px; }
.reply th:last-child { width: 80px; }
.reply td:last-child { width: calc( 80px - 18px ); }
</style>    
<style>
.charge th:nth-of-type(1), .charge td:nth-of-type(1) { width: 150px; }
.charge th:nth-of-type(2), .charge td:nth-of-type(2) { width: 100px; }
.charge th:nth-of-type(3), .charge td:nth-of-type(3) { width: 100px; }
.charge th:nth-of-type(4), .charge td:nth-of-type(4) { width: 130px; }
.charge th:nth-of-type(5), .charge td:nth-of-type(5) { width: 150px; }
.charge th:last-child { width: 100px; }
.charge td:last-child { width: calc( 100px - 18px ); }
</style>
<style>
.withdraw th:nth-of-type(1), .withdraw td:nth-of-type(1) { width: 150px; }
.withdraw th:nth-of-type(2), .withdraw td:nth-of-type(2) { width: 100px; }
.withdraw th:nth-of-type(3), .withdraw td:nth-of-type(3) { width: 100px; }
.withdraw th:nth-of-type(4), .withdraw td:nth-of-type(4) { width: 180px; }
.withdraw th:nth-of-type(5), .withdraw td:nth-of-type(5) { width: 100px; }
.withdraw th:last-child { width: 100px; }
.withdraw td:last-child { width: calc( 100px - 18px ); }
</style>

<div class="col-md-10"style="margin-top: 20px;">
	<div style="width: 80%;" align="left">
	<h2>회원 상세보기</h2>
	<hr style="margin-top: 10px;"/>
	</div>

<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님의 정보</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
	<!-- 회원 리스트 -->
	<table class="table member" style="width: 760px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>이메일</th>
				<th>닉네임</th>
				<th>가입 날짜</th>
				<th>보유포인트</th>
				<th>블로그 수</th>
				<th>포스트 수</th>
				<th>댓글 수</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block;" id="mlist">
		<c:forEach var="m" items="${mlist}">
			<tr><td>${m.EMAIL}</td>
			<td>
			<c:choose>
			<c:when test="${m.NICKNAME eq null}">
				<span style="color: red;">미지정</span>
			</c:when>
			<c:otherwise>
				${m.NICKNAME}
			</c:otherwise>
			</c:choose>
			</td>
			<td><fmt:formatDate value="${m.JOINDATE}" pattern="yyyy-MM-dd"/></td>
			<td style="text-align: center"><fmt:formatNumber value="${m.POINT eq null ? 0 : m.POINT}" pattern="#,###"/>P</td>
			<td>${m.BLOG eq null ? 0 : m.BLOG}</td>
			<td>${m.POST eq null ? 0 : m.POST}</td>
			<td>${m.REPLY eq null ? 0 : m.REPLY}</td></tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님의 블로그</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
		<table class="table reply" style="margin-left: 80px ;width: 530px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>블로그명</th>
				<th>블로그소개</th>
				<th>만든날짜</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="r" items="${blist}">
			<tr><td>
			<c:choose>
			<c:when test="${r.SUBCONTENT eq null}">
			${r.CONTENT}
			</c:when>
			<c:otherwise>
			<a href="#" data-toggle="popoverr" data-trigger="hover" data-content="${r.CONTENT}" style="color: black; text-decoration: none;">	${r.SUBCONTENT}</a>
			</c:otherwise>
			</c:choose>
			</td>

			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님이 작성한 포스트</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
	<table class="table post" style="width: 730px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>제목</th>
				<th>좋아요</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>상세보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="p" items="${plist}">
			<tr>
			<td style="text-align: left;">
			<c:choose>
			<c:when test="${p.SUBTITLE eq null}">
			${p.TITLE}
			</c:when>
			<c:otherwise>
			<a href="#" data-toggle="popoverp" data-trigger="hover" data-content="${p.TITLE}" style="color: black; text-decoration: none;">
				${p.TITLE}
			</a>
			</c:otherwise>
			</c:choose>
			</td>
			<td>${p.GOOD}</td>
			<td>${p.COUNT}</td>
			<td><fmt:formatDate value="${p.PDATE}" pattern="yyyy-MM-dd"/></td>
			<td>
			<a href="/${p.URL}/post/${p.NUM}"><button type="button" class="btn btn-link" style="font-size: 13;">글보기</button></a></td>
			<td><button type="button" class="btn btn-link" id="deleter" style="font-size: 13;" value="${p.NUM}">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님이 작성한 댓글</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
		<table class="table reply" style="margin-left: 80px ;width: 530px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>내용</th>
				<th>작성일</th>
				<th>원본글보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block; font-size: 13;" id="mlist">
		<c:forEach var="r" items="${rlist}">
			<tr><td>
			<c:choose>
			<c:when test="${r.SUBCONTENT eq null}">
			${r.CONTENT}
			</c:when>
			<c:otherwise>
			<a href="#" data-toggle="popoverr" data-trigger="hover" data-content="${r.CONTENT}" style="color: black; text-decoration: none;">	${r.SUBCONTENT}</a>
			</c:otherwise>
			</c:choose>
			</td>
			<td><fmt:formatDate value="${r.CDATE}" pattern="yyyy-MM-dd"/></td>
			<td><a href="/${r.URL}/post/${r.PNUM}" title="글제목" data-toggle="popover" data-trigger="hover" data-content="${r.TITLE}">
			<button type="button" class="btn btn-link" style="font-size: 13;">글보기</button></a></td>
			<td><button type="button" class="btn btn-link" id="delete" style="font-size: 13;" value="${r.NUM}">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님의 충전 내역</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
	<!-- 충전 리스트 -->
	<table class="table charge" style="width: 730px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>충전 신청일</th>
				<th>신청포인트</th>
				<th>결제 금액</th>
				<th>결제 방식</th>
				<th>결제 상세 정보</th>
				<th>충전 승인</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block;">
			<c:forEach var="c" items="${clist}">
				<tr>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${c.DDATE }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td style="vertical-align: middle; height: 50px; text-align: center;"><fmt:formatNumber pattern="#,###">${c.POINT }</fmt:formatNumber>P</td>
					<td style="vertical-align: middle; text-align: center;">
					<fmt:formatNumber pattern="#,###">
					${c.POINT + c.POINT/10}
					</fmt:formatNumber>원</td>
					<td style="vertical-align: middle; height: 50px;">${c.PAYMENT }</td>
					<td style="vertical-align: middle; height: 50px;">${c.PAYMENTOPTION }</td>
					<td style="vertical-align: middle; height: 50px;">
						<button class="btn btn-link" type="button" id="charge" value="${c.NUM}&charge&${c.EMAIL}&${c.POINT }">충전 승인</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	
</div>
<div align="left" style="margin-left: 100px; margin-bottom: 50px;">
	<h4><b>'${sessionScope.target}'</b>님의 출금 내역</h4>
	<hr style="margin-top: 10px; width: 80%;" align="left"/>
	<!-- 출금 리스트 -->
	<table class="table withdraw" style="width: 730px; border-collapse: collapse; display: block; border: 1px solid #ccc;">
		<thead>
			<tr style="background-color: #F6F6F6;">
				<th>출금 신청일</th>
				<th>신청포인트</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>예금주</th>
				<th>출금 승인</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px; max-height: 150px; overflow: auto; display: block;">
			<c:forEach var="w" items="${wlist}">
				<tr>
					<td style="vertical-align: middle;">
					<fmt:formatDate value="${w.WDATE }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td style="vertical-align: middle; height: 50px; text-align: center;"><fmt:formatNumber pattern="#,###">${w.MONEY }</fmt:formatNumber>P</td>
					<td style="vertical-align: middle; height: 50px; text-align: center;">${w.BANK}</td>
					<td style="vertical-align: middle; height: 50px;">${w.ACCOUNT}</td>
					<td style="vertical-align: middle; height: 50px;">${w.HOLDER}</td>
					<td style="vertical-align: middle; height: 50px;">
						<button class="btn btn-link" type="button" id="withdraw" value="${w.NUM}&withdraw">출금 승인</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	
</div>
	
</div>


<script>
$(document).ready(function(){
    $('[data-toggle="popoverr"]').popover();   
    $('[data-toggle="popoverp"]').popover();   
});

//댓글 삭제
$("#deleter").on("click",function(){
	var rst = window.confirm("삭제하시겠습니까?");
	if(rst){
		var num = this.value;
		$.ajax({
			url:"/admin/deleteReply",
			method : "get",
			data : {
			"num" : num,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("댓글 삭제에 실패하였습니다.");
			}
			});
	}
});

//포스트 삭제
$("#delete").on("click",function(){
	var rst = window.confirm("삭제하시겠습니까?");
	if(rst){
		var num = this.value;
		$.ajax({
			url:"/admin/deletePost",
			method : "get",
			data : {
			"num" : num,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("삭제에 실패하였습니다.");
			}
			});
	}
});

//승인누르는 스크립트
function apply(){
	var rst = window.confirm("승인하시겠습니까?");
	if(rst){
		var v = this.value;
		$.ajax({
			"url" : "/admin/cwapplyExec",
			"method" : "get",
			"data" : {
				"num" : v,
			}
		}).done(function(result){
			var rst = JSON.parse(result);
			if(rst.rst){
				location.reload();
			}else{
				window.alert("승인 실패!");
			}
			
		});
	}
}
$("#withdraw").on("click", apply);
$("#charge").on("click", apply);
</script>