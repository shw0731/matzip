<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form name="hi" action="FindPwAction.action">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" style="padding-top: 50px; padding-bottom: 50px;">

					<table width="600" height="250" border="0" class="findform">
						<tr>
							<td align="center" class="text01"><h2>��й�ȣ ã��</h2></td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 20px;">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="formtext">���̵�</td>
										<td height="35"><input type="text" name="ID" size="17"
											style="width: 230px; height: 26px;"></td>
									</tr>
									<tr>
										<td class="formtext">�̸���</td>
										<td valign="middle"><input type="text" name="email"
											size="15" maxlength="15" style="width: 100px; height: 26px;">

									</tr>
								</table>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 30px;"><input
								type="submit" value="��й�ȣ ã��" class="submit"></td>
						</tr>


					</table> <!-- ����� ���� -->
					<table>
						<s:if test="resultClass.password != null">
							<td>RESULT&nbsp;:&nbsp;</td>
							<td align="left"><br> <b><s:property value="resultClass.ID" /></b>
								���� PW�� <b><s:property value="resultClass.password" /></b>�Դϴ�.<br>&nbsp;</td>
						</s:if>
					</table>

				</td>
			</tr>
		</table>
	</form>

</body>
</html>
