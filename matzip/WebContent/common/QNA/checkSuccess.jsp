<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/struts2_board/board/common/css/css.css" type="text/css">
<script type="text/javascript">
	function locationURL()
	{
		if(window.name == 'modify'){
			window.opener.parent.location.href="QnAModifyForm.action?serviceno=<s:property value="serviceno" />&currentPage=<s:property value="currentPage" />";			
		}else if(window.name == 'delete'){
			alert('삭제 되었습니다.');
			window.opener.parent.location.href="QnADeleteAction.action?serviceno=<s:property value="serviceno" />&currentPage=<s:property value="currentPage" />";
		  }else if(window.name == 'cdelete'){
			alert('코멘트가 삭제 되었습니다.');
			window.opener.parent.location.href="deleteAction2.action?serviceno=<s:property value="serviceno" />&originno=<s:property value="originno" />&currentPage=<s:property value="currentPage" />"; 
		} 
		window.close();	
	}
</script>
</head>
<body>
<script>locationURL(); </script>
</body>
</html> 