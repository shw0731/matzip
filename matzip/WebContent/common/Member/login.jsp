 
<script>
 //로그인할때
function checkValue(){
	var frm=document.LoginForm;
	if(frm.ID==""){
		alert("아이디를 입력해 주세요.");
		return false;
	}
	else if(frm.password==""){
		alert("비밀번호를 입력해 주세요.");
		return false;
	}
	return true;
}

 function findPasswd(){
	 var url="http://localhost:8080/FindPwAction.action"
	 
		 open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
		 "scrollbars=no,resizable=no,width=600,height=400");
 }
</script>
 
 <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">LOGIN</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fa fa-id-badge prefix grey-text"></i>
          <form name="LoginForm" action="LoginAction.action" method="post" enctype="multipart/form-data" onsubmit="return checkValue()">
          <input type="text" name="ID" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-ID">Your ID</label>
        </div>

        <div class="md-form mb-4">
          <i class="fa fa-lock prefix grey-text"></i>
          <input type="password" name="password" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
        </div>
      </div>
 <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-primary btn-lg" data-toggle="modal" type="button" data-target="#modalJoinForm">Join</button>
        <!-- <button type="button" class="btn btn-primary btn-lg" >Login</button> -->
        <input button type="submit" class="btn btn-primary btn-lg" value="Login" onclick="return checkValue()"/>
     <p>
     <br/><a onclick="jsfunction()" href="javascript:findPasswd();">Forgot Password?</a>
      </div>
      </form>
    </div>
  </div>
</div>