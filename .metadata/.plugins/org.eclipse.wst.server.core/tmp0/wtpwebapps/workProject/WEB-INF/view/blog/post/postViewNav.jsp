<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<section class="navbar-info ">
	<nav class="navbar navbar-default" style="margin-bottom: 0px; ">
		<div>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header navbar-me">
				<button type="button"
					class="navbar-toggle collapsed menu-collapsed-button"
					data-toggle="collapse" data-target="#navbar-primary-collapse"
					aria-expanded="false" style="float: left;">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div> 

			
				 <!-- 나브바 왼쪽 -->
				<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="background-image: none; background-color: white; margin: 0px;"><i class="material-icons" style="font-size: 30px; color: black;">menu</i></a>
						<ul class="dropdown-menu" style="width: 250px;">						
							<li style="margin-bottom: 20px;"><a href="/"><img src="/images/title.png" style="height: 18px;"></a></li>
							<li style="margin-left: 20px; font-family: sans-serif; color: black; font-size: 15px; font-weight: 700%"><span>${post.TITLE}</span></li> 
							<li style="margin-left: 20px; color: #999999; font-size: 12px; margin-bottom: 10px;">${totalpost } <span>포스트</span> 0 <span>구독자</span></li>
							<li style="margin-left: 20px; margin-bottom: 40px;"><button class="btn btn-default" style="width: 200px;">구독하기</button></li>
							<li style="margin-bottom: 10px; margin-left: 23px;"><span style="color: #999999; font-family: sans-serif; font-size: 13px; ">작가</span></li>     
							<li style="margin-left: 20px; margin-bottom: 35px;"><img src="/images/avatar_yellow.png" style="width:45px; border-radius: 30px; width: 30px; height: 30px;"><span style="margin-left: 10px; font-family: sans-serif; color: black;">${post.nickname }</span></li>
							<li style="margin-top: 10px; margin-left: 20px;"><span style="color: #999999; font-family: sans-serif; font-size: 13px;">카테고리</span></li>											        
						</ul></li>
						<li style="margin-top: 3px;">
							<a href="/blog/${post.URL}"><i class="material-icons" style="color: black;">arrow_back</i>
						</a></li>    
				</ul> 
			   <!-- 나브바 오른쪽 -->
				<ul class="nav navbar-nav navbar-right"> 
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="background-image: none; background-color: white; margin: 0px; right: 25px;"><i class="material-icons" style="color: black;">more_vert</i></a>
						  <ul class="dropdown-menu" style=" right: 20px;">     
                            	<li><a href=""><i class="material-icons" style="color: #1a1a1a; font-size: 23px; float: left;">bookmark_border</i>　　<span style="margin-left: -20px;">읽기 목록에 추가</span></a></li>   
                            	<li><a href=""><i class="material-icons" style="color: #1a1a1a; font-size: 23px; float: left;">insert_link</i>　　<span style="margin-left: -20px;">링크 복사</span> </a></li>
                            	<c:choose>
                            	<c:when test="${sessionScope.login eq post.EMAIL }">
                            		<li><a href="#" onclick="updateChk();"><i class="material-icons" style="color: #1a1a1a; font-size: 23px; float: left;">clear</i>　　<span style="margin-left: -20px;">편집하기</span> </a></li>
                            		<li><a href="#" onclick="delchk();"><i class="material-icons" style="color: #1a1a1a; font-size: 23px; float: left;">clear</i>　　<span style="margin-left: -20px;">삭제하기</span> </a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li><a href=""><i class="material-icons" style="color: #1a1a1a; font-size: 23px; float: left;">flag</i>　　<span style="margin-left: -20px;">신고하기</span> </a></li> 
								</c:otherwise>
								</c:choose>
                          </ul>
                          </li>
   				</ul>
		</div>
	</nav>
</section>


<script>
$(window).scroll(function() {
	if ($(this).scrollTop() > 5) {
		$(".navbar-me").addClass("fixed-me");
		$(".fixed-me").removeClass("navbar-me");
	} else {
		$(".fixed-me").addClass("navbar-me");
		$(".navbar-me").removeClass("fixed-me");
		
	}
});


function updateChk(){
	
	$.post({
		url : "/blog/update/${post.NUM }",
		data : {
			"num" : "${post.NUM }",
			"url" : "${post.URL}"
		}
	}).done(function(result) {
		if(result.result){
			location.href="/blog/"+result.url;
			window.alert("삭제가 완료되었습니다.");
		}else{
			window.alert("포스트 삭제에 실패하였습니다.");
		}
	});
	
}



function delchk(){
    if(confirm("포스트를 삭제하시겠습니까?")){
    	
    	$.post({
			url : "/postdelete.mt",
			data : {
				"num" : "${post.NUM }",
				"url" : "${post.URL}"
			}
		}).done(function(result) {
			if(result.result){
				location.href="/blog/"+result.url;
				window.alert("삭제가 완료되었습니다.");
			}else{
				window.alert("포스트 삭제에 실패하였습니다.");
			}
		});
		
        return true;
    } else {
        return false;
    }
};



</script>