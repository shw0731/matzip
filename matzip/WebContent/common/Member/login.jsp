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
          <form name="LoginForm" action="LoginAction.action" method="post" enctype="multipart/form-data" onsubmit="return openConfirmId()">
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
      </div>
      </form>
    </div>
  </div>
</div>