
<!DOCTYPE html>


<%@ include file="/common/header.jsp"%>

<!-- 맵 크기 자동형 -->
<style>  
html, body, #map {
    width: 100%;
    height: 90%;
    margin: 0;
    padding: 0;
}
#map {
    position: relative;
}
</style>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82957f9de3f5badbdcfb736f5cc155ac"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		var imageStr;
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
		
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
	<!-- 	<script>
		
		var str = '<s:property value="images"/>';
		var imageStr = str.split(",");
		for(var i = 0;i<imageStr.length;i++){
			id_test = document.getElementById('out'+i);
			
			id_test.src='<s:property value="restaurantNo"/>'+'/'+imagesStr[i];
			  
		}
		</script> -->
		
	
	
		
  <li class="media">
    <div id="carousel<s:property value="#stat.index"/>" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" >
      <img  class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[0]"/>" alt="First slide">
    </div>
    <div class="carousel-item" >
      <img class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[1]"/>" alt="Second slide">
    </div>
    <div class="carousel-item" >
      <img class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[2]"/>" alt="Third slide">
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
    <a class="btn btn-primary" data-toggle="collapse" href="#collapse<s:property value="#stat.index"/>b" role="button" aria-expanded="false" aria-controls="collapseExample">
    	<s:property value="context"/>
  	</a>
    </div>
  </li>
<!-- 상세보기 -->
<div class="collapse" id="collapse<s:property value="#stat.index"/>b">
  <div class="card card-body">
  
    <div id="carousel<s:property value="#stat.index"/>a" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[0]"/>" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[1]"/>" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/imgs/<s:property value="restaurantNo"/>/<s:property value="images.split(',')[2]"/>" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carousel<s:property value="#stat.index"/>a" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel<s:property value="#stat.index"/>a" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<s:property value="context"/>
</div>
</div>
  <br>
  </s:iterator>
  
  <div align="center">
    		<div colspan="5"><s:property value="pagingHtml"  escape="false" /></div>
  </div>
</ul>


  
</body>
</html>




 
 












