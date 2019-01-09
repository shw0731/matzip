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
<body>
<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <span style="color:#fed136">
    <h2 class="text-center">공지사항</h2>
    </span>
    <div class="table-responsive">
        <table class="table">

    <tr align = "center">
            <td width = "50"><strong>번호</strong></td>
      
            <td width = "350"><strong>제목</strong></td>
            <td width = "80"><strong>날짜</strong></td>
      </tr>

 
     <s:iterator value = "list" status = "stat">
            <s:url id = "viewURL" action = "no_viewAction">
                  <s:param name = "serviceno">
                        <s:property value = "serviceno" />
                  </s:param>
                  <s:param name = "currentPage">
                        <s:property value = "currentPage" />
                  </s:param>
            </s:url>
  
            <tr bgcolor = "#FFFFFF" align = "center">
                  <td><s:property value = "serviceno" /></td>
                  <td align = "left">&nbsp;<s:a href = "%{viewURL}">
                        <s:property value = "subject" /></s:a>
                  </td>
                  <td align = "center"><s:property value = "reg_date" /></td>
            </tr>

      </s:iterator>
      
  <s:if test = "list.size() <= 0"> 
            <tr bgcolor = "#FFFFFF"  align = "center">
                  <td colspan = "5">등록된 게시물이 없습니다.</td>
            </tr>      
      </s:if>
 
	
      


     <tr align = "center">
            <td colspan = "5"><s:property value = "pagingHtml"  escape = "false" /></td>
      </tr>
      </table>
      <s:if test="memberResultClass.isType==2">
      <input type = "button" value = "메인으로 돌아가기" class="btn btn-primary pull-right"
                        onClick = "javascript:location.href=
                        'MainAction.action';">
       
                  <input type = "button" value = "글쓰기" class="btn btn-primary pull-right"
                        onClick = "javascript:location.href=
                        'no_writeForm.action?currentPage=<s:property value = "currentPage" />';">
                        </s:if>
            </td>
      </tr>
      </div>

</body>
</html>


