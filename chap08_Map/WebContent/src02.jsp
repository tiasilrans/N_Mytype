<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2>javascript navigator</h2>
<script>
	console.log(navigator.geolocation);	// 사용자 위치정보를 담고 있는 객체.
	navigator.geolocation.getCurrentPosition(function(e) {
		console.log(e);
		//var lat = e.coords.latitude;
		//var lng =e.coords.longitude;
		var lat = 37.496675;
		var lng = 127.030026;
		window.alert(lat+","+lng);
	});
</script>


