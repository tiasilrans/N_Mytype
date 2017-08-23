<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2>구글 맵</h2>
<div id="map" style="width:80%; height: 50%;"></div>
    <script>
      function initMap() {
        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.496675, lng: 127.030026},
          zoom: 8
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=   AIzaSyBKcYLPa1l7l4z6xT_iqVpUaFcLp_0vsAA   &callback=initMap"
    async defer></script>