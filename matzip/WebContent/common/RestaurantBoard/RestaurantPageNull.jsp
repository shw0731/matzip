<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류페이지</title>
</head>
<body>
<script language="javascript">
	window.onload = function() {
		alert("삭제할 페이지가 존재하지 않습니다.");
		history.go(-1);
	}
</script>
</body>
</html>