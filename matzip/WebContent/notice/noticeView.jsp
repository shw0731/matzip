<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

 

<html>
<head>
<title>공지사항</title>
<link rel = "stylesheet" href = "/Struts2Board/board/css.css" type = "text/css">

 

<SCRIPT type = "text/javascript">
      function open_win_noresizable(url, writer)
      {
            var oWin = window.open(url, writer, 
                   "scrollbars=no, status=no, resizable=no, width=600, height=500");
      }
</SCRIPT>
</head>

 

<body>
<table width = "80%" border = "0" cellspacing = "0" cellpadding = "2">
      <tr>
            <td align = "center"><h3>공지사항</h3></td>
      </tr>
      <tr>
            <td height = "20"></td>
      </tr>
</table>

 

<table width = "60%" border = "0" cellspacing = "0" cellpadding = "0">
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
		<tr>
			<td width="100" align="center">제목</td>
			<td width="500" >
				${resultClass.subject }
			</td>
		</tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
		<tr>
			<td width="100" align="center">내용</td>
			<td width="500" >
				${resultClass.content }
			</td>
		</tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      <tr>
            <td height = "10" colspan = "2"></td>
      </tr>
      <tr>
            <td align = "right" colspan = "2">
                  <s:url id = "modifyURL" action = "modifyForm">
                        <s:param name = "no">
                              <s:property value = "no" />
                        </s:param>
                  </s:url>
   
				<input name = "list" type = "button" value = "수정" class = "inputb"
                        onClick = "javascript:open_win_noresizable('modifyForm.action?no='+
                        '<s:property value = "resultClass.no" />&currentPage='+
                        '<s:property value = "currentPage" />','modify')">
    
                 <input name = "list" type = "button" value = "삭제" class = "inputb"
                        onClick = "javascript:location.href='deleteAction.action?no='+
                        '<s:property value = "resultClass.no" />&currentPage='+
                        '<s:property value = "currentPage" />','delete'">


   
                  <input name = "list" type = "button" value = "목록" class = "inputb"
                        onClick = "javascript:location.href='listAction.action?currentPage='+
                        '<s:property value = "currentPage" />'">
            </td>
      </tr>
</table>
</body>
</html>



