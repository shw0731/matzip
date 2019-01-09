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
    
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Custom styles for this template -->
   <!--  <!-- <link href="/css/agency.css" rel="stylesheet">
    

 <div class="container">

  <div class="col-lg-4"></div>

  <div class="col-lg-4">

  <!-- 점보트론 -->

   <div class="jumbotron" style="padding-top: 20px;">

<title>공지사항</title>
<!-- <link rel = "stylesheet" href = "/Struts2Board/board/css.css" type = "text/css">
 -->
 

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
		
			<h3 style="text-align: center;">Q&A 글쓰기</h3>
			
		</tr>

 <s:if test="reply">
		
		<form action="QnAReplyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="answerno" value="%{resultClass.answerno}" />
			
	</s:if>

<s:if test = "resultClass == NULL">
<form action = "QnAWriteAction.action" method = "post"
      enctype = "multipart/form-data" onsubmit = "return validation();">
</s:if>

 

<s:else>
<form action = "QnAModifyAction.action" method = "post" enctype = "multipart/form-data">
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
<input type="text" class="form-control" placeholder="제목	" name="subject" maxlength="20" value="<s:property value="resultClass.subject"/>">
                </div>
        </tr>
        

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
          	  <input type="submit" class="btn btn-primary pull-right" value="작성 완료" />
          	  <input name="list" type="button" value="목록" class="btn btn-success right" onClick="javascript:location.href='QnAList.action?currentPage=<s:property value="currentPage" />'">
           
          </td>
        </tr>
</table>
</form>
</body>
</html>

  <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/js/agency.min.js"></script>
    
    <script type="text/javascript">
	$(document).ready(function(){
		
	});  

