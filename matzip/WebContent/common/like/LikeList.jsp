<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

 

<html>
<head>
<title>좋아요 리스트</title>
<link rel = "stylesheet" href = "/Struts2Board/board/css.css" type = "text/css">
</head>
<body>
<table width = "600" border = "0" cellspacing = "0" cellpadding = "2">
      <tr>
            <td align = "center"><h3>내가 좋아요한 음식점</h3></td>
      </tr>
      <tr>
            <td height = "20"></td>
      </tr>
</table>

 

<table width = "600" border = "0" cellspacing = "0" cellpadding = "2">
      <tr align = "center" bgcolor = "#fd7e14">
            <td width = "350"><strong>음식점명</strong></td>
            <td width = "80"><strong>상태</strong></td>
      </tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "5"></td>
      </tr>
 
      <s:iterator value = "list" status = "stat">
            <s:url id = "viewURL" action = "LikeListAction">
                  <s:param name = "no">
                        <s:property value = "no" />
                  </s:param>
                  <s:param name = "currentPage">
                        <s:property value = "currentPage" />
                  </s:param>
            </s:url>
  
            <tr bgcolor = "#FFFFFF" align = "center">
                  <td><s:property value = "no" /></td>
                  <td align = "left">&nbsp;<s:a href = "%{viewURL}">
                        <s:property value = "restaurantNo" /></s:a>
                  </td>
                  <td align = "center"><s:property value = "restaurantName" /></td>
            </tr>

      </s:iterator>
 
      <s:if test = "list.size() <= 0"> 
            <tr bgcolor = "#FFFFFF"  align = "center">
                  <td colspan = "5">등록된 음식점이 없습니다.</td>
            </tr>      

      </s:if> 
 
      <tr align = "center">
            <td colspan = "5"><s:property value = "pagingHtml"  escape = "false" /></td>
      </tr>
      <tr align = "right">
            <td colspan = "5">
                  <input type = "button" value = "내 목록에서 삭제" class = "inputb" 
                        onClick = "javascript:location.href=
                        'LikeDelete.action?currentPage=<s:property value = "currentPage" />';">
            </td>
      </tr>
</table>
</body>
</html>
