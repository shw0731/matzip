<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poor+Story"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>


}
body {
	font-family: Verdana, sans-serif;
	margin: 0
}

.mySlides {
	display: none
}

img {
	vertical-align: middle;
}
.nanu{
  font-family: 'Do Hyeon', sans-serif;
}
.Nanum{
font-family: 'Nanum Gothic Coding', monospace;
font-size: 13px;
}
.cute {
	font-family: 'Poor Story', cursive;
	font-size: 17px;
}

.Sunflower {
	font-family: 'Montserrat', sans-serif;
	font-size: 20px;
}
/* Slideshow container */
.slideshow-container {
	max-width: 700px;
	height: 500px;
	position: relative;
	margin: auto;
	padding-top: 100px
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

.max-small {
	width: auto;
	height: auto;
	max-width: 60px;
	max-height: 60px;
}
/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
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
</head>

<body>

	<div class="slideshow-container">

		<div class="mySlides">
			<div class="numbertext">1 / 3</div>
			<img style="width: 700px; height: 400px;"
				src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[0]"/>"
				style="width:100%">
			<div class="text">Caption Text</div>
		</div>

		<div class="mySlides">
			<div class="numbertext">2 / 3</div>
			<img style="width: 700px; height: 400px;"
				src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[1]"/>"
				style="width:100%">
			<div class="text">Caption Two</div>
		</div>

		<div class="mySlides">
			<div class="numbertext">3 / 3</div>
			<img style="width: 700px; height: 400px;"
				src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[2]"/>"
				style="width:100%">
			<div class="text">Caption Three</div>
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-lg-6 text-right">
			<div class="card w-100">
				<div class="card-body" style="text-align: left">

					<span style="font-size: 25pt" class="Sunflower"> <s:property value="restResultClass.restaurantName" /></span> &nbsp;<input
						name="Like" type="image" src="/img/logos/like.jpg" value="UP" class="inputb" onClick="registerLikes(<s:property value='restResultClass.restaurantNo'/>)" />
						<small><s:property value="restResultClass.likes" /></small>

					<p class="nanu" style="font-size: 13pt">
						<br />
						<s:property value="restResultClass.address" />
						<br /> &nbsp;
						<s:property value="restResultClass.category" />
						<br />


					</p>
					<p class="Sunflower">
					<table class="table table-bordered" style="width: 500px"
						align="center">
						<th><br> <s:property value="restResultClass.context" /><br>
							<br></th>
						</p>
					</table>
				</div>
			</div>
			</div>
			<div class="col-lg-6 text-right">
				<div id="map" align="center"></div><br><br>
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
			</div>
		</div>
	</div>

	<s:if test="%{#session.ID==restResultClass.ID}">
		<input name="list" type="button" value="수정" class="inputb"
			onClick="javascript:open_win_noresizable('modifyForm.action?no='<s:property value = "restresultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','modify')"/>
		<input name="list" type="button" value="삭제" class="inputb"
			onClick="javascript:location.href='deleteAction.action?no='<s:property value = "restresultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','delete'"/>
	</s:if>
	<Br>
	<!-- review -->
<div class="container">
		<div class="row">
		  
	<s:iterator value="reviewList" status="stat">
	
		<div class="col-lg-6 text-right">
		<div class="card">
			<div class="card-body" style="text-align: left">
				<span style="font-size: 20pt" class="Sunflower">
					&nbsp;&nbsp;<s:property value="subject" /></span><font color="848484">
			<s:property value="reg_date" /></font>
			
			<br/>
				<img style="width: 500px; height: 300px;"
					src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="reviewNo"/>/<s:property value="images"/>" 
					style="width:100%">
				<p class="nanum" style="font-size: 15pt"><small>
					<s:property value="context" /></small>
				</p>
				<p class="card-text">
					<s:property value="starPoint" />
				</p>

				<span style="font-size: 20pt" class="Sunflower">
				
				<s:if test="%{#session.ID==ID}">
					<a href='javascript:Modify(<s:property value="reviewNo"/>,<s:property value="restaurantNo"/>);' class="btn btn-link">수정</small>
						<s:param name="restaurantNo">
							<s:property value="restaurantNo" />
						</s:param> <s:hidden name="restaurantNo" value="%{restaurantNo}" /> <s:param
							name="reviewNo">
<%-- 							<s:property value="reviewNo" /> --%>
						</s:param> <s:hidden name="reviewNo" value="%{reviewNo}" /> </a>
					<form action="ReviewdeleteAction.action" method="post">
						<s:param name="reviewNo">
							<s:property value="reviewNo" />
						</s:param>
						<s:hidden name="reviewNo" value="%{reviewNo}" />
						<input class="btn btn-link" type="submit" value="삭제">
						
						</span>
						
		
			</form>
			</s:if>
			</div>
		</div>
	</div>
		
	</s:iterator>
	
</div>
</div>
	<s:if test="reviewList.size() <= 0">
				
	     
			등록된 게시물이 없습니다.
        
    		
	      </s:if>
	<Br>
	<s:if test="session.ID!=null">
<!-- 입력폼 -->
	<div class="container" align="center" >
    <form action="ReviewWriteAction.action" method="post" enctype="multipart/form-data" style="width:600px" >
   <!-- subject -->
      <s:hidden name="restaurantNo" value="%{restResultClass.restaurantNo}" />
      <s:hidden name="currentPage" value="%{currentPage}" />
    <div class="input-group input-group-lg"  >
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">제목</span>
        </div>
           <input name="subject" type="text" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
     <!-- starPoint -->
        <div class="input-group-prepend">
           <span class="input-group-text" id="basic-addon1">별점</span>
        </div>
           <input name="starPoint" type="text" class="form-control" placeholder="1~5" aria-label="Username" aria-describedby="basic-addon1">
   </div>
   
    <!-- context  -->
    <div class="input-group input-group-lg">
        <div class="input-group-prepend">
          <span class="input-group-text">내용</span>
        </div>
           <textarea name="context" class="form-control" aria-label="With textarea"></textarea>
     </div>
   <!-- upload file -->
    
            <s:file label="File" name="uploads" />
    
   <input name="submit" type="submit" value="작성완료" class="inputb">
   </form>
   </div>
   </s:if>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}

function Modify(reviewNo,restaurantNo){
	 var url="ReviewModifyForm.action?reviewNo="+reviewNo+"&"+"restaurantNo="+restaurantNo;
	 
		 open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
		 "scrollbars=no,resizable=no,width=550,height=350");
}


function registerLikes(restaurantNo){
	
	
	var url='RegisterLikeAction.action?restaurantNo='+restaurantNo;
	
	
	open(url, "좋아요 등록", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=600,height=200");
}
</script>


</body>
</html>

	<script>
		
		
		
		
		geocoder.addressSearch('<s:property value="restResultClass.address"/>', function(result, status) {
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
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><s:property value="restResultClass.restaurantName"/></div>'
        });
        infowindow.open(map, marker);
      
       map.setCenter(coords);
    } 
}); 
</script>

