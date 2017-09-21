<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/blogViewcss.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

.box {
	border: 1px solid;
	border-color: #d9d9d9;
	width: 100%;
	padding: 30px;   
	border-radius: 10px;  
}

#app-menu-toggler:hover {
    box-shadow: 0 0 0 1px rgba(0,0,0,.15), 0 5px 10px 0 rgba(0,0,0,.05), 0 10px 20px 0 rgba(0,0,0,.05);
}

#app-menu-toggler {
    z-index: 1060;
    padding: 8px;
    border: 0;
    background-color: #fff;
    box-shadow: 0 0 0 1px rgba(0,0,0,.15);
}

.btn-secondary:hover, .btn-secondary.focus, .btn-secondary:focus {
    color: #303030!important;
    background-color: #f5f5f5;
    border-color: #e5e5e5;
}

.btn-secondary:hover {
    color: #373a3c;
    background-color: #e6e6e6;
    border-color: #adadad;
}

.btn{
	padding: 0px;
}

#app-menu-container {
    position: fixed;
    right: 16px;
    bottom: 16px;
    z-index: 1050;
}

 #app-menu {
    display: none;
    position: fixed;
    z-index: 1050;
    bottom: 48px;
    right: 0;
    width: 100%;
    max-width: 288px;
    max-height: 700px;
    margin: 16px 16px 30px 16px;
    overflow-y: auto;
    border: 0;
    border-radius: 3px;
    background-color: #fff;
    box-shadow: 0 0 0 1px rgba(0,0,0,.05), 0 5px 10px 0 rgba(0,0,0,.05), 0 10px 20px 0 rgba(0,0,0,.05);
}


 a:link { color: white; text-decoration: none;}
 a:visited { color: white; text-decoration: none;}
 a:hover { color: white; text-decoration: none;}

.post-body{
	background-color:white;
	width: 100%;
	padding-top: 0px;
    padding-right: 20px;
    padding-bottom: 20px;
    padding-left: 40px;    
}   
 
.ft {
	background-color:white;
	width: 100%;
	padding-top: 20px;
    padding-right: 20px;
    padding-bottom: 20px;
    padding-left: 20px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	margin-bottom: 40px;
}


.div-pagination a {
    color: #0d0d0d;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}


.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #0d0d0d;
    border-color: #ffffff;
}

.div-pagination a:hover:not(.active) {background-color: #333333; color: white;}

.srbox {
	border: 1px solid;
	border-color: #d9d9d9;
	width: 60%;
	padding: 0px;     
}

.post-header{
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background-color:white;
	padding: 10px 10px 0px 10px;
	height: 50px; 
	
}

.nav-link:hover{
	border-left: 1px solid;
	border-left-color: red;
	

}


</style>  

<div class="row" align="center" style="padding-top: 50px;">
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
	<c:if test="${searchMode}">
			<div class="search-result srbox" align="left" style="padding: 1.75rem; margin-top: .5rem; margin-left: -550px; margin-bottom: 40px;">
				<div style="font-size: 12; font-family: sans-serif; color: #999999;">검색결과</div>
				<div style="font-size: 20; font-family: sans-serif;">${keyword }</div>
			</div>
		</c:if>
		<div class="row">
		<c:choose>
			<c:when test="${list ne null }">
				<div class="col-xs-8 col-lg-8 blog-post-list" align="left">
					<div class="blog-post-list">
						<c:forEach var="obj" items="${list }">
						<header class="post-header">
							<c:if test="${obj.NOTICE}">								
								<img src="/images/notice.png">								
							</c:if>
							</header>
							<div class="post-body">
								<a href="/${obj.URL }/post/${obj.NUM}" style="color: #0d0d0d;">
									<h2 style="color: black; font-family: sans-serif; font-size: 20px; margin: 0px;">${obj.TITLE }</h2>								
									<div class="subtitle" style="margin-top: -10px; margin-left: 3px;"> 
										<h3 style="color: #0d0d0d; font-family: sans-serif; font-size: 13px;">${obj.SUBTITLE }</h3> 
									</div>								  
									 <div class="fcountent" style="margin-top: 20px; margin-left: 3px; color: #808080;">
										${obj.FCONTENT }
									</div>
								</a>
							</div>      
							<div class="ft">
								   <div class="media">
								    	<div class="media-left">
										 	<div class="media-left" style="vertical-align: middle;">
										 		<img src="/images/avatar_yellow.png" class="media-object" style="width:45px; border-radius: 30px; width: 18px; height: 18px; margin-top:3px;">
										 	</div> 
										  	<div class="media-body"> 
										  		<span style="font-size: 12px; color: black;">닉네임</span>										 	
										  		<span style="font-size: 12px; color: #808080;">
										  		<fmt:formatDate value="${obj.PDATE }" pattern="yyyy.MM.dd"/></span>
										 	</div>
									  </div>
									  <div class="media-right" style="width: 100px;">
										  <div class="media-left">
										  		<div class="like">									
										 			<a href="#" onclick="like(this);" post-num="${obj.NUM }"><i class="material-icons" style="font-size: 15px; color: #808080; float: left;">favorite_border</i></a>
										 		</div>
										 		<div class="media-body"> 
										 			<span style="color: #808080; font-size: 12px; margin-left: 2px;">${obj.likeCount }</span>
										 		</div>
										  </div>
											<div class="media-left" >
											 	<i class="material-icons" style="font-size: 15px; color: #808080; float: left;">chat_bubble_outline</i>
											 	<div class="media-body">
											 		<span style="color: #808080; font-size: 12px; margin-left: 2px;">${obj.replyCount }</span>
												</div>
											</div>
										</div>						
								</div>
							</div>
						</c:forEach>				
					</div>  
					<div class="div-pagination" style="text-align: center;" > 
							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${pNum }">				
									<li class="active"><a href="/blog/${map.URL }?p=${i }">${i }</a>		
								</c:forEach>
							</ul> 
					</div>
				</div>
			</c:when>
			<c:otherwise>			
				<c:if test="${sessionScope.login eq map.EMAIL }">
				<div class="col-xs-8" align="left" style="color: black;">
				발행한 포스트가 없습니다.<br /> <br />
					<form action="/blog/postWrite" method="post">
						<input type="hidden" name="mode" value="new"/>
						<input type="hidden" name="title" value="${map.TITLE }"/>
						<input type="hidden" name="url" value="${map.URL }"/>
						<button class="button button1" type="submit" title="새 포스트를 작성합니다.">새 포스트 쓰기</button>
					</form>
				</div>
				</c:if>				
			</c:otherwise>
		</c:choose>
			
			
			<div class="col-xs-4 col-lg-4">

				<section class="section box">
					<div class="form-group" align="left" style="margin-bottom: -15px;">
						<form class="search" aria-labelledby="search-toggler"
							role="search" action="/blog/${map.URL }/search" method="get">
							<input class="form-control form-control-sm search-input"
								type="search" name="keyword" value="" data-action="grow"
								placeholder="검색어를 입력해 주세요">
							<button type="submit" class="btn btn-search">
								<i class="glyphicon glyphicon-search" style="color: #999"></i>
							</button>
						</form>
					</div>
				</section>

				<section class="section box">
					<div class="media">
						<div class="media-body" align="left">
							<h4 class="media-heading" style="color: black; font-family: sans-serif; font-size: 15px;">${map.TITLE }</h4>
						 	<div style="color: #a6a6a6;">          
								<span style="font-size: 12px;">구독자</span> <span style="font-size: 12px;">0</span> <span style="font-size: 12px;">포스트</span> <span style="font-size: 12px;">${map.totalPostCnt }</span>
							</div>
							<c:if test="${sessionScope.login ne map.EMAIL }">
							<c:choose>
							<c:when test="${subCk.ADDRESS ne map.URL }">
								<a href="#" onclick="subscribe();" id="s-bt"><button class="button button1 subscribe-bt" style="margin-top: 10px;">구독하기</button></a>
							</c:when>
							<c:otherwise>	
								<a href="#" onclick="cancel();" id="s-cbt"><button class="button button1 subscribe-cbt" style="margin-top: 10px;">구독취소</button></a>
							</c:otherwise>
							</c:choose>
							</c:if>
						</div>
						<div class="media-right">
							<img
								src="${imgPath }"
								class="media-object" style="width: 60px; height:60px; overflow: hidden; border-radius: 8px;">      
						</div>
					</div> 
				</section>


				<section class="section box">
					<div class="form-group" style="font-family:sans-serif;">
						<h6 align="left" style="color: black;">카테고리</h6>
						<ul class="Kategorie nav row">
							<li class="Kategorie nav-item"><a class="Kategorie nav-link"
								href="/blog/${map.URL }" style="color: black; font-weight :light;" align="left">
									전체 보기 <span class="post-count">${map.totalPostCnt }</span>
							</a></li>
							<c:forEach var="obj" items="${category }">
							<c:if test="${obj.CATEGORY_NAME ne \"전체 보기\"}">
							<li class="Kategorie nav-item"><a class="nav-link" href="/blog/${map.URL }/category/${obj.CATEGORY_NAME}"
								style="color: #8c8c8c;" align="left">${obj.CATEGORY_NAME }<span
									class="post-count"> ${obj.cnt }</span></a></li>
							</c:if>
							</c:forEach>

						</ul>
					</div>
				</section>
			</div>
			
			<div id="app-menu-container">
			    <button id="app-menu-toggler" class="btn btn-secondary" type="button">
			       <img src="/images/button.png" width="40px;" height="40px;">
			    </button>		    
			</div>
			
		</div>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>

 <div id="app-menu" style="display: none;">
 	<div>
 		<div>
 			<div class="menu-header">
 				<div class="col-xs-8 px-0" style="margin-bottom: 5px; margin-top: 20px;">
 					<a href="/blog/${map.url }"><img src="/images/avatar_yellow.png" style="border-radius: 50%; height: 32px; width: 32px;"><span style="margin: 10px; font-weight: bold; color:#262626; text-decoration:none;">사용자 이름</span></a> 					 
 				</div>
 				<div class="col-xs-2 px-0" style="margin-top: 23px;">
 					<span><i class="material-icons" style="color: #005ce6; font-size: 26px;">notifications_none</i></span> 
 				</div> 				
 				<div class="col-xs-2 px-0" style="margin-top: 23px;">
 					<a href="/logout.mt"><i class="material-icons" title="로그아웃" style="color: #a6a6a6; font-size: 26px;">power_settings_new</i></a>
 				</div> 				
 				<div class="col-xs-8 px-0" style="margin : 5px; margin-top: 10px;">
 					<a class="home" href="/"
						id="home"><label class="material-icons" style="color: #66a3ff; font-size: 25px; float: left; margin-top: -3px;">home</label></a><a href="/"><div class="home" style="display:inline; margin-left: 14px; color: #1a1a1a; text-decoration:none;">홈</div></a>
 				</div> 				      
 				<div class="col-xs-8 px-0" style="margin : 5px; margin-top: 10px;">
 					<c:choose>
	 					<c:when test="${sessionScope.login eq map.EMAIL }">
							<form action="/blog/postWrite" method="post">
								<input type="hidden" name="mode" value="new"/>
								<input type="hidden" name="title" value="${map.TITLE }"/>
								<input type="hidden" name="url" value="${map.URL }"/>
								<button type="submit" title="새 포스트를 작성합니다." style="border: 0px; background-color: white; padding-left: 0px; ">
									<a class="newpost" href="/blog/postWrite" id="newpost">
									<label class="material-icons" style="color: #66a3ff; font-size: 25px; float: left; margin-top: -3px;">mode_edit</label></a>
									<a href="/blog/postWrite">
									<div class="newpost" style="display:inline; margin-left: 14px; color: #1a1a1a; text-decoration:none;">새 포스트 쓰기</div></a>
								</button>
							</form>
	 					</c:when>
	 					<c:otherwise>
	 						<label class="material-icons" style="color: #66a3ff; font-size: 25px; float: left; margin-top: -2px;">check_circle</label> <div class="home" style="display:inline; margin-left: 14px;">구독</div>
	 					</c:otherwise>
 					</c:choose>
 				</div>
 				<div class="col-xs-8 px-0" style="margin : 5px;  margin-top: -5px;"> 				
 					<a href="/my/home"><label class="material-icons" style="color: #66a3ff; font-size: 25px; float: left; margin-top: -3px;">dashboard</label></a>
 					<a href="/my/home"><div class="myhome" style="display:inline; margin-left: 14px; color: #1a1a1a; text-decoration:none;">내 블로그 설정</div></a>
 				</div> 				       
 			</div> 
 			
 			 
 		</div>
 	</div>
 </div>
  
<script>
	// disply
	function like_change(target) {	
		if(target.css("display") == "none"){   
			target.css("display", "block");        
		} else {  
			target.css("display", "none"); 
		}	
	};


	//app-menu-disply
	$("#app-menu-toggler").on("click", function(){
		var menu = $("#app-menu");
		if(menu.css("display") == "none"){
			menu.css("display", "block");
		}else{
			menu.css("display", "none");
		}
		
	});
	
	//subscribe-bt
	function subscribe(){
    if(confirm("이 블로그를 구독하시겠습니까?")){    	
    	$.post({
			url : "/subscribe/subscribe.mt",
			data : {
				"url" : "${map.URL}"
			}
		}).done(function(result) {
			if(result.result){
				window.alert("구독 목록에 추가되었습니다.");
				location.reload();
			}
		});
		
        return true;
	    } else {
	        return false;
	    }
	};
	
	
	//subscribe-cbt
	function cancel(){
    if(confirm("이 블로그를 구독취소 하시겠습니까?")){    	
    	$.post({
			url : "/subscribe/cancel.mt",
			data : {
				"url" : "${map.URL}"
			}
		}).done(function(result) {
			if(result.result){
				window.alert("구독취소 되었습니다.");
				location.reload();
			}
		});
		
        return true;
	    } else {
	        return false;
	    }
	};
	
	//like
	function like(obj) {
		var num = $(obj).attr('post-num');
		$.post({
			url : "/like.mt",
			data : {				
				"num" : num
			}
		}).done(function(result) {
			if(result.result){
				location.reload();
			}
		});
		
	};
	

	
	

</script>
								