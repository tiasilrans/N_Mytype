<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<style>	
body{
    margin: 0px;
    padding: 0px;
    min-height: 2500px;
    background-color: #f28281;
}
.navbar-info {
    width: 100%;
    
    
}
.fixed-me{
    transition: all 1s ;
}

.fixed-me{
    background-color:#fff !important;
    padding: 0px  !important;
    margin-bottom: 5px;
    position: fixed;
    top:0;
	z-index:888;
    width: 100%;
    border-bottom: 3px solid #e65100 !important;
    
}

.navbar-me {
    
   transition: all 1s ;
}
.header-right-menu{
 padding: 5px 15px !important;   
    
}
.site-logo{
    padding: 15px 20px !important; 
    margin: 15px 10px !important;
}
.navbar-me{
    padding: 10px 0px;
    background-color: transparent;
    top: 0px;
    border: 0px;
    border-radius: 0px;
}
.navbar-collapse{
    text-align: center;
    border-top-width: 0px;
    padding-top: 10px;
    margin-top: 5px;
}

.navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover {
    background-color: transparent;
}
.menu-collapsed-button{
    margin: 20px 15px 10px 15px !important;
}
</style>	
	
    <!--navbar menu-->
<section class="navbar-info">

<nav class="navbar navbar-default navbar-me">
  <div class="container-fluid ">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed menu-collapsed-button" data-toggle="collapse" data-target="#navbar-primary-collapse" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand site-logo" href="#">MyType</a>
    </div>
      
      <div class="collapse navbar-collapse navbar-right  header-right-menu" id="navbar-primary-collapse">
            <ul class="nav navbar-nav ">
            <li class="page-scroll">
                        <a class="header" href="javascript:" id="about-menu">About</a>
                    </li>
                    <li>
                        <a class="" href="javascript:" id="services-menu">Services</a>
                    </li>
                    <li>
                        <a class="" href="javascript:" id="Clients-menu">Clients</a>
                    </li>
                    <li>
                        <a class="" href="javascript:" id="contact-menu">Contact</a>
                    </li>
                    <li>
                        <a class="" href="javascript:" id="project-menu">Projects</a>
                    </li>
                </ul>
         </div><!-- /.navbar-collapse -->
  </div>
 </nav>
</section>
<!-- end of navbar-->

<script>
$(window).scroll(function() {
    if($(this).scrollTop()>5) {
        $( ".navbar-me" ).addClass("fixed-me");
    } else {
        $( ".navbar-me" ).removeClass("fixed-me");
    }
});

</script>
    