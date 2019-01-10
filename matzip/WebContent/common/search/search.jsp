
<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<meta charset="UTF-8" />

<%@ include file="/common/header.jsp"%>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
</head>
<!-- 맵 크기 자동형 -->
<style>  
.nanum{
  font-family: 'Do Hyeon', sans-serif;
}
.noto{
  font-family: 'Noto Sans KR', sans-serif;
}
html, body, #map {
    width: 100%;
    height: 90%;
    margin: 5;
    margin-botton:10px;
    padding-arg: 5;
    0px;
}
#map {
    position: relative;
}

.findMap{
    position: relative;
    float: left;
    width: 329px;
    height: 309px;
    background: url(/image/restaurant/teste_rest/bg_findmap_15.gif) no-repeat;
}

.wrapper {

    display: grid;
    grid-template-columns: 200px 100px;
    grid-template-rows: 40px 100px;
}

.header {
   grid-column: span 12;
}

.menu {
   gride-column: span 4;
}

.content{
   grid-column: span 9;
}

</style>
<br><br><br><br><table><td>
<div id="map" style="width:1710px;height:400px;" align="center"></div><br><br>
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
</td>
	</table>

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
			<s:param name="filter_address">
				<s:property value="filter_address" />
			</s:param>
			<s:param name="filter_category">
				<s:property value="filter_category" />
			</s:param>
			<s:param name="keyword">
				<s:property value="keyword" />
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
            content: '<s:a href="%{viewURL}"><div style="width:150px;text-align:center;padding:6px 0;"><s:property value="restaurantName"/></div></s:a>'
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

<table class="table table-condensed">

    <td width="200">
    	<s:if test="isPower == 1">
         <p class="nanum" style="color: #64AFCB;"><small>*PowerLink*</small></p>
    	</s:if>
    
    <s:a href="%{viewURL}">
    	<h2><s:property value="restaurantName" /></h2>
    	<s:property value="restResultClass.restaurantName" /></s:a>
    	<p class="nanum" style="font-size: 14pt">
    	&nbsp;&nbsp;★:<s:property value="starPoint"/>&nbsp;&nbsp;<br>
    	&nbsp;&nbsp;<small><s:property value="category"/></small><br>
    	&nbsp;&nbsp;<s:property value="address"/>
    	<p class="noto" style="font-size: 15pt">
    	<table class="table table-bordered">
    	<td width="100" height="100" >
    	&nbsp;&nbsp;<s:property value="context"/></p></td></table></td>

    	</table>

    <input type="hidden" value="<s:property value="restaurantNo"/>" name="restaurantNo" id="restaurantNo"/>
    <input type="hidden" id="ID" name="ID" value="${session.ID }" />
    <%-- <s:if test="session.ID!=null">
    <button type="button" name="confirm_id" onclick="registerLikes();">좋아요</button> --%>	
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
