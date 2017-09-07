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
.button1 {
	background-color: #303030;
	}
	
.button2 {
	background-color: #cccccc;
	}
	
.cate-bt{
	margin: 0px;
	border: 0px;

}



</style>

	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
		<div class="form-group box">		
				<h3 align="left" style="color: #262626">카테고리 편집</h3> 
				<div align="right">
					<button class="button button2" id="add">추가</button>
				</div>				
				<br/>
				
					
						<div class="form-group">					
							<input class="form-control" type="text" value="전체 보기" readonly="readonly"/>					
						</div>
						<c:forEach var="obj" items="${list }">	
						<c:if test="${obj.CATEGORY_NAME ne \"전체 보기\"}">				
							<div class="row"><div class="col-xs-9 col-md-9 form-group">
							<input class="form-control cate_name" type="text" name="cate_name" value="${obj.CATEGORY_NAME }"/>
							<input type="hidden" name="cate_id" class="cate_id" value="${obj.CATE_ID}"/>
							</div><div class="col-xs-1 col-md-1 form-group">
							<button class="form-control cate-bt cate_up"><i class="glyphicon glyphicon-chevron-up"></i></button>
							</div><div class="col-xs-1 col-md-1 form-group"><button class="form-control cate-bt cate_down"><i class="glyphicon glyphicon-chevron-down"></i></button>
							</div><div class="col-xs-1 col-md-1 form-group"><button class="form-control cate-bt cate_delete"><i class="glyphicon glyphicon-remove"></i></button>
							</div></div>
						</c:if>						
						</c:forEach>
						
						<div class="form-group" id="catelist">
						
						
						
						</div>	
						
								
					<div class="row">
						<div class="col-md-6 form-group"></div>
						<div class="col-md-6 form-group" align="right">
							<button type="button" class="button button1" id="bt">변경 내용 저장</button>
						</div>
					</div>					
				
		</div>
		
	</div>	
	<div class="col-xs-0 col-md-2"></div>



<script>

	


	$("#add").on("click", function(){
		var add = "<div class=\"row\"><div class=\"col-xs-9 col-md-9 form-group\">"
				+"<input class=\"form-control cate_name\" type=\"text\" name=\"addcate_name\"/>"
				+"<input type=\"hidden\" name=\"addcate_id\" class=\"cate_id\" />"
				+"</div><div class=\"col-xs-1 col-md-1 form-group\">"
				+"<button class=\"form-control cate-bt cate_up\"><i class=\"glyphicon glyphicon-chevron-up\"></i></button>"
				+"</div><div class=\"col-xs-1 col-md-1 form-group\"><button class=\"form-control cate-bt cate_down\"><i class=\"glyphicon glyphicon-chevron-down\"></i></button>"
				+"</div><div class=\"col-xs-1 col-md-1 form-group\"><button class=\"form-control cate-bt cate_delete\"><i class=\"glyphicon glyphicon-remove\"></i></button></div></div>";		
		$("#catelist").append(add);
		$(".cate_up").on("click", function(){
			console.log("업 버튼 눌렀다");
				
		
	});
		
	});
	
	$("#bt").on("click", function(){
		var cate_name_order = "";
		var cate_name = "";
		var cate_id = "";
		var addcate_name = "";
		var vs1 = $('[name=cate_name]');
		var vs2 = $('[name=cate_id]');
		var a1 = $('[name=addcate_name]');
		for(var i=0; i<vs1.length; i++) {
			cate_name += vs1.eq(i).val() + ",";
			cate_id += vs2.eq(i).val() + ",";
		}
		for(var i=0; i<a1.length; i++) {
			addcate_name += a1.eq(i).val() + ",";
		}
		
		$(".cate_name").each(function(){	         
	        cate_name_order += $(this).val()+",";	         
	     });
		console.log("순서 : " + cate_name_order)
		console.log("이미 있는 카테 이름  : " + cate_name);
		console.log("이미 있는 카테  아이디 : " + cate_id);
		console.log("추가 카테 이름  : " + addcate_name);
		
		
		$.post({
			url:"/blog/categoryAdd.mt",
			data : {
				"cate_name_order" : cate_name_order,
				"cate_name" : cate_name,
				"cate_id" : cate_id,
				"addcate_name" : addcate_name
					}
			}).done(function(result) {
				window.alert(result.result);
			}) 
		
		
		
			
		
		
	});





	
</script>


