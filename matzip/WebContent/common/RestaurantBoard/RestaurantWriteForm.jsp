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
</head>
  
  <body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>음식점게시양식</h2></td>
  		</tr>
  	</table>
  
		<s:if test="restResultClass == NULL">
			<form action="Write.action" method="post" enctype="multipart/form-data" onsubmit="return validation();" name="form">
		</s:if>
		
		<s:else>
		  <form action="modifyAction.action" method="post" enctype="multipart/form-data" name="form">
		  <s:hidden name="restaurantNo" value="%{restResultClass.restaurantNo}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:hidden name="images" value="%{restResultClass.images}" />
		</s:else>

       <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        
        <tr>
          <td bgcolor="#F4F4F4" width="100px"><font color="#FF0000">*</font>  음식점명 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="restaurantName" theme="simple" value="%{restResultClass.restaurantName}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  주소 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="address" theme="simple" value="%{restResultClass.address}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  분류 </td>
          <td bgcolor="#FFFFFF">
           <select name="category"> 
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
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="context" theme="simple" value="%{restResultClass.context}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
<%--          <tr>
        <td bgcolor="#F4F4F4"> 썸네일 사진 </td>
        <td>
            <s:form action="fileUploadAction" method="POST" enctype="multipart/form-data">
       			 <s:file name="upload" label="File"/>
   			 </s:form>
   		</td>
   		</tr> --%>
   		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
   		<tr>
   		<td bgcolor="#F4F4F4"> 게시판<br/> 내부 사진</td>
   		<td>
   			 <s:form action="multiUploadListAction" method="POST" enctype="multipart/form-data">
				<s:file label="File[1]" name="uploads" />
				<s:file label="File[2]" name="uploads" />
				<s:file label="FIle[3]" name="uploads" />
			</s:form>	
     </td>
       

        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="inputb">
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
    </form>

  </body>
</html>
