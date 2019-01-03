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
<!-- <div class="modal fade" id="modalModifyForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-er text-center">
        <h4 class="modal-title w-100 font-weight-bold">MyPage Modify</h4>
        </button>
      </div>
      <div class="modal-body mx-2">
        <div class="md-form mb-2">
          <i class="fa fa-id-badge prefix grey-text"></i>

       </div></div>
        <form name="MemberModifyAction" action="MemberModifyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">

        <div class="md-form mb-2">
          <i class="fa fa-mobile prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your phone</label>
          <input type="text" name="phoneNumber" class="form-control validate">
        </div>
		<div class="md-form mb-2">
          <i class="fa fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-email">♥ E-mail</label>
          <input type="email" name="email" class="form-control validate">
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">♥ Your password</label>
          <input type="password" name="password" class="form-control validate">
        </div>

		<div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">♥ Confirm Password</label>
          <input type="password" name="comPassword" class="form-control validate">
        </div>
        <div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ E-mail</span>
  </div>
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Your password</span>
  </div>
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Confirm Password</span>
  </div>
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>
         <input button class="btn btn-deep-orange" type="submit" value="수정하기"></input>
      </div>
      <div class="modal-footer d-flex justify-content-center">
       
      </div>
    </div>
      </form>
  </div>
</div> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<form name="MemberModifyAction" action="MemberModifyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">
   <div class="modal-er text-center" style="text-align:center">
        <h4 class="modal-title w-100 font-weight-bold">MyPage Modify</h4>
      </div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ E-mail</span>
  </div>
   <div class="col-xs-4">
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
   </div>
</div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Your password</span>
  </div>
   <div class="col-xs-4">
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div></div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ Confirm Password</span>
  </div>
   <div class="col-xs-4">
  <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div></div>

 <input class="btn btn-info" type="submit" value="수정하기"></input>
 
 
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>