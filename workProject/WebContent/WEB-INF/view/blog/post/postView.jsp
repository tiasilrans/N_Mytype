<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/postviewcss.css">
<style>
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
}

input[type=checkbox]+label:before {
	content: "";
	display: inline-block;
	width: 17px;
	height: 17px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 3px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=checkbox]:checked+label:before {
	content: "\2714"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 15px;
	font-weight: 800;
	color: #fff;
	background: #1a1a1a;
	text-align: center;
	line-height: 18px;
	
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
		background-color: black;
}

.button2 {
	background-color: black;
	padding: 6px 17px;
	font-size: 12px;
}

.button3 {
	background-color: gray;
	padding: 6px 17px;
	font-size: 12px;
}
	
}
</style>
<div class="row">
	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-6 col-md-6">
		<div class="content"
			style="margin-top: 100px; margin-left: 100px; padding: 0px;">
			<div class="container">
				<div class="header">
					<div class="category"
						style="margin-bottom: 120px; margin-left: 3px;">
						<a style="color: black; font-family: sans-serif;" href="">${post.CATEGORY }</a>
					</div>

					<div style="margin-top: -70px;">
						<h1 class="title"
							style="font-family: sans-serif; font-weight: bold; color: black;">${post.TITLE }</h1>
					</div>
					<div class="subtitle"
						style="font-family: sans-serif; color: black; font-size: 18px; margin-left: 3px;">${post.SUBTITLE }</div>
					<div class="profile" style="margin-top: 45px;">
						<div class="media-profile">
							<div class="media-left"
								style="margin: 10px; vertical-align: middle;">
								<img src="/images/avatar_yellow.png" class="media-object"
									style="width: 45px; border-radius: 30px; width: 32px; height: 32px; margin-top: -5px;">
							</div>
							<div class="media-body">
								<h4 class="media-heading"
									style="font-family: sans-serif; color: black; font-size: 17px;">${post.NICKNAME }</h4>
								<div style="margin-top: -10px;">
									<h4 style="font-family: sans-serif; color: #808080;">
										<small>${post.PDATE }</small> <small>조회 ${post.COUNT }</small>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="post-content"
					style="margin-top: 50px; color: black; font-family: sans-serif; font-weight: 700px;">
					<div class="free-content">${post.FCONTENT }</div>
					<!-- 유료 컨텐츠 부분 -->
					<c:choose>
						<c:when test="${buy || sessionScope.login eq post.EMAIL }">
							<div class="charged-content">${post.CCONTENT }</div>
						</c:when>
						<c:otherwise>
							<div class="support" style="display: table; width: 100%;">
								<div class="message"
									style="display: table-cell; vertical-align: middle; padding-right: .75rem; line-height: 1.25; font-family: sans-serif; color: black; font-weight: 800px; width: 55%;">
									<span style="font-family: sans-serif; color: black; font-size: 15px;">
									<span style="font-weight: bold ;font-family: sans-serif; color: red; font-size: 18px;" id="price">
									${post.PRICE}</span> point 구매하여 나머지 내용 보기
									</span>
								</div>
								
								<div style="display: table-cell;">
								<c:choose>
								<c:when test="${sessionScope.login eq null }">
									<button class="button button1" data-toggle="modal" data-target="#login-form">로그인</button>
								</c:when>
								<c:otherwise>
									<button class="button button1" id="buybtn" data-toggle="modal" data-target="#buy-form">구매하기</button>
								</c:otherwise>
								</c:choose>
								</div>
								
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${ sessionScope.login ne post.EMAIL }">
				<div class="support" style="display: table; width: 100%;">
					<div class="message"
						style="display: table-cell; vertical-align: middle; padding-right: .75rem; line-height: 1.25; font-family: sans-serif; color: black; font-weight: 800px; width: 55%;">
						<span
							style="font-family: sans-serif; color: black; font-size: 15px;">${post.NICKNAME }님의
							창작활동을 응원하고 싶으세요?</span>
					</div>
					<div style="display: table-cell;">
						<button class="button button1">후원하기</button>
					</div>
				</div>
				</c:if>
				
				<footer class="post-footer" style="margin-top: 40px;">
					<i class="material-icons"
						style="font-size: 20px; color: #0d0d0d; float: left; font-weight: bold;">favorite_border</i><span
						style="margin-left: 3px; color: #0d0d0d; font-size: 15px;">0</span>
					<i class="material-icons" title="링크복사"
						style="font-size: 25px; color: #0d0d0d; float: right; margin-right: 395px;">insert_link</i>
				</footer>
			</div>
		</div>


		<!-- 본문 아래 블로그 포스트 목록 * 댓글 -->

		<aside class="container aside">
			<!-- 블로그 소개 섹션 -->
			<section class="">
				<div class="body blog-info"
					style="margin-bottom: 30px; margin-top: 30px;">
					<div class="media" style="margin-left: 95px;">
						<img src="${imgPath }"
							style="border-radius: 17%; height: 70px; width: 70px;">
					</div>
					<div class="media-body"></div>
					<button class="btn btn-default"
						style="float: right; margin-right: 295px; margin-top: -45px;">구독하기</button>
				</div>
			</section>
			<!-- 블로그 포스트 리스트 섹션 -->
			<section class="">
				<div style="margin-left: 95px; margin-bottom: 30px;">
					<h5>이 블로그의 다른 포스트</h5>
				</div>
			</section>
			<!-- 포스트 댓글 섹션 -->
			<section class="comments">
				<div class="body" style="margin-left: 95px;">
					<h6>댓글</h6>
					
					<div class="comments" id="comments">
					<c:forEach var="obj" items="${list }">
					<div class="comment-list" style="margin-top: 30px; margin-bottom: 30px;">
						<div class="media">
							<div class="media-left">
								<a><img src="/images/avatar_yellow.png" style="border-radius: 40px; width: 40px; height: 40px; margin-top:5px;"></a>
							</div>
							<div class="media-body">
								<div class="comment-header">
									<a style="color: black; font-family: sans-serif; font-size: 15px;">${obj.EMAIL }</a>
									<time style="color: #999999; font-family: sans-serif; font-size: 12px;">${obj.CDATE }</time>
								</div>
								<div class="comment-content" style="color: black; font-family: sans-serif;">
									<p style="display: block;">${obj.CONTENT }</p>
								</div>

								<div class="comment-action" style="border: none; float: right; margin-right: 240px; margin-top: -55px;">
									<button class="re-reply-write" style="border: 0px; background-color: white; color: #999999; font-size: 12px;">답글</button>
									<button class="reply-edit" style="border: 0px; background-color: white; color: #999999; font-size: 12px;">편집</button>
									<button class="reply-delete" style="border: 0px; background-color: white; color: #999999; font-size: 12px;">삭제</button>
								</div>
								<div class="comment-editor" style="display: none;">
									<div style="float: left;">				
										<div class="checkbox-wrap"
												style="float: left; margin-top: 20px; margin-left: 2px;">
											<input type="checkbox" id="comment-editor-secret" class="checkbox-style"/> <label
													for="secret">비밀댓글</label>
										</div>																				
									</div>
									<div class="edit-bt" style="float: right; margin-right: 295px; margin-top: 10px;">
										<button class="button button3" style="margin-top: -10px;">취소</button>
										<button class="button button2">저장</button>
									</div>
								</div>
							</div>					
						</div>
					</div>					
					</c:forEach>
					<h5>댓글</h5>
							<textarea class="form-control autosize" name="content"
								id="mention" data-autosize-on="true" style="overflow: hidden; word-wrap: break-word; 
								height: 60px; width: 750px; resize: none;" ${sessionScope.login eq null ? "readonly" : "" }></textarea>
							<div class="clearfix">
								<div class="checkbox-wrap"
									style="float: left; margin-top: 20px; margin-left: 2px;">
									<input type="checkbox" id="secret" class="checkbox-style"/> <label
										for="secret">비밀댓글</label>
								</div>
								<div style="float: right; margin-top: 7px; margin-right: 293px;">
									<button type="button" class="button button1" id="sub">댓글 남기기</button>
								</div>
							</div>
						
					</div>
				</div>

			</section>

		</aside>
	<br/>
	<br/>
	<br/>
	</div>
</div>


<!-- 구매하기 modal  -->
<form action="/buypost.mt">
<input type="hidden" name="price" value="${post.PRICE}" />
<input type="hidden" name="num" value="${post.NUM}" />
<input type="hidden" name="email" value="${post.EMAIL}" />
<input type="hidden" name="url" value="${post.URL}" />
<input type="hidden" name="title" value="${post.TITLE}" />
  <div class="modal fade" id="buy-form" role="dialog">
    <div class="modal-dialog" style="width: 450px;">
	    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">구매하기 - <span style="color: blue;">${post.TITLE}</span></h4>
        </div>
        
        <div class="modal-body">
				<div class="row"><div class="col-md-6" style="vertical-align: middle;">보유 포인트</div><div class="col-md-6" style="vertical-align: middle;"><span style="font-size: 15 ;"><fmt:formatNumber value="${mypoint.SUM}" pattern="#,###"/></span></div></div>
				<hr/>
				<div class="row"><div class="col-md-6">사용할 포인트</div><div class="col-md-6"><span style="font-size: 15 ;"><fmt:formatNumber value="${post.PRICE}" pattern="#,###"/></span></div></div>
				<hr/>
				<div class="row"><div class="col-md-6">남은 포인트</div><div class="col-md-6"><span style="font-size: 15 ;"><fmt:formatNumber value="${(mypoint.SUM-post.PRICE)}" pattern="#,###"/></span></div></div>
				<c:if  test="${(mypoint.SUM-post.PRICE) < 0}">
					<hr/>
					<div class="row"><div class="col-md-12">※포인트가 부족합니다. 충전하러 가시겠습니까 ?</div></div>
				</c:if>
        </div>
        <div class="modal-footer">
          		<div class="form-group row" align="center">
				<div align="center" class="row">
				<c:choose>
				<c:when test="${(mypoint.SUM-post.PRICE) < 0}">
					<button class="button button1" type="button" style="width: 360px; height: 60px;" onclick="location.href='/my/point/charge' ">포인트 충전</button>
				</c:when>
				<c:otherwise>
					<button class="button button1" id="login-sbt" type="submit"  style="width: 360px; height: 60px;">구매하기</button>
				</c:otherwise>
				</c:choose>
				</div>
		</div>
        </div>

      </div>
      
    </div>
  </div>
  </form>
  
<!-- 로그인창 modal  -->
  <div class="modal fade" id="login-form" role="dialog">
    <div class="modal-dialog" style="width: 450px;">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        
        <div class="modal-body">
          		<div class="form-group row" align="center">		
			<form action="/loginExec.mt?post=post" method="post">		
			<input type="hidden" name="num" value="${post.NUM}" />
			<input type="hidden" name="url" value="${post.URL}" />			
				<div class="form-group row">
						<input class="form-control" type="text"
							placeholder="e-mail" name="email" id="login-email" required />
				</div>
				
				<div class="form-group row">
					 <input class="form-control" type="password"
						placeholder="비밀번호" name="pw" id="login-pw" required />
				</div>
				<div align="center" class="row">

					<div class="form-group row" align="right" style="width: 360px;">
					<a>비밀번호 찾기</a>｜<a href="join.mt">회원가입</a>
					</div>
					<button id="login-sbt" type="submit" class="btn">로그인</button>
				</div>
			</form>
		</div>
        </div>

      </div>
      
    </div>
  </div>





<script>

// disply f
function disply(target) {	
	if(target.css("display") == "none"){   
		target.css("display", "block");        
	} else {  
		target.css("display", "none"); 
	}	
};


$("#sub").on("click", function() {
	
	$.ajax({
		url : "/${post.NUM }/peply.mt",
		data : {			
			"content" : $("#mention").val(),			
			"secret" : $("#secret").prop("checked"),
			"url" : "${post.URL}"			
		}
	}).done(function(result) {				
		if (result.result) {
			window.alert("댓글 작성 완료");
			location.reload();
		}else{				
			window.alert("댓글 작성 실패");
		}
	})
	
});

// reply edit
$(".reply-edit").on("click", function(){	
	var p = $(this).parent().prev().children('p');	
	var editor = $(this).parent().next();
	console.log(editor);
	disply(p);
	disply(editor);
	var c = p.html();
	var add_editor = "<textarea class=\"form-control\" data-autosize-on=\"true\" style=\"overflow: hidden; resize: none;" 
						+ "word-wrap: break-word; height: 80px; width: 700px; margin-top: 8px;\">"+ c.replace(/<br>/gi, "\r\n") +"</textarea>";
	

	$(this).parent().prev().append(add_editor);

	
});



// re-reply-write
$(".re-reply-write").on("click", function(){
	var add = "";
	
	
	
});


</script>





