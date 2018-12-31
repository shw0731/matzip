
<div class="modal fade" id="modalJoinForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-2">
        <div class="md-form mb-2">
          <i class="fa fa-id-badge prefix grey-text"></i>
          <form name="JoinForm" action="JoinAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation()">
          <input type="text" id="user_id" name="ID" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">ID</label>
         
          <input button type="button" name="confirm_id" value="Check" onclick="openConfirmId()"/><br>
       </div></div>
      <div class="modal-body mx-2">
        <div class="md-form mb-2">
          <i class="fa fa-user prefix grey-text"></i>
          <input type="text" name="name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
         
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-mobile prefix grey-text"></i>
          <input type="text" name="phoneNumber" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your phone</label>
      
        </div>
		<div class="md-form mb-2">
          <i class="fa fa-envelope prefix grey-text"></i>
          <input type="email" name="email" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">E-mail</label>
        
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <input type="password" name="password" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
       
        </div>

		<div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <input type="password" name="comPassword" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Confirm Password</label>
        </div>
        Type<br/>
        <input type="radio" name="isType" value="0"/>a general member
	    <input type="radio" name="isType" value="1"/>a store-owner
	    <br><br>
        
        
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <input class="btn btn-deep-orange" type="submit"></input>
      </div>
     
      </form>
    </div>
  </div>
</div>