<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료</title>
</head>
<body>
<script language="javascript">
	window.onload = function() {
		alert("수정이 완료되었습니다.");
		opener.parent.location.reload();
		window.close();
		
	}
</script>
</body>
</html>