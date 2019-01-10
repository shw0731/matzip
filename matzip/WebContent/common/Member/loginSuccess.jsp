<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%

String referer = request.getHeader("referer");
 if(referer==null)referer = "/";
 %>
     <script language="javascript">
      location.href="<%=referer%>";
     </script>

</head>
<body>
</body>
</html>