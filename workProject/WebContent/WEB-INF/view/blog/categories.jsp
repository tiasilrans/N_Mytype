<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
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
	
	.button2 {background-color: #cccccc;}

</style>   
	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
		<div class="form-group box row">	
				
		
				<h3 align="left" style="color: #262626">카테고리 편집</h3> 
				<div align="right">
				<button class="button button2" id="add">추가</button>
				</div> 
			     
				
				<br/>	
							
				<div class="form-group row">
					<div class="col-sm-12">
						<input class="form-control" type="text"
							name="title" id="title" required />
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-12">
						<input class="form-control" type="text"
							placeholder="전체 보기" name="title" id="title" required />
					</div>
				</div>
				
				<br/>
				<br/>
				<div align="center" class="row">
					<div class="col-md-6 form-group">
					</div>
					<div class="col-md-6 form-group" align="right">
						<button class="button button1" id="bt">변경 내용 저장</button>
					</div>
				</div>
		</div>
		
	</div>
	
	<div class="col-xs-0 col-md-2"></div>

</div>

<script>

	document.getElementById("add").onclick = function () {
	
	}
</script>


