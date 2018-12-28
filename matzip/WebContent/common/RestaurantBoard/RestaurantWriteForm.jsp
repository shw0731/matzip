<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>음식점등록게시판</title>	
	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.restaurantName.value == "") {
				alert("음식점명을 입력해주세요.");
				return false;
			} 
			
			else if(frm.ownerID.value == "") {
				alert("점주명을 입력해주세요.");
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
  
		<s:if test="resultClass == NULL">
			<form action="Write.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		</s:if>
		
		<s:else>
		  <form action="modifyAction.action" method="post" enctype="multipart/form-data">
		  <s:hidden name="restaurantNo" value="%{resultClass.restaurantNo}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:hidden name="images" value="%{resultClass.images}" />
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
            <s:textfield name="restaurantName" theme="simple" value="%{resultClass.restaurantName}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  주소 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="address" theme="simple" value="%{resultClass.address}" cssStyle="width:100px" maxlength="20"/>
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
 	 	 	<option value="치킨"
 	 	 	<s:if test="modifyClass.category.equals('치킨')">	
				selected="selected"
			</s:if>>치킨</option>
			<option value="피자"
			<s:if test="modifyClass.category.equals('피자')">	
				selected="selected"
			</s:if>>피자/양식</option>
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
	  	  	<option value="돈까스"
	  	  	<s:if test="modifyClass.category.equals('돈까스')">	
				selected="selected"
			</s:if>>돈까스</option>
	 	   	<option value="족발"
	 	   	<s:if test="modifyClass.category.equals('족발')">	
				selected="selected"
			</s:if>>족발/보쌈</option>
	    	<option value="분식"
	    	<s:if test="modifyClass.category.equals('분식')">	
				selected="selected"
			</s:if>>분식</option>
	    	<option value="디저트"
	    	<s:if test="modifyClass.category.equals('디저트')">	
				selected="selected"
			</s:if>>디저트</option>
	    	<option value="기타"
	    	<s:if test="modifyClass.category.equals('기타')">	
				selected="selected"
			</s:if>>기타</option>
		</select>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="context" theme="simple" value="%{resultClass.context}" cols="50" rows="10" />
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
       
<%--           <td bgcolor="#F4F4F4">  첨부파일 </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            <form method="post" action="WriteForm.action" enctype="multipart/form-data">
            <s:if test="%{resultClass.images} != NULL">
		&nbsp; * <s:property value="%{resultClass.images}" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
			<s:file name="upload" theme="simple"/>
            
            <s:if test="%{resultClass.images} != NULL">
		&nbsp; * <s:property value="%{resultClass.images}" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
			<s:file name="upload" theme="simple"/>
            
            <s:if test="%{resultClass.images} != NULL">
		&nbsp; * <s:property value="%{resultClass.images}" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
			<s:file name="upload" theme="simple"/>
            
            <s:if test="%{resultClass.images} != NULL">
		&nbsp; * <s:property value="%{resultClass.images}" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
          </td>
        </tr> --%>
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
