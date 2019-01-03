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

 

<div class="row">
    <div class="col-xs-2"></div>
    <div class="col-xs-8 col-md-8">
        <h2 class="text-center">공지사항</h2>
        <div class="table-responsive">
        <table class="table table-bordered table-striped" >


		<tr>
			<td width="100" align="center">제목</td>
			<td width="500" >
				${resultClass.subject }
			</td>
		</tr>

		<tr>
			<td width="100" align="center">내용</td>
			<td width="500" >
				${resultClass.context }
			</td>
		</tr>


     
      <tr>
            <td height = "10" colspan = "2"></td>
      </tr>
      <tr>
            <td align = "right" colspan = "2">
                  <s:url id = "modifyURL" action = "no_modifyForm">
                        <s:param name = "no">
                              <s:property value = "no" />
                        </s:param>
                  </s:url>
   
				<input name = "list" type = "button" value = "수정" class = "btn btn-success right"
                        onClick = "javascript:open_win_noresizable('no_modifyForm.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','modify')">
    
                 <input name = "list" type = "button" value = "삭제" class="btn btn-warning right"
                        onClick = "javascript:location.href='no_deleteAction.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','delete'">


   
                  <input name = "list" type = "button" value = "목록" class="btn btn-info right"
                        onClick = "javascript:location.href='no_listAction.action?currentPage='+
                        '<s:property value = "currentPage" />'">
            </td>
      </tr>
</table>
</body>
</html>



