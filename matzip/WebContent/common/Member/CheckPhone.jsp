<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="euc-kr" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">

function window.close(){
	opener.document.joinform.phoneNumber.value="${phoneNumber}";
	self.close();
}
function check() {
	var f=document.checkPhone;  //문서.Form name="";
	if(f.phoneNumber.value==""){
		alert("번호를 입력해주세요.");
		f.phoneNumber.focus();
		return false;
	}
}
</script> 
</head>
<body bgcolor=#f5f5f5>
<s:if test="chkNo==1">
	<form name = "checkPhone" action="CheckPhoneAction.action" method="post" onsubmit="return check()">
	<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
		<tr align=center>
			<td height=30>
				<font><b>
				이미 사용 중인 번호입니다!</font>
				<br/><br/>
					<input type="button" value="닫기" onclick="window.close()"/>
			</td>
		</tr>
	</form>
</s:if>

<s:else>
	<table width=400 border=0 cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>
				<br><br>
				입력하신 번호는
				사용할 수 있습니다.</font>
				<br/><br/>
				<input type="button" value="닫기" onclick="window.close()"/>
			</td>
		</tr>
	</table>
</s:else>
</body>
</html>