<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script language="javascript">
var isUpload = <s:property value='isUpdate'/>;

window.onload = function() {
	if(isUpload=="1"){
	alert("신청이 완료되었습니다.");
	opener.parent.location.reload();
	window.close();
	
	}else{
		alert("이미 신청이 되어있습니다.");
		opener.parent.location.reload();
		window.close();
	}
}
</script>
</body>
</html>