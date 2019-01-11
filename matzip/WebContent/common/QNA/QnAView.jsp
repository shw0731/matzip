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
<title>QnA</title>
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
<link rel = "stylesheet" href = "/Struts2Board/board/css.css" type = "text/css">

 

<SCRIPT type = "text/javascript">
      function open_win_noresizable(url, writer)
      {
            var oWin = window.open(url, writer, 
                   "scrollbars=no, status=no, resizable=no, width=600, height=500");
      }
</SCRIPT>


 

<body>

 

<div class="row">
    <div class="col-xs-2"></div>
    <div class="col-xs-8 col-md-8">
    <span style="color:#fed136">
        <h2 class="text-center">QnA</h2>
        <span style="color:#fed136">
        <div class="table-responsive">
        <table class="table" >

		<tr>
			<td width="100" align="center">제목</td>
			<td width="500" >
				${resultClass.subject }
			</td>
		</tr>
		<tr>
			<td width="100" align="center">작성자</td>
			<td width="500" >
				${resultClass.id }
			</td>
		</tr>
		
		 <tr>
			<td width="100" align="center">내용</td>
			<td width="500" >
				${resultClass.context}
			</td>
		</tr> 
		
		
		
		<%-- <tr>
			<td width="100">조회수</td>
			<td width="500">
				<s:property value="resultClass.readhit" />
			</td>
		</tr> --%>
		<tr>
			<td width="100" align="center">등록일자</td>
			<td width="500" >
				<s:property value="resultClass.reg_date" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="10"></td>
		</tr> 
	
	
		<tr>
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="QnAModifyAction">
					<s:param name="serviceno">
						<s:property value="serviceno" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="QnADeleteAction">
					<s:param name="serviceno">
						<s:property value="serviceno" />
					</s:param>
				</s:url>
				<s:if test="session.isType==2">
				<input name = "list" type = "button" value = "답변" class = "btn btn-secondary right"
                        onClick = "javascript:location.href='QnAReplyForm.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','modify'">
				</s:if>
				<s:if test="session.ID==resultClass.id">
								<input name = "list" type = "button" value = "수정" class = "btn btn-success right"
                        onClick = "javascript:open_win_noresizable('QnAModifyForm.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','modify')">

                 <input name = "list" type = "button" value = "삭제" class="btn btn-warning right"
                        onClick = "javascript:location.href='QnADeleteAction.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','delete'">
   				</s:if>
                  <input name = "list" type = "button" value = "목록" class="btn btn-info right"
                        onClick = "javascript:location.href='QnAList.action?currentPage='+
                        '<s:property value = "currentPage" />'">
		 		
			</td>
		</tr>
	</table>
</body>
</html>