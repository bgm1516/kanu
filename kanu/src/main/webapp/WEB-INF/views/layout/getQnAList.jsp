
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAyZBKjikZfpLTUa_ilFIa0Re-x9b9kB-0&callback=initMap"
        async defer></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript">
      function initialize() {
        var mapLocation = new google.maps.LatLng('35.870850', '128.589454'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('35.870850', '128.589454'); // 마커가 위치할 위도와 경도

        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: 'kanu cafe' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "★kanu cafe★"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>
<style>
#map-canvas {
margin:0 auto;
}

</style>
</head> 
 

<body>
<div>
<article class="container" >
 
		
		<H2 align="center">찾아오시는 길</H2>
		<HR>
		
		<section id="map-canvas" style="width: 550px; height: 550px" ></section>
		<br>
	 
		
		
		 
		<section id="container2" style="padding:10px;">
		<pre>
		<HR>
		<b>■ 대중교통 ■</b>
		
		◎버스 - 곽병원(앞1, 앞2, 건너) 156, 309, 425, 508, 521, 600, 623, 724, 909, 939, 급행1, 급행3, 동구2<br>
 		만경관(앞, 건너) 323, 400, 400-1, 427, 939, 동구2, 북구3 	호텔아미고 뒤 651, 653 <br>
		◎지하철과 도보 - 지하철 1호선 중앙로역 (지하철 출구가 아닌 대현프리몰1번 출구로 나와서 곽병원 방면 대로로 400미터, 약 도보로 5분) <br>
		※ 주차장이 따로 마련되어 있지 않으니 대중교통을 이용해주세요<br>
		
		대구광역시 중구 국채보상로 537 (수동 1-6번지)5층, 곽병원과 만경관 사이  T. 053 421 2460</pre>
 	</section>
</article>
</div>
</body>
</html>