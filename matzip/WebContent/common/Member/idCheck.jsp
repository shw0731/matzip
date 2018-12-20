<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 확인</title>

<script>
function windowclose(){
	opener.document.joinform.email.value="${ID}";
	self.close();
}
</script>


</head>
<body>

<s:if test="idcheck ==NULL">

<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<font size="2">입력하신 ${ID} 는 사용할 수 있는 메일입니다.</font>
			<br/><br/>
			<input type="button" value="닫기" onclick="windowclose()" />
		</td>
	</tr>
</table>

</s:if>

<s:else>

<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
		<td height="30">
			<p><font size="2"> ${ID} 는 이미 사용중인 아이디입니다.</font></p>
		</td>
	</tr>
</table>
<form action="idCheckAction.action" method="post" name="checkForm">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p><font size="2">다른 아이디를 선택하세요.</font></p>
			<input type="text" size="10" maxlength="12" name="email"/>
			<input type="submit" value="중복확인" />
		</td>
	</tr>
</table>
</form>


</s:else>


</body>
</html>