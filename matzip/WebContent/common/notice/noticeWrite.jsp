 <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
    <% String id=session.getId();
    %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>공지사항</title>
<!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>

 

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
      console.log(<s:property value="memberResultClass.isType"/>);
</SCRIPT>

 

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
          	  <s:if test="memberResultClass.isType==2">
          
                  <input type = "submit" value = "글쓰기" class="btn btn-primary pull-right"/>
          	  <input name="list" type="button" value="목록" class="btn btn-info right" onClick="javascript:location.href='no_listAction.action?currentPage=<s:property value="currentPage" />'">
           	</s:if>
          </td>
        </tr>
</table>
</form>
</body>
</html>

