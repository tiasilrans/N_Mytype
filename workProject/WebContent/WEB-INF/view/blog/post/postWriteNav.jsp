<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-default navbar-me">
			<div class="navbar-header">
				<a class="navbar-toggle" style="float: left; border: 0px;"> <span
					class="glyphicon glyphicon-menu-left"></span></a>  
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#postNav"> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> 
				</button>
			</div>		
			
			<div class="collapse navbar-collapse" id="postNav">
				<ul class="nav navbar-nav">
					<li class="back" style="margin-left: 200px; margin-top: 4px;"><a href="/blog/${map.url }" style=" margin-right: 0px;"><i class="material-icons">keyboard_backspace</i></a>
					<li class="home" style="margin-right: 15px;"><a href="/" style=" margin: 0px; padding-left:0px; background-image: none; background-color: rgba( 255, 0, 0, 0 );"><span><img
								src="/images/mytype.png"></span></a>
						 
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li style="margin-right: -25px; margin-top: 13px;"><a class="bnt dropdown-toggle" data-toggle="modal"
						data-target="#modalPublish"><span>발행</span></a></li>
					<li style="margin-right: 220px; margin-top: 13px;"><a class="bnt dropdown-toggle" data-toggle="modal"
						data-target="#modalPublish"><span><i class="material-icons">keyboard_arrow_down</i></span></a></li>
				</ul>
			</div>    
		</div> 
		
		
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
</script>  