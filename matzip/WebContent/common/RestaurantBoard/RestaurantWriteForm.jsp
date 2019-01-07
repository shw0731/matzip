<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>음식점등록게시판</title>	
	<SCRIPT type="text/javascript">
	


	
		function validation() {
		
			var frm = document.rest;
			
			if(frm.restaurantName.value == "") {
				alert("음식점명을 입력해주세요.");
				return false;
			} 
			
			else if(frm.address.value == "") {
				alert("주소를 입력해주세요.");
				return false;
			}
			
			else if(frm.category.value == "") {
				alert("분류를 입력해주세요.");
				return false;
			}
			
			else if(frm.context.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
	<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>


</head>
  
  <body>
  
 
  	<table width="300" border="0" cellspacing="0" cellpadding="2" align="center" valign="top">
  		<tr>
  			&nbsp;&nbsp;<td align="center" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"><h2>음식점게시양식</h2></td>
  		</tr>
  	</table>
  
		<s:if test="restResultClass == NULL">
			<form action="Write.action" method="post" enctype="multipart/form-data" onsubmit="return validation();" name="form">
		</s:if>
		
		<s:else>
		  <form action="modifyAction.action" method="post" enctype="multipart/form-data" name="form">
			  <s:hidden name="restaurantNo" value="%{restResultClass.restaurantNo}" />
			  <s:hidden name="currentPage" value="%{currentPage}" />
			  <s:hidden name="location" value="%{restResultClass.location}"/>
		</s:else>

       <table width="600" border="0" cellspacing="5px" cellpadding="3px" align="center" valign="top">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="yellow">
          <td height="1" colspan="2"></td>
        </tr>
				
        
        <tr>
          <td bgcolor="#ffffff" width="100px" align="center"> <font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"> <font color="#FF0000">★</font>&nbsp;음식점명 </td>
          <td bgcolor="#FFFFFF">
            &nbsp;&nbsp;<s:textfield name="restaurantName" theme="simple" value="%{restResultClass.restaurantName}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
 
        <tr>
          <td bgcolor="#FFFFFF" align="center"><font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" align="center"><font color="#FF0000">★</font>&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 </td>
        	<td>
        	&nbsp;&nbsp;<input type="text" name="address" style="width:300px" id="sample5_address" placeholder="주소">
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82957f9de3f5badbdcfb736f5cc155ac&libraries=services"></script>
			<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
       </td>


        </tr>
        
	<tr>
          <td bgcolor="#FFFFFF" align="center"><font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" align="center"><font color="#FF0000">★</font>&nbsp;분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류 </td>
          <td bgcolor="#FFFFFF">
           &nbsp;&nbsp;<select name="category"> 
			<option value="" >카테고리</option>
			<option value="중식"
			<s:if test="modifyClass.category.equals('중식')">	
				selected="selected"
			</s:if>>중식</option>
	 	   	<option value="한식"
	 	   	<s:if test="modifyClass.category.equals('한식')">	
				selected="selected"
			</s:if>>한식</option>
	 	   	<option value="일식"
	 	   	<s:if test="modifyClass.category.equals('일식')">	
				selected="selected"
			</s:if>>일식</option>
	  	  	<option value="양식"
	  	  	<s:if test="modifyClass.category.equals('양식')">	
				selected="selected"
			</s:if>>양식</option>
	 	   	<option value="세계"
	 	   	<s:if test="modifyClass.category.equals('세계')">	
				selected="selected"
			</s:if>>세계</option>
	    	<option value="뷔페"
	    	<s:if test="modifyClass.category.equals('뷔페')">	
				selected="selected"
			</s:if>>뷔페</option>
		</select>
          </td>
        </tr>

	<tr>
          <td bgcolor="#FFFFFF" align="center"><font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"><font color="#FF0000">★</font>&nbsp;내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 </td>
          <td bgcolor="#FFFFFF">
            &nbsp;&nbsp;<s:textarea name="context" theme="simple" value="%{restResultClass.context}" cols="50" rows="10" />
          </td>
        </tr>
   		<tr bgcolor="yellow">
          <td height="1" colspan="2"></td>
        </tr>
        
   		<tr>
   		<td bgcolor="#FFFFFF" align="center"><font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger">&nbsp; 게시판<br/> 내부 사진</td>
   		<td>
   			 <s:form action="multiUploadListAction" method="POST" enctype="multipart/form-data">
				<s:file label="File[1]" name="uploads" />
				<s:file label="File[2]" name="uploads" />
				<s:file label="FIle[3]" name="uploads" />
			</s:form>	
     </td>
       

        <tr bgcolor="yellow">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="inputb">
          </td>
        </tr>

    </table>
    </form>

  </body>
</html>
