<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 700px;
  height:500px;
  position: relative;
  margin: auto;
  padding-top:100px
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
  background-color: rgba(0,0,0,0.8);
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

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
</head>
<body>

<div class="slideshow-container">

<div class="mySlides">
  <div class="numbertext">1 / 3</div>
  <img style="width: 700px; height: 400px;" src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[0]"/>" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides">
  <div class="numbertext">2 / 3</div>
  <img style="width: 700px; height: 400px;" src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[1]"/>" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides">
  <div class="numbertext">3 / 3</div>
  <img style="width: 700px; height: 400px;" src="/imgs/<s:property value="restResultClass.restaurantNo"/>/<s:property value="restResultClass.images.split(',')[2]"/>" style="width:100%">
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>




<h3>	음식점명 :(<s:property value="restResultClass.category"/>)<s:property value="restResultClass.restaurantName"/></h3><br>

		별점 : &nbsp;<s:property value="restResultClass.starPoint"/>
		&nbsp;좋아요 : <s:property value="restResultClass.likes"/>


		<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
    <s:if test="%{#session.ID==restResultClass.ID}">
		<input name = "list" type = "button" value = "수정" class = "inputb" onClick = "javascript:open_win_noresizable('modifyForm.action?no='<s:property value = "resultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','modify')">
        <input name = "list" type = "button" value = "삭제" class = "inputb" onClick = "javascript:location.href='deleteAction.action?no='<s:property value = "resultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','delete'">
	</s:if>
	<Br>
	<!-- review -->
	<s:iterator value="reviewList" status="stat">
		<div class="card w-75">
  			<div class="card-body">
   				 <h5 class="card-title"><s:property value="subject" />dd</h5>
   				 <p class="card-text"><s:property value="context"/>dd</p>
   				 
    		<a href="#" class="btn btn-primary">동감</a>
  			</div>
		</div>
        		
        
	      </s:iterator>
			
	      <s:if test="reviewList.size() <= 0">
				
	     
			등록된 게시물이 없습니다.
        
    		
	      </s:if>
	 <Br>
	 <!-- 입력 폼 -->
	 <form action="ReviewWriteAction.action" method="post" enctype="multipart/form-data">
	<!-- subject -->
		<s:hidden name="restaurantNo" value="%{restResultClass.restaurantNo}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
	 <div class="input-group mb-3">
  		<div class="input-group-prepend">
    		<span class="input-group-text" id="basic-addon1">제목</span>
  		</div>
  			<input name="subject" type="text" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
  	<!-- starPoint -->
  		<div class="input-group-prepend">
  			<span class="input-group-text" id="basic-addon1">별점</span>
  		</div>
  			<input name="startPoint" type="text" class="form-control" placeholder="1~5" aria-label="Username" aria-describedby="basic-addon1">
	</div>
	
	 <!-- context  -->
	 <div class="input-group mb-3">
 	 	<div class="input-group-prepend">
    		<span class="input-group-text">내용</span>
  		</div>
  			<textarea name="context" class="form-control" aria-label="With textarea"></textarea>
  	</div>
	<!-- upload file -->
	 
				<s:file label="File[1]" name="uploads" />
	 
	<input name="submit" type="submit" value="작성완료" class="inputb">
	</form>
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

</script>

</body>
</html> 