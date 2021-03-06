<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.box{
	border: 1px solid;
	border-color: #d9d9d9;
	margin: 20px;
	width: 90%;
	padding: 20px;
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
				<h3 align="left" style="color: #262626">새 블로그 만들기 </h3>
				<br/>				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: #4d4d4d;">제목</label> 
					</div>
					<div class="col-sm-9">
						<input class="form-control" type="text"
							placeholder="제목" name="title" id="title" required />
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: #4d4d4d;">블로그 소개</label>
					</div>
				<div class="col-sm-9">
					 <input class="form-control" type="text"
						placeholder="블로그 소개" name="intro" id="intro" required />
				</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3" align="left">
						<label style="color: #4d4d4d;">블로그 URL</label>
					</div>
					<div class="col-sm-9">
					    <input class="form-control" type="text"
						placeholder="블로그 URL" name="url" id="url" required/>
						<p align="left">영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다.</p>
					</div>
				</div>
				<br/>
				<br/>
				<div align="center" class="row">
					<div class="col-md-6 form-group">
					</div>
					<div class="col-md-6 form-group" align="right">
						<button class="button button1" id="bt">새 블로그 만들기</button>
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





