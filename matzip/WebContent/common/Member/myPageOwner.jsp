 <%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
 <!-- 점주 -->
  <s:elseif test="resultClass.isType==1">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">점주페이지</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Modal body -->

          	<text align=right>${resultClass.ID} 님의 방문을 환영합니다.
          </i><a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"><small>정보수정</small></a>
          	<a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"><small>고객센터</small></a></text>	
          	<br><br>
    		<a href="javascript:location.href='WriteForm.action?currentPage=<s:property value="currentPage" />';" target="_blank"> <img src="/img/mypage/myRestRes.png" width="210" height="90" border=0></a><br>
    		<a href="javascript:location.href='modifyForm.action?currentPage=<s:property value="currentPage" />';" target="_blank"> <img src="/img/mypage/myRestModify.png" width="210" height="90" border=0></a><br> 		
    		<a href="javascript:location.href='deleteForm.action?currentPage=<s:property value="currentPage" />';" target="_blank"> <img src="/img/mypage/myRestDel.png" width="210" height="90" border=0></a><br>    		
      <table width="300" border="0" cellspacing="0" cellpadding="2" align="center" valign="top">
  		<tr>
  			&nbsp;&nbsp;<td align="center" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"><h2>음식점게시양식</h2></td>
  		</tr>
  
  
		<s:if test="resultClass == NULL">
			<form action="Write.action" method="post" enctype="multipart/form-data" onsubmit="return validation();" name="form">
		</s:if>
		
		<s:else>
		  <form action="modifyAction.action" method="post" enctype="multipart/form-data" name="form">
		  <s:hidden name="restaurantNo" value="%{resultClass.restaurantNo}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:hidden name="images" value="%{resultClass.images}" />
		</s:else>

       <table width="600" border="0" cellspacing="5px" cellpadding="3px" align="center" valign="top">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">★</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="yellow">
          <td height="1" colspan="2"></td>
        </tr>
				
        
        <tr>
          <td bgcolor="#ffffff" width="100px" align="center"> <font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"> <font color="#FF0000">★</font>&nbsp;음식점명 </td>
          <td bgcolor="#FFFFFF">
            &nbsp;&nbsp;<s:textfield name="restaurantName" theme="simple" value="%{resultClass.restaurantName}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
 
        <tr>
          <td bgcolor="#FFFFFF" align="center"><font class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" align="center"><font color="#FF0000">★</font>&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 </td>
          <td bgcolor="#FFFFFF">
            &nbsp;&nbsp;<s:textfield name="address" theme="simple" value="%{resultClass.address}" cssStyle="width:100px" maxlength="20"/>
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
            &nbsp;&nbsp;<s:textarea name="context" theme="simple" value="%{resultClass.context}" cols="50" rows="10" />
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
          	<input name="submit" type="submit" value="작성완료" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger">
            <input name="list" type="button" value="목록" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
			<br>
			<br>
          </td>
        </tr>
    </table>
    </form>
    </table>
  </div>
  </div>
  </s:elseif>