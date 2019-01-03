<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>��Ʈ���� 2 �Խ���</title>

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
		<td align="center"><h2>��Ʈ���� �Խ���</h2></td>
	</tr>
	</table>

	<table class="type05">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<%-- <tr>
			<td width="10">��ȣ</td>
			<td width="500">
				<s:property value="resultClass.serviceno" />
			</td>
		</tr> --%>
		<tr>
			<th scope="row">����</th>
			<td width="500">
				<s:property value="resultClass.subject"/>
			</td>
		</tr>
		<tr>
			<th scope="row">�۾���</th>
			<td width="500">
				<s:property value="resultClass.id" />
			</td>
		</tr>
		
		 <tr>
			<th scope="row">����</th>
			<td width="500">
				${resultClass.context}
			</td>
		</tr> 
		
		
		
		<%-- <tr>
			<td width="100">��ȸ��</td>
			<td width="500">
				<s:property value="resultClass.readhit" />
			</td>
		</tr> --%>
		<tr>
			<th scope="row">�������</th>
			<td width="500">
				<s:property value="resultClass.reg_date" />
			</td>
		</tr>
		<%-- <tr>
			<td width="100">÷������</td>
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
								��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� <s:textfield name="memberID" theme="simple" value="" cssStyle="width:100px" maxlength="20" /><br>
								��й�ȣ <s:textfield name="password" theme="simple" value="" cssStyle="width:100px" maxlength="20" />
							</td>
							<s:hidden name="restaurantNo" value="%{resultClass.serviceNo}" />
							<s:hidden name="serviceNo" value="%{resultClass.serviceNo}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							
							<s:hidden name="currentPage" value="%{currentPage}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left">
								<s:textarea name="context" theme="simple" value="" cols="60" rows="3" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input name="submit" type="submit" value="�ۼ�" class="button">
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
			<!-- @@@@@@@@@@@@�ڸ�Ʈ ����@@@@@@@@@@@@ -->
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
				��۾���
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
				<input name="list" type="button" value="�亯" class="button" onClick="javascript:location.href='QnAReplyForm.action?serviceno=<s:property value="serviceno" />'">
				<input name="list" type="button" value="����" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="����" class="button" onClick="javascript:open_win_noresizable('checkForm.action?serviceno=<s:property value="resultClass.serviceno" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="���" class="button" onClick="javascript:location.href='QnAList.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>