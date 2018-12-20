<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap.min.css'/>
<script>
function validation(){
	
	var frm=document.forms(0);
	
	if(frm.ID.value==""){
		alert("아이디를 입력해 주세요.");
		return false;
	}
	else if(frm.password.value==""){
		alert("비밀번호을 입력해 주세요.");
		return false;
	}
	else if(frm.email.value==""){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	else if(frm.isType.value==""){
		alert("회원유형을 선택해주세요.");
		return false;
	}
	return true;
	
}


function openConfirmId(Joinform){	
	var id = Joinform.ID.value;
	
	if(id.length == 0){
		alert("아이디를 입력하세요.");
		Joinform.ID.focus();
		return false;
	} else{
		
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=400,height=200");
}
</script>

</head>
<body>

<br/>
<br/>
<br/>
<br/>
<br/>

<form name="Joinform" action="JoinAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation(this)">

	ID : <s:textfield name="ID" theme="simple" value="%{resultClass.ID}" />
	<input type="button" name="isCheck" value="중복확인" onclick="openConfirmId(this.form)" /><br>
	password : <s:password name="password" theme="simple" value="%{resultClass.password}" /><br>
	email : <s:textfield name="email" theme="simple" value="%{resultClass.email}" /><br>
	Type :
	<input type="radio" name="checkType" value="0"/>일반회원
	<input type="radio" name="checkType" value="1"/>점주
	<br><br>
	<input name="submit" type="submit" value="작성완료" >
</form>

<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>