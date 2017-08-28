<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.box{
	border: 1px solid;
	border-color: #d9d9d9;
	margin: 20px;
	width: 100%;
	height: 50%;
}



</style>   

<div align="center" class="row ">
	<div class="col-xs-0 col-md-3"></div>
	<div class="col-xs-12 col-md-6">		
		<form action="" method="post">		
		<div class="form-group box">
		
			<h3 align="left">새 블로그 만들기 </h3>
			
			<div class="form-group">
			<label>제목</label> 
			<div class="col-sm-9">
				<input class="form-control" type="text"
					placeholder="제목" name="title" id="title" required />
			</div>
			</div>
			
			<div class="form-group">
			<label>블로그 소개</label>
			<div class="col-sm-9">
				 <input class="form-control" type="text"
					placeholder="블로그 소개" name="intro" id="intro " required />
			</div>
			</div>
			
			<div class="form-group">
			<label>블로그 URL</label>
				<div class="col-sm-9">
				    <input class="form-control" type="text"
					placeholder="블로그 URL" name="url" id="url" required/>
					영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다. (대시는 문장 가운데에만 입력 가능합니다.)
				</div>
			</div>
			<br/>
			<br/>
			<div align="center" class="row">
				<div class="col-md-6 form-group">
					<button id="sbt" type="submit" class="btn btn-success" disabled>새 블로그 만들기</button>
				</div>
				<div class="col-md-6 form-group">
				</div>
			</div>
			</div>
		</form>
	</div>
	<div class="col-xs-0 col-md-3"></div>
</div>



