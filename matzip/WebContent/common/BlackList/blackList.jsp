<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 
 <script>
 
function validation(){
	
	var frm=document.BlackListAction;
	
     if(frm.phoneNumber.value==""){
		alert("번호를 입력해 주세요.");
		return false;
	}
	return true;
	
}
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<form name="BlackListAction" action="BlackListAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">
   <div class="modal-er text-center" style="text-align:center">
        <h4 class="modal-title w-100 font-weight-bold">BlackList register</h4>
      </div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">♥ blackList phoneNumber </span>
    <input type="text" name="phoneNumber" class="form-control validate">
  </div>
</div>
<div style="text-align:center">
 <input class="btn btn-info" type="submit" value="등록하기"></input>
 </div>
 
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>