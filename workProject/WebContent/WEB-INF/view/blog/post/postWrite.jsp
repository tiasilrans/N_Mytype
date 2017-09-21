<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<link 
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />


<style>

div#editor {
	
	width: 100%;
	text-align: left;
}

input:focus {
  outline: none;
   outline-style:none;
}


.title-wrap {
    padding: 0;
    margin-bottom: 50px;
}

	.title-wrap input {

	    border: 0;
	    padding: 0;
	    margin: 10px;
	    border-radius: 0;
	}
	
	textarea.autosize {
	    resize: none;
	}


 .post {
   
    height: 100%;
    padding: 1.5em 0;
    margin: 20px;
    font-size: 16px;
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
	border-radius: 3px;
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

<body>
	
	<div class="modal fade" id="modalPublish" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: 0px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>발행</h4>
			</div>
			<div class="modal-body">
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">카테고리</div>
					<div class="col-xs-3">  
						<select id="category" class="form-control">
							<option>카테고리 선택</option>								
							<c:forEach var="obj" items="${catelist }">
							<c:if test="${obj.CATEGORY_NAME ne '전체 보기'}">				
								<option selected=${updatePostInfo.CATEGORY eq obj.CATEGORY_NAME ? 'selected' : '' }>${obj.CATEGORY_NAME }</option>	
							</c:if>															
							</c:forEach>
							
						</select>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">최소 후원금액</div>
					<div class="col-xs-6">
						<input class="form-control" type="text" name=" support"
							id="support" style="width:100px;" placeholder="0">
					</div>
					<div class="col-xs-3" style="margin-left:-190px; margin-top: 7px;"> 
						<span>포인트</span> 
					</div>  
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">결제 금액</div>
					<div class="col-xs-6">
						<input class="form-control" type="text" name="price"
							id="price" style="width: 100px;" value="${updatePostInfo.PRICE eq  null ? 0 : '' } ">
					</div>
					<div class="col-xs-3" style="margin-left:-190px; margin-top: 7px;"> 
						<span>포인트</span> 
					</div>  
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-3" style="color: #4d4d4d;">표시설정</div>
					<div class="col-xs-9">
						<input type="checkbox" id="notice" class="checkbox-style"
											${updatePostInfo.NOTICE eq true ? 'checked' : '' }>
						<label for="notice">공지</label>
						<input type="checkbox" id="adult" class="checkbox-style"
											${updatePostInfo.ADULT eq true ? 'checked' : '' }>
						<label for="adult">성인물</label>
					</div>
				</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-xs-3" style="color: #4d4d4d;">공개설정</div>
						<div class="col-xs-9">
						<input type="radio" id="public" class="radio-style" name="open" 
											${updatePostInfo.OPEN eq 'public' ? 'checked' : '' }>
						<label for="public">전체 공개</label>
						<input type="radio" id="my" class="radio-style" name="open"
											${updatePostInfo.OPEN eq 'my' ? 'checked' : '' }>
						<label for="my">나만 보기</label>
						<input type="radio" id="secret" class="radio-style" name="open"
											${updatePostInfo.OPEN eq 'secret' ? 'checked' : '' }>
						<label for="secret">비밀글</label>
						</div>
					</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-xs-3" style="color: #4d4d4d;">댓글 쓰기 권한</div>
						<div class="col-xs-9">
						<input type="radio" id="login" class="radio-style" name="comment"
											${updatePostInfo.REPLY_RIGHT eq 'login' ? 'checked' : '' }>
						<label for="login">로그인 사용자</label>
						<input type="radio" id="supporter" class="radio-style" name="comment"
										${updatePostInfo.REPLY_RIGHT eq 'supporter' ? 'checked' : '' }>
						<label for="supporter">구매자/후원자</label>
					</div>

	          	</div>	         
	        </div>
		        <div class="modal-footer">
		          <button type="button" class="button button1" id="publisher">발행하기</button>
		        </div>
	    	</div> 		  		
  		</div>
 	</div>
 	
  	
	

	<section>
		<div align="center" class="row ">
		<div class="col-xs-0 col-md-1 col-lg-2"></div>
			<div class="col-xs-12 col-md-10 col-lg-8">
				<article class="post">
					<div class="row">				
						<div class="title-wrap">
							<div class="form-group">
								<input type="text" class="form-control" id="title" 
									name="title" placeholder="제목을 입력하세요." value="${updatePostInfo.TITLE }" 
									style="font-size: 32px;">
							</div> 						 
							<div class="form-group" style="">
								<input type="text" class="form-control" id="subtitle"
									name="subtitle" placeholder="부제목을 입력하세요." value="${updatePostInfo.SUBTITLE }"
									style="font-size: 16px;"> 
							</div>  
						</div>
						
						<div class="editor" id="editor">
							${updatePostInfo.FCONTENT }
							<p></p>
							<div class="payment-line" id="payline" align="center" contenteditable="false">
								<i class="material-icons" style="color: white;">attach_money</i>
								<span class="payment-line-description" style="vertical-align: top; color: white;">결제선</span> <span class="payment-line-description" style="vertical-align: top; color: #d9d9d9; font-size: 15px;"> — 이 선 아래쪽에 유료 콘텐츠를 작성하세요.</span>
							</div>
							${updatePostInfo.CCONTENT }
							<p></p>
						 
						</div> 
        
					</div>    
				</article> 
 


			</div> 
			<div class="col-xs-0 col-md-1 col-lg-2"></div>
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
	// checked
	function replychecked() {
		var login = $("#login").prop("checked");
		var supporter = $("#supporter").prop("checked");
		if(login){
			return "login";
		}else{
			return "supporter";
		}
		
	};
	
	function openchecked() {
		var publicoepn = $("#public").prop("checked");
		var my = $("#my").prop("checked");
		var secret = $("#secret").prop("checked");
		if(publicoepn){
			return "public";
		}else if(my){
			return "supporter";
		}else{
			return "secret";
		}
		
	};
	


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

		// 발행
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
					"price" : $("#price").val(),
					"notice" : $("#notice").prop("checked"),
					"adult" : $("#adult").prop("checked"),
					"open" : openchecked(), 
					"reply_right" : replychecked(),
					"url" : "${map.url}",
					"mode" : "${map.mode}",
					"num" : "${map.num}"
					
				}
			}).done(function(result) {				
				if (result.result) {
					window.alert("포스트 저장 완료");
					location.href = "/blog/" + result.url;
				}else{				
					window.alert("포스트 저장 실패");
				}
			})
		});

		
</script>
</body>
</html>