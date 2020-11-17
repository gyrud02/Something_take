<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!------------------------------- Top [상단 영역] ------------------------------------>
<tiles:insertAttribute name="header"/>
<!------------------------------- Top [상단 영역] ------------------------------------>

</head>
<!-------------------------------------- HEAD [헤드 영역] ------------------------------------------>


<!-------------------------------------- BODY [본문 영역] ------------------------------------------>
<body data-spy="scroll" data-target=".navbar-collapse">


<!------------------------------- preload [미리보기 영역] ----------------------------->

	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_f"></div>
			</div>
		</div>
	</div>

<!------------------------------- preload [미리보기 영역] ----------------------------->

	
<!------------------------------- content [본문 영역] ------------------------------------>
<tiles:insertAttribute name="body"/> 
<!------------------------------- content [본문 영역] ------------------------------------>


<!------------------------------- 지도 script [API 영역] -------------------------->
	
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/gmaps.min.js"></script>

	<script>
		function showmap() {
			var mapOptions = {
				zoom: 8,
				scrollwheel: false,
				center: new google.maps.LatLng(-34.397, 150.644),
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			$('.mapheight').css('height', '350');
			$('.maps_text h3').hide();
		}

	</script>
	
<!------------------------------ 지도 script [API 영역] -------------------------->


<!------------------------------- bottom [하단 영역] ------------------------------>
<tiles:insertAttribute name="footer"/>
<!------------------------------- bottom [하단 영역] ------------------------------>


</body>
<!-------------------------------------- BODY [본문 영역] ------------------------------------------>

</html>