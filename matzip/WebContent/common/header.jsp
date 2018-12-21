
<script>
function validation(){
	
	var frm=document.JoinForm;
	
	
	if(frm.ID.value==""){
		alert("아이디를 입력해 주세요.");
		return false;
	}
	else if(frm.password.value==""){
		alert("비밀번호을 입력해 주세요.");
		return false;
	}else if(frm.name.value==""){
		alert("이름을 입력해주세요.");
		return false;
	}
	else if(frm.email.value==""){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	else if(frm.isType.value==""){
		alert("회원유형을 선택해주세요.");
		return false;
	}else if(frm.password.value!=frm.comPassword.value){
		alert("비밀번호가 동일하지 않습니다.");
		return false;
	}
	return true;
	
}


function openConfirmId(){	
	var id = document.getElementById('user_id').value;
		if(id.length == 0){
		alert("아이디를 입력하세요.");
		Joinform.ID.focus();
		return false;                 
	}else{
		return true;
	}
}
</script>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>맛.zip - 지역별 맛집 검색 </title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="/css/agency.css" rel="stylesheet">

  </head>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/index.jsp">맛.zip</a>
        
        
         <input type="text" class="search-bar" style="width:200px; height:40px;"/>
         <button type="button" id="searchbtn" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" onclick="goReplace('/common/search/search.jsp')">검색</button>
          <ul class="navbar-nav text-uppercase ml-auto">
            
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalLoginForm">LOGIN</button>
          </ul>
        
      </div>
    </nav>
    
    <!-- login -->
    
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
          <input type="email" id="defaultForm-email" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-email">Your ID</label>
        </div>

        <div class="md-form mb-4">
          <i class="fa fa-lock prefix grey-text"></i>
          <input type="password" id="defaultForm-pass" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalJoinForm">Join</button>
        <button class="btn btn-primary btn-lg">Login</button>
      </div>
    </div>
  </div>
</div>

<!-- Join -->

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
          <s:textfield name="ID" theme="simple" value="%{resultClass.ID}"/>
          <input button type="button" name="confirm_id" value="Check" onclick="openConfirmId()"/><br>
       </div></div>
      <div class="modal-body mx-2">
        <div class="md-form mb-2">
          <i class="fa fa-user prefix grey-text"></i>
          <input type="text" name="name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
          <s:textfield name="name" theme="simple" value="%{resultClass.name}" />
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-mobile prefix grey-text"></i>
          <input type="text" name="phoneNumber" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your phone</label>
          <s:textfield name="phoneNumber" theme="simple" value="%{resultClass.phoneNumber}" /><br>
        </div>
		<div class="md-form mb-2">
          <i class="fa fa-envelope prefix grey-text"></i>
          <input type="email" name="email" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">E-mail</label>
          <s:textfield name="email" theme="simple" value="%{resultClass.email}" /><br>
        </div>
        <div class="md-form mb-2">
          <i class="fa fa-lock prefix grey-text"></i>
          <input type="password" name="password" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
        <s:password name="password" theme="simple" value="%{resultClass.password}" />
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
    
    
        <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/js/agency.min.js"></script>
    
    <script type="text/javascript">
    function goReplace(str) { location.replace(str); }


    </script>