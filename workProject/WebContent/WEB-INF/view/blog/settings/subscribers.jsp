<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
@media (min-width: 576px)
.modal-sm {
    max-width: 25rem;
}
@media (min-width: 576px)
.modal-dialog {
    max-width: 35rem;
    margin: 2rem auto;
}

.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
   
}
</style> 
<section class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="subscriber-list">					
					<!-- 구독자 리스트 -->
				<c:choose>
				<c:when test="${list ne '' }">
				<c:forEach var="obj" items="${list }">
					<div class="subscriber" style="padding: 1rem 1.75rem;">
						<a class="list-group-item media" data-toggle="modal" data-target="#sub-info" data-image="https://cdn.postype.com/assets/img/avatar/avatar_yellow.png" data-title="${obj.EMAIL }">
                            <div class="media-left">
                            	<img class="user-avatar" src="https://cdn.postype.com/assets/img/avatar/avatar_yellow.png" alt="${obj.EMAIL}">
                            </div>
                            <div class="media-body" style="vertical-align: middle;">
                                <div class="media-title text-truncate">${obj.EMAIL}</div>
                                <div class="media-text text-truncate"></div>
                            </div>
                        </a>
					</div>
				</c:forEach>
				</c:when>
				</c:choose>
				</div>
				<div class="pagination">
					
				</div>
			</div>
		</div>
	</div>
</section>


<!-- 모달 -->
<div class="modal fade" id="sub-info" role="dialog">
	<div class="modal-dialog modal-sm" role="document" >
        <div class="modal-content">
            <div class="modal-body text-center">
                <img class="user-avatar-lg my-2" id="modal-user-avatar" src="https://cdn.postype.com/assets/img/avatar/avatar_yellow.png">
                <h5 class="modal-title" id="modal-user-nickname">박소라</h5>
                <div class="small" id="modal-user-bio"></div>
                <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
                    <i class="mi mi-sm" aria-label="닫기"></i>
                </button>
            </div>
            <div class="modal-body" id="modal-user-blog-container" style="">
                <h6 class="small">참여중인 블로그</h6>
                <div id="modal-user-blog-list"><a class="media-profile modal-user-item modal-user-link" href="https://ryuhwi.postype.com">
                        <img class="blog-avatar modal-user-blog-image" src="https://cdn.postype.com/assets/img/avatar/blog_blank_r.png" alt="">
                        <div class="media-body">
                            <div class="media-title text-truncate modal-user-blog-title">test</div>
                            <div class="media-text text-truncate modal-user-blog-description">테에스트</div>
                        </div>
                </a></div>
            </div>
        </div>
    </div>
</div>









