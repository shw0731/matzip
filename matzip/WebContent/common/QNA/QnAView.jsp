 <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
    <% String id=session.getId();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
table.type05 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}
table.type05 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	font-size: 16px;
	vertical-align: top;
  	text-align: center;
	border-bottom: 1px solid #ccc;
	/* background: #efefef; */
}

table.type05 td {
	width: 550px;
	padding: 10px;
	font-size: 16px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type06 {
display:inline;
}



.button{
  display:inline;
  text-decoration: none;
  padding: 9px;
  width: 50px;
  border: none;
  border-radius: 5px;
  text-align: center;
  color: #FFF;
  background: #407775;
  font-family: sans-serif;
  font-size: 15px;
  cursor: pointer;

}
.button:hover{
  background: #2c3e50;
}
</style>
<title>스트럿츠 2 게시판</title>

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
		<td align="center"><h2>스트럿츠 게시판</h2></td>
	</tr>
	</table>

	<table class="type05">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
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
		
		 <tr>
			<th scope="row">내용</th>
			<td width="500">
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
			<th scope="row">등록일자</th>
			<td width="500">
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
				<input name="list" type="button" value="답변" class="button" onClick="javascript:location.href='QnAReplyForm.action?serviceno=<s:property value="serviceno" />&currentPage=<s:property value="currentPage" />'">
				</s:if>
				<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="삭제" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="목록" class="button" onClick="javascript:location.href='QnAList.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>