<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<link 
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="/css/blogViewcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">

div#editor {
	width: 81%;
	margin: auto;
	text-align: left;
}

.title-wrap {
    padding: 0;
    margin: 0;
    border-bottom: 1px solid rgba(0,0,0,.09);
}
@media (min-width: 576px)
 .post {
    padding: 2.5em 0;
}

.post .container {
    padding: 0 20px;
}

.post .container {
    padding: 0 20px;
}

.container {
    width: 100%;
}
@media (min-width: 576px)

.container {
    width: 540px;
    max-width: 100%;
}

.container {
    margin-left: auto;
    margin-right: auto;
    padding-left: 15px;
    padding-right: 15px;
}

.title-wrap input {
    width: 100%;
    border: 0;
    padding: 0;
    margin: 10px;
    border-radius: 0;
}

textarea.autosize {
    resize: none;
}


 .post {
    width: 100%;
    height: 100%;
    padding: 1.5em 0;
    margin: 20px;
    font-size: 16px;
    overflow-x: hidden;
    overflow-y: auto;
}

a.dropdown-toggle{
	padding: 0px;
	margin: 0px;
	
	
}

a{
	margin: 10px;
}

@media (min-width: 576px){
.col-sm-3 {
    float: left;
    width: 25%;
}}



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
	width: 20px;
	height: 20px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 2px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=checkbox]:checked+label:before {
	content: "\2714"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #1a1a1a;
	text-align: center;
	line-height: 18px;
}

input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
}

input[type=radio]+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 10px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=radio]:checked+label:before {
	content: "\2714"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #1a1a1a;
	text-align: center;
	line-height: 18px;
}

.btn-default {
	text-shadow: 0 1px 0 #fff;
	background-image: -webkit-linear-gradient(top, #fff 0, #e0e0e0 100%);
	background-image: -o-linear-gradient(top, #fff 0, #e0e0e0 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#e0e0e0));
	background-image: linear-gradient(to bottom, #fff 0, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffffffff', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	background-repeat: repeat-x;
	border-color: #dbdbdb;
	border-color: #ccc;
}


.tagtext {
    width: 100%;
    padding: 0 0 0 32px;
    font-size: 14px;
    line-height: 24px;
    border: 0;
}

#title::-webkit-input-placeholder {
   font-weight: bold; 
}

.payment-line{
	background-color: gray;
	
}



</style>


</head>



<title> ${title }</title>
<body>

	<header>		
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-toggle" style="float: left; border: 0px;"> <span
					class="glyphicon glyphicon-menu-left"></span></a>  
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#postNav"> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> 
				</button>
			</div>		
			
			<div class="collapse navbar-collapse" id="postNav">
				<ul class="nav navbar-nav">
					<li class="back" style="margin-left: 200px; margin-top: 4px;"><a href="/blog/${map.url }" style=" margin-right: 0px;"><i class="material-icons">keyboard_backspace</i></a>
					<li class="home" style="margin-right: 15px;"><a href="/" style=" margin: 0px; padding-left:0px; background-image: none; background-color: white;"><span><img
								src="/images/mytype.png"></span></a>
						 
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li style="margin-right: 200px; margin-top: 15px;"><a class="bnt dropdown-toggle" data-toggle="modal"
						data-target="#modalPublish"><span>발행 <i class="material-icons">keyboard_arrow_down</i></span></a></li>
				</ul>
			</div> 
		</div>

	</header>



	<div class="modal fade" id="modalPublish" role="dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: 0px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>발행</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="row">
						<div class="col-xs-12 col-sm-3">       
							<label class="form-control-label" style="color: #4d4d4d;">썸네일</label>
						</div>
						<div class="col-xs-12 col-sm-9" style="margin-left: -9px;">
							<a class="btn btn-default" href="#" role="button" id="">썸네일 
								선택</a> <a class="btn btn-default" href="#" role="button" id=""
								style="margin-left: -10px;">삭제</a>
						</div>
					</div>
				</div> 

				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">카테고리</div>
					<div class="col-xs-3">  
						<select id="category" class="form-control">
							<option>카테고리 선택</option>								
							<c:forEach var="obj" items="${catelist }">
							<c:if test="${obj.CATEGORY_NAME ne '전체 보기'}">				
								<option>${obj.CATEGORY_NAME }</option>	
							</c:if>															
							</c:forEach>
							
						</select>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">최소 후원금액</div>
					<div class="col-xs-6">
						<input class="form-control" type="text" name=" support"
							id=" support" required style="width: 100px;" />
					</div>
					<div class="col-xs-3" style="margin-left: -690px; margin-top: 7px;"> 
						<span>포인트</span> 
					</div>  
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">표시설정</div>
					<div class="col-xs-9">
						<input type="checkbox" id="notice" class="checkbox-style" /><label
							for="notice">공지</label> <input type="checkbox" id="adult"
							class="checkbox-style" /><label for="adult">성인물</label>
					</div>
				</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-xs-3" style="color: #4d4d4d;">공개설정</div>
						<div class="col-xs-9">
						<input type="radio" id="all" class="radio-style" name="open" /><label
							for="all">전체 공개</label> <input type="radio" id="my"
							class="radio-style" name="open" /><label for="my">나만 보기</label> <input
							type="radio" id="secret" class="radio-style" name="open" /><label
							for="secret">비밀글</label>
						</div>
					</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-xs-3" style="color: #4d4d4d;">댓글 쓰기 권한</div>
						<div class="col-xs-9">
						<input type="radio" id="login" class="radio-style" name="comment" /><label
							for="login">로그인 사용자</label> <input type="radio" id="buy"
							class="radio-style" name="comment" /><label for="buy">구매자/후원자</label>
					</div>

	          	</div>	         
	        </div>
		        <div class="modal-footer">
		          <button type="button" class="button button1" id="publisher">발행하기</button>
		        </div>
	    	</div>  		  		
  		</div>
 	
  	
  	
	

	<section>
		<div align="center" class="row ">
			<div class="col-xs-0 col-md-1"></div>
			<div class="col-xs-12 col-md-10">
				<article class="post">
					<div class="container">				
						<div class="title-wrap">
							<div class="form-group" style="margin-top: 70px; margin-left: 112px;">
								<input type="text" class="form-control" id="title" 
									name="title" placeholder="제목을 입력하세요." 
									style="font-size: 32px;">
							</div> 						 
							<div class="form-group" style="margin-left: 112px;">
								<input type="text" class="form-control" id="subtitle"
									name="subtitle" placeholder="부제목을 입력하세요."
									style="font-size: 16px;"> 
							</div>  
						</div>
						
						<div class="editor" id="editor">
							<p></p>
							<div class="payment-line" id="payline" align="center" contenteditable="false">
								<i class="material-icons" style="color: white;">attach_money</i>
								<span class="payment-line-description" style="vertical-align: top; color: white;">결제선</span> <span class="payment-line-description" style="vertical-align: top; color: #d9d9d9; font-size: 15px;"> — 이 선 아래쪽에 유료 콘텐츠를 작성하세요.</span>
							</div> 
							<p></p>
						
						</div> 
						
						<div class="tag-wrap" style="margin-top: 20px;"> 
						<label class="material-icons" title="태그" style="float: left; margin-left: 120px;">bookmark</label>
						<label for="post-tags" class="sr-only">태그</label>
						
						<input type="text" class="form-control" id="hash" 
									name="hash" placeholder="여러 개의 태그는 공백(space)으로 구분하여 입력하세요." 
							 	class="tagtext" style="width: 850px; margin-left: -300px; height: 25px;">    
						</div>
    
					</div> 
				</article>
 


			</div> 
			<div class="col-xs-0 col-md-1"></div>
		</div>

	</section>
	



<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1//js/froala_editor.pkgd.min.js"></script>

<!-- Initialize the editor. -->
<script>
	$(function() {
		$("#editor").froalaEditor(
				{
					toolbarButtons : [ 'fontFamily', '|', 'fontSize', '|',
								'paragraphFormat', '|', 'bold', 'italic',
								'underline', 'undo', 'redo', 'codeView' ],
					fontFamilySelection : true,
					fontSizeSelection : true,
					paragraphFormatSelection : true,
					heightMin : 100
				})
		});
	
		setTimeout(function() {
			$("[href='https://www.froala.com/wysiwyg-editor?k=u']").eq(0).remove();
		}, 5);

		$("#publisher").on("click", function() {
			var prev = "";
			var next = "";
			$("#payline").prevAll().each(function(){
				prev = "<p>" + $(this).html() +"</p>"+prev;
			})			
			$("#payline").nextAll().addClass("ccontent");
			$("#payline").nextAll().each(function(){
				next += "<p>" + $(this).html() +"</p>";
			})			
			$.ajax({
				url : "/postWriter.mt",
				data : {				
					"category" : $("#category").val(),
					"title" : $("#title").val(),
					"subtitle" : $("#subtitle").val(),
					"fcontent" : prev,
					"ccontent" : next,
					"hash" : $("#hash").val(),
					"url" : "${map.url}"
					
				}
			}).done(function(result) {				
				if (result.result) {
					window.alert("포스트 작성 완료");
					location.href = "/blog/" + result.url;
				}else{				
					window.alert("포스트 작성 실패");
				}
			})
		});

		
</script>
</body>
</html>