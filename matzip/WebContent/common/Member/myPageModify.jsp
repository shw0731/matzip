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
<div class="modal fade" id="modalModifyForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-er text-center">
        <h4 class="modal-title w-100 font-weight-bold">MyPage Modify</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-2">
        <div class="md-form mb-2">
          <i class="fa fa-id-badge prefix grey-text"></i>

       </div></div>
        <form name="MemberModifyAction" action="MemberModifyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">
         <div class="md-form mb-2">
          <i class="fa fa-mobile prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">ID</label> ${resultClass.ID}
        </div>
       <!--  <div class="md-form mb-2">
          <i class="fa fa-mobile prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your phone</label>
          <input type="text" name="phoneNumber" class="form-control validate">
        </div> -->
		<div class="md-form mb-2">
          <i class="fa fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-email">E-mail</label>
          <input type="email" name="email" class="form-control validate">
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
          <input type="password" name="password" class="form-control validate">
        </div>

		<div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Confirm Password</label>
          <input type="password" name="comPassword" class="form-control validate">
        </div>
         <input button class="btn btn-deep-orange" type="submit" value="수정하기"></input>
      </div>
      <div class="modal-footer d-flex justify-content-center">
       
      </div>
    </div>
      </form>
  </div>
</div>