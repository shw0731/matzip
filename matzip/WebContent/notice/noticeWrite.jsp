<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

 

<html>
<head>
<title>공지사항</title>
<link rel = "stylesheet" href = "/Struts2Board/board/css.css" type = "text/css">

 

<SCRIPT type = "text/javascript">
      function validation()
      {
            var frm = document.forms(0);

 

            if(frm.subject.value == "")
            {
                  alert("제목을 입력해주세요.");

 

                  return false;
            }
            else if(frm.writer.value == "")
            {
                  alert("이름을 입력해주세요.");

 

                  return false;
            
            }
            else if(frm.content.value == "")
            {
                  alert("내용을 입력해주세요.");

 

                  return false;
            }

 

            return true;
      }
</SCRIPT>
</head>

 

<body>
<table width = "600" border = "0" cellspacing = "0" cellpadding = "2">
      <tr>
            <td align = "center"><h3>공지사항 작성</h3></td>
      </tr>
</table>

 

<s:if test = "resultClass == NULL">
<form action = "writeAction.action" method = "post"
      enctype = "multipart/form-data" onsubmit = "return validation();">
</s:if>

 

<s:else>
<form action = "modifyAction.action" method = "post" enctype = "multipart/form-data">
      <s:hidden name = "no" value = "%{resultClass.no}" />
      <s:hidden name = "currentPage" value = "%{currentPage}" />
</s:else>

 

<table width = "600" border = "0" cellspacing = "0" cellpadding = "0">
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      
            <tr>
            <td bgcolor = "#F4F4F4"></font> 작성자</td>
            <td bgcolor = "#FFFFFF">
            
                  <s:textfield name = "writer" theme = "simple" value = "%{resultClass.writer}"
                        cssStyle = "width:100px" maxlength = "20" />
            </td>
      </tr>

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>

      
            <tr>
            <td width = "100" bgcolor = "#F4F4F4"></font> 제목</td>
            <td width = "500" bgcolor = "#FFFFFF">
                  <s:textfield name = "subject" theme = "simple"
                        value = "%{resultClass.subject}" cssStyle = "width:337px" maxlength = "50" />
            </td>
      </tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      <tr>
            <td bgcolor = "#F4F4F4"></font>공지 내용</td>
            <td bgcolor = "#FFFFFF">
                  <s:textarea name = "content" theme = "simple"
                        value = "%{resultClass.content}" cols = "50" rows = "10" />
            </td>
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
                  <input name = "submit" type = "submit" value = "작성완료" class = "inputb">
                  <input name = "list" type = "button" value = "목록" class = "inputb"
                        onClick = "javascript:location.href=
                        'listAction.action?currentPage=<s:property value = "currentPage" />'">
            </td>
      </tr>
</table>
</form>
</body>
</html>

