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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="/css/editorcss.css">
<link rel="stylesheet" href="/css/blogViewcss.css">
 
</head> 


  <title>${title }</title>
  <body>  	
  	<header>
  		<div class="navbar navbar-default navbar-fixed-top">
  			<div class="navbar-header">
  				<a class="navbar-toggle" style="float: left; border: 0px;">
  					<span class="glyphicon glyphicon-menu-left"></span></a> 
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#postNav"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span></button>
			</div>  		
  		<div class="collapse navbar-collapse" id="postNav">  		
			<ul class="nav navbar-nav">						
				<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-th-large"></span><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a>새 포스트 쓰기</a></li>
							<li><a href="" >발행글</a></li>							
							<li><a href="">임시저장글</a></li>	
							<li><a href="">카테고리</a></li>
							<li><a href="">블로그 설정</a></li>
							<li><a href="">마이타입 홈</a></li>						
						</ul></li>			
			</ul>
			
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a class="bnt dropdown-toggle" data-toggle="modal" data-target="#modalPublish"><span>발행</span></a>
			</li>
							
			<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-option-vertical"></span></a>
				<ul class="dropdown-menu">
					<li><a href="" >Profile</a></li>
					<li><a href="" >Update</a></li>
					<li><a href="" >My Like</a></li>
					<li><a href="" >Logout</a></li>
					</ul></li>
		</ul>
	</div>
  </div>
     		
  	</header>
  	<nav>
  		<br/>
  		<br/>
  		<br/>
  	</nav>
  	
  	
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
                            <label class="form-control-label">썸네일</label>
                        </div>
                        <div class="col-xs-12 col-sm-9">                      
                            <a class="btn " href="#" role="button" id="">썸네일 선택</a>
                            <a class="btn " href="#" role="button" id="">삭제</a>
                        </div>
                    </div>
                </div>
	     
	          	<div class="row">
		          	<div class="col-xs-3">카테고리</div>
		          	<div class="col-xs-3">
		          		<select name="category" class="form-control">
		          			<c:forEach var="obj" items="${catelist }"> 							
								<option>${obj.BLOG_TITLE }</option>
								<option>${obj.CATEGORY_NAME }</option>							
							</c:forEach>
						</select>
		          	</div>
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">최소 후원금액</div>
		          	<div class="col-xs-6">
		          	<input class="form-control" type="text"
						   name=" support" id=" support" required style="width: 100px;"/>
					</div>
					<div class="col-xs-3">
					<span>포인트</span>
		          	</div> 
					
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">표시설정</div>
		          	<div class="col-xs-9"><label for="notice"><input type="checkbox" id="notice" name="notice">공지</label>
		          	<label for="adult"><input type="checkbox" id="adult" name="adult">성인물</label>
	          	</div>
	          	
	          	<div class="row">
		          	<div class="col-xs-3">공개설정</div>
		          	<div class="col-xs-9"></div>
		          	<label for="all"><input type="radio" id="all" name="all">전체 공개</label>
		          	<label for="my"><input type="radio" id="my" name="my">나만 보기</label>
		          	<label for="secret"><input type="radio" id="secret" name="secret">비밀글</label>
	          	</div>
	          	
	          	<div class="row">
		          	<div class="col-xs-3">댓글 쓰기 권한</div>
		          	<div class="col-xs-9"></div>
		          	<label for="login"><input type="radio" id="login" name="login">로그인 사용자</label>
		          	<label for="buy"><input type="radio" id="buy" name="buy">구매자/후원자</label>
	          	</div>
	         
	         
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="button button1" id="bt">발행하기</button>
	        </div>
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
							<div class="form-group">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="제목을 입력하세요" style="font-size: 32px;">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="subtitle" name="subtitle"
									placeholder="부제목을 입력하세요" style="font-size: 16px;">
							</div>
					</div>
					<div class="editor" id="editor">
					
					</div>
					<div class="tag-wrap">
		                <i class="glyphicon glyphicon-tags" title="태그"></i>
		                <label for="post-tags" class="sr-only">태그</label>
		                
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
		
		$(function(){
			  $("#editor").froalaEditor({
			    toolbarButtons: ['fontFamily', '|', 'fontSize', '|', 'paragraphFormat', '|', 'bold', 'italic', 'underline', 'undo', 'redo', 'codeView'],
			    fontFamilySelection: true,
			    fontSizeSelection: true,
			    paragraphFormatSelection: true,
			    heightMin: 100,
			    heightMax: 300
			  })
			});
		
		$(function(){
		    $('[data-toggle="popover"]').popover()
		    });
		
		
		$("#bt").on("click", function() {
			$.post({
				url : "/postWriter.mt",
				data : {
					"title" : $("#title").val(),
					"subtitle" : $("#subtitle").val(),
					"fcontent" : $("#editor").val()
					
				}
			}).done(function(result) {
				if(result.result){
					location.href="/blog/"+result.url; 
				}
			})		
			
		});
		
		
	</script>
</body>
</html>







