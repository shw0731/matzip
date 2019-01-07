
<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<meta charset="UTF-8" />

<%@ include file="/common/header.jsp"%>

<!-- 맵 크기 자동형 -->
<style>  
html, body, #map {
    width: 100%;
    height: 90%;
    margin: 0;
    padding-top: 5
    0px;
}
#map {
    position: relative;
}
</style>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82957f9de3f5badbdcfb736f5cc155ac&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
    	center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    		level: 3 // 지도의 확대 레벨
		};  
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		var tmp;
		
	</script>
	<br>

<!-- list 첫번째 예 -->

<ul class="list-unstyled">
<!-- 슬라이드 -->
<s:iterator value="restList" status="stat">

		<s:url id="viewURL" action="PageViewAction" >
			<s:param name="restaurantNo">
				<s:property value="restaurantNo" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		<script>
		
		
		
		
		geocoder.addressSearch('<s:property value="address"/>', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><s:property value="restaurantName"/></div>'
        });
        infowindow.open(map, marker);
      	//1등위치 기준
        if('<s:property value="#stat.index"/>'=='0'){
    	 tmp = coords;
        }
       map.setCenter(tmp);
    } 
}); 
</script>
		
	
	
		
  <li class="media">
    <div id="carousel<s:property value="#stat.index"/>" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" >
      <img  class="d-block img-thumbnail" style="width: 400px; height: 300px;" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[0]"/>" alt="First slide">
    </div>
    <div class="carousel-item" >
      <img class="d-block img-thumbnail" style="width: 400px; height: 300px;" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[1]"/>" alt="Second slide">
    </div>
    <div class="carousel-item" >
      <img class="d-block img-thumbnail" style="width: 400px; height: 300px;" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[2]"/>" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carousel<s:property value="#stat.index"/>" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel<s:property value="#stat.index"/>" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <div class="media-body">
    
    <s:a href="%{viewURL}">
    	<h2><s:property value="restaurantName" /></h2><br>
    	평점:<s:property value="starPoint"/>&nbsp;&nbsp;좋아요: <s:property value="likes"/><br>
    	주소:<s:property value="address"/>&nbsp;&nbsp;음식종류:<s:property value="category"/><Br>
    	가게 설명:<s:property value="context"/>
    
    </s:a>
    	
  	
    </div>
  </li>


  <br>
  </s:iterator>
  
  <div align="center">
    		<div colspan="5"><s:property value="pagingHtml"  escape="false" /></div>
  </div>
</ul>


  
</body>
</html>