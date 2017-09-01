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






<style>

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



a{
	margin: 10px;
}

@media (min-width: 576px){
.col-sm-3 {
    float: left;
    width: 25%;
}}


</style>

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
		          	<div class="col-xs-9">카테고리 선택</div>
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">카테고리</div>
		          	<div class="col-xs-9">카테고리 선택</div>
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">카테고리</div>
		          	<div class="col-xs-9">카테고리 선택</div>
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">카테고리</div>
		          	<div class="col-xs-9">카테고리 선택</div>
	          	</div>
	          	<div class="row">
		          	<div class="col-xs-3">댓글 쓰기 권한</div>
		          	<div class="col-xs-9">카테고리 선택</div>
	          	</div>
	         
	         
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn">발행하기</button>
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
			    paragraphFormatSelection: true
			  })
			});
		
		$(function(){
		    $('[data-toggle="popover"]').popover()
		    });
		
	</script>
</body>
</html>







