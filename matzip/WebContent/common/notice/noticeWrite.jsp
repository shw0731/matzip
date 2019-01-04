<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="/matzip/vendor/bootstrap/css/bootstrap.min.css">
 <style>


  </style>

 <div class="container">

  <div class="col-lg-15"></div>

  <div class="col-lg-15">

  <!-- 점보트론 -->

   <div class="jumbotron" style="padding-top: 20px;">

<title>공지사항</title>

 

<SCRIPT type = "text/javascript">
      function validation()
      {
            var frm = document.forms(0);

 

            if(frm.subject.value == "")
            {
                  alert("제목을 입력해주세요.");

 

                  return false;
            }
            else if(frm.context.value == "")
            {
                  alert("내용을 입력해주세요.");

 

                  return false;
            }

 

            return true;
      }
</SCRIPT>
</head>

 

<body>
		<tr>
		<span style="color:#fed136">
			<h3 style="text-align: center;">공지사항 작성</h3>
			</span>
		</tr>

 

<s:if test = "resultClass == NULL">
<form action = "no_writeAction.action" method = "post"
      enctype = "multipart/form-data" onsubmit = "return validation();">
</s:if>

 

<s:else>
<form action = "no_modifyAction.action" method = "post" enctype = "multipart/form-data">
      <s:hidden name = "serviceno" value = "%{resultClass.serviceno}" />
      <s:hidden name = "currentPage" value = "%{currentPage}" />
</s:else>

 

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
      

      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>

      
        <tr>
        
            <div class="form-group">
<input type="text" class="form-control" placeholder="제목	"  name="subject" maxlength="20" value="<s:property value="resultClass.subject"/>">
          </td>
                </div>        </tr>
      <tr bgcolor = "#777777">
            <td height = "1" colspan = "2"></td>
      </tr>
	<tr>
	    <div class="form-group">
		<td><textarea class="form-control" placeholder="공지 내용"  name="Context" maxlength="2048" style="height: 300px;"><s:property value="resultClass.context"/></textarea>

          </td>
          </div>
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
          <td align="right" colspan="1">
                  <input type = "submit" value = "글쓰기" class="btn btn-primary pull-right"/>
          	  <input name="list" type="button" value="목록" class="btn btn-info right" onClick="javascript:location.href='no_listAction.action?currentPage=<s:property value="currentPage" />'">
           
          </td>
        </tr>
</table>
</form>
</body>
</html>

