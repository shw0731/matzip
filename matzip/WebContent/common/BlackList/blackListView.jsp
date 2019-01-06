<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트</title>
</head>
<body>
<table class="table table-striped" width="600" border="0" cellpadding="2">
<tr>
<td align="center"><h2>블랙리스트</h2></td>
</tr>
<tr>
  <td height="20"></td>
</tr>
</table>
<table class="table table-striped" width="600" border="0" cellspacing="0" cellpadding="0">
           <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>번호</strong></td></tr>
      		
 <s:iterator value="list">
 <s:url id="viewURL" action="BlackListViewAction">
 <s:param name="phoneNumber">
				<s:property value="phoneNumber" />
			</s:param>
 </s:url>
</s:iterator>
   <s:if test="list.size() <= 0">
    <tr bgcolor="#FFFFFF"  align="center">
    <td colspan="5">등록된 번호가 없습니다.</td></tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
	      </s:if>
     
</body>
</html>