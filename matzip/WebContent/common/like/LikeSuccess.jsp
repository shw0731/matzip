<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 완료</title>
</head>
<body>
<script language="javascript">
	window.onload = function() {
		if(<s:property value="isUpdate"/>){
		alert("등록이 완료되었습니다.");
		window.close();
		}else{
			alert("이미 등록이 되어있습니다.");
			window.close();
		}
	}
</script>
</body>
</html>