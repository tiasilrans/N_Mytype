<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.box{
		border: 1px solid;
		border-color: black;
		margin: 20px;
		width: 110%;
		height: 10%;
		padding: 20px;
}

 .navbar-form {
  margin:0;
  margin-top: 5px;
  padding:8px 0px;
}
 
.navbar-form .search-box {
  border:1px solid;
  height:35px;
  outline: none;
  width:320px;
  padding-right: 3px;
  padding-left: 15px;
  margin:4px;
  -webkit-border-radius: 22px;
  -moz-border-radius: 22px;
  border-radius: 22px;
}
 
.navbar-form button {
  border: 0;
  background: none;
  padding: 2px 5px;
  margin-top: 2px;
  position: relative;
  left: -34px;
  margin-bottom: 0;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
}
 
.search-box:focus + button {
  z-index: 3;   
}

@media (min-width: 768px) {
    .dropdown:hover {background-color: #000;}
	.dropdown:hover .dropdown-menu {
	  display: block;
	}
	.navbar-form {
	  padding:0px;
	}	
	.navbar-form .search-box {
	  width:200px;
	  height:32px;
	}

}



       
</style>  

<div class="row" align="center">
	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
 		<div class="row"> 
            <div class="col-xs-8 float-left" style="float: left;">                        
               	발행한 포스트가 없습니다.<br/>
                <a class="btn" href="">새 포스트 쓰기</a>
         	</div>
        	<div class="col-xs-4 float-right" style="float: right;">        
	            <section class="section search">
	           	 <div class="form-group box">	   
					<div class="row">
					        <div class="col-xs-12">
					            <form class="navbar-form navbar-right form-horizontal" role="search">
					              <div class="input-group">
					                 <input type="text" class="search-box" placeholder="Search">
					                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
					              </div>
					         	 </form>
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
</div>	


<div class="col-xs-0 col-md-2"></div>
<div class="col-xs-12 col-md-8">
<div class="container">


        <div class="float-right" style="float: right;">
        
             <section class="section blog-info">
                   <div class="form-group box">	   
                   	검색
                   </div>   
            </section>
            





