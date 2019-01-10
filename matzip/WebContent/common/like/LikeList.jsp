<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix = "s" uri = "/struts-tags" %>



<html>
<head>
<title>좋아요 리스트</title>
<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="/css/agency.css" rel="stylesheet">
</head>
<body>

	<table class="table">
		<thead class="thead-light">
			<tr>
				<th scope="col"></th>
				<th scope="col">음식점 명</th>
				<th scope="col">평점</th>
				<th scope="col">삭제 여부</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="likeList" status="stat">
				<tr>
					<th scope="row"><s:property value="#stat.index + 1"/></th>
					<td><s:property value="restaurantName" /></td>
					<td><s:property value="starPoint" /></td>
					<td><button type="button" name="confirm_id"
							onclick="deleteLikes(<s:property value='restaurantNo'/>,<s:property value='ID'/>);">좋아요
							삭제</button></td>
				</tr>
			</s:iterator>

		
		</tbody>
	</table>
	<s:if test="likeList.size() <= 0">
				
	     
				등록된 게시물이 없습니다.
        
   	</s:if>
</body>
</html>
<script>
function deleteLikes(restaurantNo,ID){
	
	
	var url='DeleteLikeAction.action?ID='+ID+'&'+'restaurantNo='+restaurantNo;
	
	
	open(url, "좋아요 삭제", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=600,height=200");
}
</script>