<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>음식점 상세보기</title>


<script type="text/javascript">


 function open_win_noresizable(url,name){
	var oWin = window.open(url, name, "scrollbars=no,status=no, resizable=no, width=300, height=150");
}

var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
	
  showSlides(slideIndex = n);

  
}
function showSlides(n) {
	document.getElementById("img").style.display ='none';
	
  var i;
  var slides = document.getElementsByClassName("mySlides")
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  slides[slideIndex-1].style.display = "block"; 
}

</script>
<style>

* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
   display: none;
}

/* Next & previous buttons */
 .prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
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

.border {
	border-radius: 50%;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 50px;
  width: 50px;
  margin: 0 2px;
  background-color: #808080;
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
</style>

</script>
</head>
<body>
<s:hidden name="currentPage" value="%{currentPage}" />


	음식점명 :	&nbsp;&nbsp;(<s:property value="resultClass.category"/>)
	 <s:property value="resultClass.restaurantName"/>
<br>
	별점 : &nbsp; &nbsp; <s:property value="resultClass.starPoint"/>
	
	<input name="list" type="button" value="좋아요" class="inputb" onclick="javascript:location.href='like_up.action?zzim_contno=<s:property value="like"/>&zzim_indexno=2'">
	
<table width="100%" height="400" border="0">
<tr>
<td width="60%" align="middle">

 <img id="images" src="<s:property value="resultClass.images"/>" style="width:350px; height:350px"/> 


<div class="slideshow-container">
		<s:iterator value="resultClass.images" status="stat">
		  <!-- Full-width images with number and caption text -->
		  <div class="mySlides fade">
		    <img src="<s:property/>" style="width:300px; height:300px"/>
		  </div>
		</s:iterator>
	</div>
</td>

<td width="40%" height="250">
업종 : <s:property value="resultClass.category"/><br>
주소 : <s:property value="resultClass.address"/><br>

</td>
</tr>
<tr>
<td width="60%">
<table width="130px" height="100%" border="1" align="center">
 <tr>
 <s:subset source="resultClass.images" count="4">
	<s:iterator status="stat">	
	<td>
		<img src='<s:property/>' style="height: 100px; width: 100px; display: block;" onclick="currentSlide(<s:property value='#stat.index+1'/>)"/>
	</td>
	</s:iterator>
	</s:subset>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">
<hr style="color:gray"/>
</td>
</tr>

<tr>
<td colspan="2">
<s:property value="resultClass.context"/>

</td>
</tr>

<tr>
<td colspan="2">
<hr style="color:gray"/>
</td>
</tr>
<%-- 
<!-- 댓글 입력 -->
<tr>
<td colspan="2" height="10">

<form action="restaurantCommentAction.action" method="post">
			<table>
				<tr>
					<td width="170">
						아이디 : <s:property value="%{#session.ID}"/>
					</td>
					<s:hidden name="c_contnum" value="%{resultClass.talent_no}" />
					<s:hidden name="talent_no" value="%{resultClass.talent_no}" />
					<s:hidden name="currentPage" value="%{currentPage}"/>
					<td align="left">
						<s:textarea name="c_content" theme="simple" value="" cols="60" rows="3"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input name="submit" type="submit" value="작성완료" class="inputb">
					</td>
				</tr>
			</table>
		</form>

</td>
</tr>

<tr bgcolor="#777777">
<td colspan="2" height="1"></td>
</tr>
<!-- 댓글 리스트 -->
<s:iterator value="TcommentList" status="stat">
	<tr>
		<td height="10" width="130" align="center">
			<img class="border"	id="blah"src="/MUSED/mypage/image/file_<s:property value="c_id"/>.jpg" width="50" height="50" /><br> 
			<s:property value="c_id"/><br>
			<s:property value="c_regdate"/><br><br>
		</td>
		<td>
			<s:property value="c_content"/><br></br>
				<s:url id="DeleteURL" action="deleteTComment">
					<s:param name="c_no">
						<s:property value="c_no"/>
					</s:param>
					<s:param name="c_id">
						<s:property value="%{#session.ID}"/>
					</s:param>
					<s:param name="talent_no">
						<s:property value="talent_no"/>
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage"/>
					</s:param>
				</s:url>
			<s:a href="%{DeleteURL}">X</s:a>

		</td>
	</tr>
	<tr bgcolor="#777777">
		<td colspan="2" height="1"></td>
	</tr>	
	</s:iterator>
	<tr>
		<td colspan="2" height="10">
			<s:if test="TcommentList.size() <= 0">
			댓글 없음
			</s:if>
		</td>
	</tr>

<!-- 댓글 -->

<tr>
<td colspan="2">
<table width="60%" height="150" border="1" align="center">

		 <tr>
 <s:subset source="Mainlist">
	<s:iterator status="stat">	
	   	  	      		      	<s:url id="DetailURL" action="talentDetail">
									<s:param name="talent_no">
										<s:property value="talent_no"/>
									</s:param>
								</s:url>
      	      	      <td>	 
      	      	      &nbsp;<s:a href="%{DetailURL}">
      	      			<img src="/MUSED/talent/img/<s:property value="main_img"/>" style="height: 100px; width: 100px; display: block;"/></s:a>
				</td>
						</s:iterator>
						</s:subset>
	</tr>
</table>
</td>
</tr>

 --%>
<tr>
<td colspan="2">
		<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
      <s:if test="%{#session.ID==resultClass.ID}">
		<input name = "list" type = "button" value = "수정" class = "inputb" onClick = "javascript:open_win_noresizable('modifyForm.action?no='<s:property value = "resultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','modify')">
        <input name = "list" type = "button" value = "삭제" class = "inputb" onClick = "javascript:location.href='deleteAction.action?no='<s:property value = "resultClass.restaurantNo" />&currentPage='<s:property value = "currentPage" />','delete'">
	</s:if>
</td>
</tr>

</table>
</body>
</html>