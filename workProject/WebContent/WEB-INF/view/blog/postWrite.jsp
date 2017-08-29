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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>





<style type="text/css">
div#editor {
	width: 81%;
	margin: auto;
	text-align: left;
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
  	<section> 
	  	<div align="center" class="row ">
		<div class="col-xs-0 col-md-1"></div>
		<div class="col-xs-12 col-md-10">
			<div class="editor" id="editor">
					
			</div>
		</div>
			<div class="col-xs-0 col-md-1"></div>
		</div>
  	
 	</section>
 	
 	<div class="modal-dialog modal modal fade" id="modalPublish" role="dialog">
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
			$("#editor").froalaEditor()
		});
		
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







