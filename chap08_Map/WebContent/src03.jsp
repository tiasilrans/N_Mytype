<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>Google Map API</h2>
일단 google map api 검색해서 사이트 접근후에, 지도를 띄울 영역을 설정하고,
<br />
미리 활성화된 영역에 나중에 그려지는거라서..사이즈가 있어야 함.
<h2>구글 맵</h2>
<div id="map" style="width: 80%; height: 50%;"></div>
<script>
	function initMap() {
		var pos = {
			"lat" : 37.498014,
			"lng" : 127.027400
		};
		var pos2 = {
			"lat" : 36.498014,
			"lng" : 127.027400
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : pos,
			"zoom" : 15
		});
		var marker = new google.maps.Marker({
			"map" : map,
			"position" : pos,
			"title" : 'Hello World!'
		});
		var marker2 = new google.maps.Marker({
			"map" : map,
			"position" : pos2,
			"title" : 'Hello World!'
		});
		
		
		
		var content = "이곳은 서대전네거리역이다! <br/> 지하철 타러 가자~";
		var infowindow = new google.maps.InfoWindow({
			"content" : content
		});
		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map, marker);
		});
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=   AIzaSyBKcYLPa1l7l4z6xT_iqVpUaFcLp_0vsAA   &callback=initMap"
	async defer></script>