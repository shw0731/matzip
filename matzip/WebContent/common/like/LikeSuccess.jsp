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


</body>
</html>
<script language="javascript">
	var isUpload = <s:property value='isUpdate'/>;
	
	window.onload = function() {
		if(isUpload=="1"){
		alert("등록이 완료되었습니다.");
		
		
		}else{
			alert("이미 등록이 되어있습니다.");
			
		}
	}
</script>