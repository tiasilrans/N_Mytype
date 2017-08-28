<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:getAsString name="title"/></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>
body {
  font-family: 'Poppins', sans-serif;
  font-size: 16px;
  letter-spacing: .5px;
}
h1 {
  font-family: 'Roboto Condensed', sans-serif;
  text-transform: uppercase;
  font-weight: 700;
}
header {
  position: relative;
  background-size: cover;
  background-color: #7d6060;
  background-position: center;
  padding-top: 300px;
  padding-bottom: 300px;
}
.overlay {
  position: absolute;
  top: 0px;
  width: 100%;
  height: 100%;
  background-color: #e6e6e6;
}
.navbar {
  position: absolute;
  width: 100%;
  top: 0px;
  margin-bottom: 0px;
  border-radius: 0px;
  background-color: transparent;
  border: transparent;
  -webkit-transition: all ease-in-out 0.4s;
  -moz-transition: all ease-in-out 0.4s;
  -o-transition: all ease-in-out 0.4s;
  transition: all ease-in-out 0.4s;
}
.navbar-default .navbar-nav > li > a:hover {
  color: #fff;
  background-color: transparent;
}
.navbar-nav > li > a {
  text-transform: uppercase;
  line-height: 42px;
  -webkit-transition: all ease-in-out 0.4s;
  -moz-transition: all ease-in-out 0.4s;
  -o-transition: all ease-in-out 0.4s;
  transition: all ease-in-out 0.4s;
}
.navbar-default .navbar-nav > li > a {
  color: #fff;
  font-size: 13.5px;
}
.navbar-brand {
  padding: 17px 15px;
}
.navbar-brand img {
  width: 200px;
}
.shrink-nav {
  color: #000 !important;
  top: 0px;
  background-color: #fff;
  position: fixed;
}
.shrink-nav .navbar-nav > li > a {
  color: #000 !important;
  line-height: 24px;
}
@media (max-width: 767px) {
  .navbar-nav > li > a {
    line-height: 20px;
  }
  .navbar-brand {
    padding: 7px 15px;
  }
  .navbar-brand img {
    width: 144px;
  }
}

 .navbar-form {
  margin:0;
  margin-top: 5px;
  padding:8px 0px;
}
 
.navbar-form .search-box {
  border:0px;
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
	  width:260px;
	  height:32px;
	}

}

</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<nav>
		<tiles:insertAttribute name="nav"/>
	</nav>
	<section style="min-height: 70%;">
		<tiles:insertAttribute name="section"/>
	</section>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	</div>
</body>
</html>