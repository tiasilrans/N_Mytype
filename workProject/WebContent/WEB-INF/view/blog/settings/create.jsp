<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">   

<style>
.box{
	background-color:gray;
	margin: 20px;
	width: 90%;
	padding: 20px;
	border-radius: 10px;
}

p {
	color: #a6a6a6;	

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
	.button1 {background-color: #303030;}

</style>   

<div align="center" class="row">
	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
		<div class="form-group box row">				
				<h3 align="left" style="color: #262626; margin-left: 50px; font-family:NanumSquare; " >새 블로그 만들기 </h3>
				<br/>				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: black; margin-left: 50px; font-family:NanumSquare;">제목</label> 
					</div>
					<div class="col-sm-9">
						<input class="form-control" type="text"
							placeholder="제목" name="title" id="title"  style="margin-left: margin-left: -120px;"   required />
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: black; margin-left: 50px; font-family:NanumSquare;">블로그 소개</label>
					</div>
				<div class="col-sm-9">
					 <input class="form-control" type="text"
						placeholder="블로그 소개" name="intro" id="intro" style="margin-left: margin-left: -120px;" required />
				</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: black; margin-left: 50px; font-family:NanumSquare; ">블로그 URL</label>
					</div>
					<div class="col-sm-9">
					    <input class="form-control" type="text"
						placeholder="블로그 URL" name="url" id="url" style="margin-left: margin-left: -120px;"    required/>
						<p align="left" style="font-family: NanumSquare;">영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다.</p>
					</div>
				</div>
				<br/>
				<br/>
				<div align="center" class="row">
					<div class="col-md-6 form-group">
					</div>
					<div class="col-md-6 form-group" align="right">
						<button class="button button1" id="bt" style="margin-top: -40px;">새 블로그 만들기</button>
					</div>
				</div>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-2"></div>
</div>

<script>
	
</script>
<script>	
	
	$("#bt").on("click", function(){				
		var r = /^[a-z]|[0-9]$/;
		var url = $("#url").val();
		var len = url.length;
		
		if(r.test(url) && len >=6){
			$.post({
				url:"/blog/ctrateBlog.mt",
				data : {
					"title" : $("#title").val(),
					"intro" : $("#intro").val(),
					"url" : $("#url").val()				
				}
			}).done(function(result) {
					if(result.result){
						location.href="/blog/"+result.url; 
					}
				})
		}else{
			
			window.alert("블로그 url은 영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다.");
		}
		
	});
		
	
</script>





