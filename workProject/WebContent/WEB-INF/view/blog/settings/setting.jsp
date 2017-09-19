<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="main">
	<div class="container">
		<div class="row">
			<form action="/blogSetting.mt" method="post" enctype="multipart/form-data">
				<!-- 블로그 정보 -->
				<div class="blog-info">					
					<div class="col-lg-8">
						<h5 style="font-weight: 400; font-size: 1.125rem;">블로그 정보</h5>
						<!-- 블로그 아바타 폼 -->
						<div class="form-group mb-4">
                                <label class="form-label-sm">블로그 아바타</label>
                                <div class="media">
                                	<div class="media-left">
                                    	<img class="blog-avatar-lg d-flex" id="profile-img" 
                                    	style="vertical-align: middle; width: 4rem; height: 4rem;" src="${imgPath }">
                                    </div>
                                    <div class="media-body">
                                        <div class="form-control">
                                            <label class="sr-only" for="upload-profile-photo">파일 선택</label>                              
                                            <input type="hidden" name="target_url" value="${url }">
                                            <input class="form-control-file col-12 px-0" id="upload-profile-photo" type="file" name="file" aria-describedby="fileHelp">
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <small class="form-text text-muted mb-0" id="fileHelp">최대 5MB의 이미지 파일</small>
                                            </div>
                                            <div class="col-sm-3 text-sm-right form-text mb-0">
                                                <button class="btn btn-link text-muted" type="button" id="btn-delete-profile-photo">이미지 삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         </div>
                         <!-- 블로그 제목 -->
                         <div class="form-group mb-4">
                         	<label>블로그 제목</label>
                         	<input class="form-control" id="blog-title" name="title" value="Now Playing..." placeholder="블로그 제목">
                         </div>
                         <!-- 블로그 소개 -->
                         <div class="form-group mb-4">
                         	<label>블로그 소개</label>
                         	<textarea class="form-control autosize" id="blog-bio" name="info" placeholder="블로그 소개" data-autosize-on="true" style="overflow: hidden;
                         	word-wrap: break-word; height: 60px;"> Now Playing... Nowaki의 블로그!</textarea>
                         </div>
                         <!-- 블로그 URL -->
                         <div class="form-group mb-4">
                                <label class="form-label-sm" for="blog-url">블로그 URL</label>
                                <div class="input-group input-group-transparent">
                                    <input class="form-control" id="blog-url" name="url" value="${url }" placeholder="블로그 URL">
                                </div>
                                <small class="form-text">영문 소문자, 숫자, 대시(-)를 조합하여 6자 이상으로 만들 수 있습니다. (대시는 문장 가운데에만 입력 가능합니다.)</small>
                         </div>
					</div>
					<div class="col-lg-8">
						<button type="submit" class="btn" id="sb">변경사항저장</button>
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












