<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ Ȯ��</title>
<link rel="stylesheet" href="/struts2_board/board/common/css/css.css" type="text/css">
</head>
<body>
<h2>��й�ȣ Ȯ��</h2>
	<form action="checkAction.action" method="post">
		<s:hidden name="serviceno" value="%{serviceno}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		
		<table width="250" border="0" cellspacing="0" cellpadding="0">
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#F4F4F4"> ��й�ȣ �Է�</td>
				<td width="150" bgcolor="#FFFFFF">
					&nbsp;&nbsp; <s:textfield name="password" theme="simple" cssStyle="width:100px" maxlength="20" />
					&nbsp;&nbsp; <input name="submit" type="submit" value="Ȯ��" class="inputb">"
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
		</table>
	</form>
</body>
</html>