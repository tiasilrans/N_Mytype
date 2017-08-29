<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.box{
		border: 1px solid;
		border-color: black;
		margin: 20px;
		width: 170%;
		height: 10%;
		padding: 20px;
}

       #custom-search-form {
        margin:0;
        margin-top: 5px;
        padding: 0;
    }
 
    #custom-search-form .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    #custom-search-form button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }
</style>  


<div class="col-xs-0 col-md-2"></div>
<div class="col-xs-12 col-md-8">
 <div class="container">

 
            <div class="float-left" style="float: left;">
                        
               	발행한 포스트가 없습니다.
               	
             	<br/>
                <a class="btn" href="">새 포스트 쓰기</a>
            </div>
        

        <div class="float-right" style="float: right;">
        
            <section class="section search">
           	 <div class="form-group box">	   
               <div class="container">
				<div class="row">
			        <div class="span12">
			            <form id="custom-search-form" class="form-search form-horizontal pull-right">
			                <div class="input-append span12">
			                    <input type="text" class="search-query" placeholder="Search">
			                    <button type="submit" class="btn"><i class="icon-search"></i></button>
			                </div>
			            </form>
			        </div>
	</div>
</div>
             </div>  
            </section>

            <section class="section blog-info">
                   <div class="form-group box">	   
                   	info
                   </div>   
            </section>

            <section class="section categories">
                    <div class="form-group box">	   
                   	카테고리
                   </div>  
            </section>

      </div>
   </div>
</div>
	
	<div class="col-xs-0 col-md-2"></div>