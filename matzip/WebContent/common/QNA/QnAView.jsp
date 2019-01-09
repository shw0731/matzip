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
        <h2 class="text-center">QNA</h2>
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
		<%-- <tr>
			<td width="100">첨부파일</td>
			<td width="500">
				&nbsp;&nbsp;
				<s:url id="download" action="fileDownloadAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				
				<s:a href="%{download}">
					<s:property value="resultClass.file_orgname" />
				</s:a>
			</td>
		</tr> --%>
	 <%-- 	<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				<form action="writeCommentAction.action" method="post">
					<table>
						<tr>
							<td width="170">
								이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 <s:textfield name="memberID" theme="simple" value="" cssStyle="width:100px" maxlength="20" /><br>
								비밀번호 <s:textfield name="password" theme="simple" value="" cssStyle="width:100px" maxlength="20" />
							</td>
							<s:hidden name="restaurantNo" value="%{resultClass.serviceNo}" />
							<s:hidden name="serviceNo" value="%{resultClass.serviceNo}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							
							<s:hidden name="currentPage" value="%{currentPage}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left">
								<s:textarea name="context" theme="simple" value="" cols="60" rows="3" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input name="submit" type="submit" value="작성" class="button">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
	 
	
		<s:iterator value="reviewList" status="stat">
		<tr>
			<td height="10" width="130" align="center">
				<s:property value="memberID" /><br>
				<s:property value="reg_date" /><br><br>
			</td>
			<td>
			<!-- @@@@@@@@@@@@코멘트 삭제@@@@@@@@@@@@ -->
				<s:property value="context" /> 
				<a href="javascript:open_win_noresizable('checkForm2.action?serviceno=<s:property value="serviceno" />&originno=<s:property value="originno" />&currentPage=<s:property value="currentPage" />','cdelete')">x</a>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		</s:iterator>
		<tr>
			<td colspan="2" height="10">
				<s:if test="commentlist.size() <= 0">
				댓글없음
			</td>
		</tr>
				</s:if>	
				
			
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr> --%>
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
				<s:if test="memberResultClass.isType==2">
				<input name = "list" type = "button" value = "답변" class = "btn btn-secondary right"
                        onClick = "javascript:open_win_noresizable('QnAReplyForm.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','modify')">
				</s:if>
								<input name = "list" type = "button" value = "수정" class = "btn btn-success right"
                        onClick = "javascript:open_win_noresizable('QnAModifyForm.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','modify')">
    
                 <input name = "list" type = "button" value = "삭제" class="btn btn-warning right"
                        onClick = "javascript:location.href='QnADeleteAction.action?serviceno='+
                        '<s:property value = "resultClass.serviceno" />&currentPage='+
                        '<s:property value = "currentPage" />','delete'">
   
                  <input name = "list" type = "button" value = "목록" class="btn btn-info right"
                        onClick = "javascript:location.href='QnAList.action?currentPage='+
                        '<s:property value = "currentPage" />'">
				
			</td>
		</tr>
	</table>
</body>
</html>