<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 
 <script>
 
function validation(){
	
	var frm=document.MemberModifyAction;
	if(frm.password.value!=frm.comPassword.value){
		alert("비밀번호가 동일하지 않습니다.");
		return false;
	}
	else if(frm.password.value==""){
		alert("비밀번호을 입력해 주세요.");
		return false;
	}
	return true;
	
}
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<form name="MemberModifyAction" action="MemberModifyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">
   <div class="modal-er text-center" style="text-align:center">
        <h4 class="modal-title w-100 font-weight-bold">MyPage Modify</h4>
      </div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ E-mail</span>
    <input type="email" name="email" class="form-control validate">
  </div>
</div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Your password</span>
    <input type="password" name="password" class="form-control validate">
  </div>
   <div class="col-xs-4">
</div></div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Confirm Password</span>
    <input type="password" name="comPassword" class="form-control validate">
  </div>
   <div class="col-xs-4">
</div></div>

 <input class="btn btn-info" type="submit" value="수정하기"></input>
 
 
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>