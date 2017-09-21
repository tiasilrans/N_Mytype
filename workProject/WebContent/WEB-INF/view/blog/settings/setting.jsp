<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.box {

	background-color:white;
	border-radius:10px;
	margin: 20px;
	width: 80%;
	padding: 20px;
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


</style>

<section class="main">
	<div class="container box" style="margin-left: 150px;">
		<div class="row" style="margin-left: 5px; margin-top: -8px;">
			<form action="/blogSetting.mt" method="post" enctype="multipart/form-data">
				<!-- 블로그 정보 -->
				<div class="blog-info">					
					<div class="col-lg-8">
						<h5 style="font-weight: 400; font-size: 18px; font-family: sans-serif; margin-bottom: 30px;">블로그 정보</h5>
						<!-- 블로그 아바타 폼 -->
						<div class="form-group mb-4" style="margin-bottom: 25px; margin-top: 25px;">
                                <label class="form-label-sm" style="font-family: sans-serif;">블로그 아바타</label>
                                <div class="media">
                                	<div class="media-left">
                                    	<img class="blog-avatar-lg d-flex" id="profile-img" 
                                    	style="vertical-align: middle; width: 7rem; height: 7rem; border-radius: 10px; " src="${imgPath }">
                                    </div> 
                                    <div class="media-body">
                                        <div class="form-control" style="margin-top: 3px;">
                                            <label class="sr-only" for="upload-profile-photo" style="font-family: sans-serif; font-size: 12px;">파일 선택</label>                              
                                            <input type="hidden" name="target_url" value="${url }">
                                            <input class="form-control-file col-12 px-0" id="upload-profile-photo" type="file" name="file" aria-describedby="fileHelp" 
                                            style="margin-top: -2px; color: black;">
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <small class="form-text text-muted mb-0" id="fileHelp" style="font-family: sans-serif; color: #999999; font-size: 12px; ">최대 5MB의 이미지 파일</small>
                                            </div>
                                            <div class="col-sm-3 text-sm-right form-text mb-0">
                                                <button class="btn btn-link text-muted" type="button" id="btn-delete-profile-photo" style="margin-left: 55px; font-family: sans-serif; color: #999999; font-size: 13px; ">이미지 삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         </div>
                         <!-- 블로그 제목 -->
                         <div class="form-group mb-4" style="margin-bottom: 25px; margin-top: 25px;">
                         	<label style="font-family: sans-serif;">블로그 제목</label>
                         	<input class="form-control" id="blog-title" name="title" value="Now Playing..." placeholder="블로그 제목" style="font-family: sans-serif;">
                         </div>
                         <!-- 블로그 소개 -->
                         <div class="form-group mb-4" style="margin-bottom: 25px; margin-top: 25px;">
                         	<label style="font-family: sans-serif;">블로그 소개</label>
                         	<textarea class="form-control autosize" id="blog-bio" name="info" placeholder="블로그 소개" data-autosize-on="true" style="overflow: hidden;
                         	word-wrap: break-word; height: 60px; resize: none; font-family: sans-serif;"> Now Playing... Nowaki의 블로그!</textarea>
                         </div>
                         <!-- 블로그 URL -->
                         <div class="form-group mb-4" style="margin-bottom: 25px; margin-top: 25px;">
                                <label class="form-label-sm" for="blog-url" style="font-family: sans-serif; width: 750px;">블로그 URL</label>
                                <div class="input-group input-group-transparent">
                                    <input class="form-control" id="blog-url" name="url" value="${url }" placeholder="블로그 URL" style="font-family: sans-serif; width: 665px; border-radius: 5px;">
                                </div>
                                <small class="form-text0" style="font-family: sans-serif; color: #999999;">영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다. (대시는 문장 가운데에만 입력 가능합니다.)</small>
                         </div>
					</div>
					<div class="col-lg-8" style="margin-left: -3px;">
						<button type="submit" class="button button1" id="sb">변경내용저장</button>
					</div>	
				</div>
			</form>
		</div>
	</div>
</section>

<script>
	$("#upload-profile-photo").on("change", function(){
		console.log(this.files[0]);
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profile-img").attr("src", e.target.result);
		}
		reader.readAsDataURL(this.files[0]);
		
	});
	
	


</script>

<c:if test="${r.rst }">
<script>

	window.alert("블로그 정보 변경했습니다.");

</script>
</c:if>












