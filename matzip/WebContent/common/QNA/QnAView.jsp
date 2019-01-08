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
<title>QNA</title>
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

<script type="text/javascript">
	function open_win_noresizable(url, id)
	{
		var oWin = window.open(url, id, "scrollbars=serviceno, status=serviceno, resizable=serviceno, width=300, height=150");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>QNA</h2></td>
	</tr>
	</table>

	<table class="type05">
		<tr bgcolor="#777777">
		</tr>
		<%-- <tr>
			<td width="10">번호</td>
			<td width="500">
				<s:property value="resultClass.serviceno" />
			</td>
		</tr> --%>
		<tr>
			<th scope="row">제목</th>
			<td width="500">
				<s:property value="resultClass.subject"/>
			</td>
		</tr>
		<tr>
			<th scope="row">글쓴이</th>
			<td width="500">
				<s:property value="resultClass.id" />
			</td>
		</tr>
		

		
		
		
		<%-- <tr>
			<td width="100">조회수</td>
			<td width="500">
				<s:property value="resultClass.readhit" />
			</td>
		</tr> --%>
		<tr>
			<th scope="row">등록일자</th>
			<td width="500">
				<s:property value="resultClass.reg_date" />
			</td>
		</tr>
		
				 <tr>
			<th scope="row">내용</th>
			<td width="500">
				${resultClass.context}
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
				<input name="list" type="button" value="답변" class="button" onClick="javascript:location.href='QnAReplyForm.action?serviceno=<s:property value="serviceno" />'">
				<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="삭제" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="목록" class="button" onClick="javascript:location.href='QnAList.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>