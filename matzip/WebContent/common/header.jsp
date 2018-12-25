<%@ taglib prefix="s" uri="/struts-tags" %>
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

function checkValue(){
	var frm=document.forms(0);
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


function openConfirmId(){	
	var id = document.getElementById('ID').value;
		if(ID.length == 0){
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Custom styles for this template -->
    <link href="/css/agency.css" rel="stylesheet">

  </head>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/index.jsp">맛.zip</a>
        
        
         <input type="text" class="search-bar" style="width:200px; height:40px;"/>
         <button type="button" id="searchbtn" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" onclick="goReplace('/common/search/search.jsp')">검색</button>
         <!-- <button type="button" id="searchbtn" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" onclick="javascript:data_check(); return false;">검색</button> -->
         
          <button id="filter" class="btn btn-primary" data-toggle="modal" data-target="#searchFilter"><i class="fa fa-sliders"></i></button>
          
          <ul class="navbar-nav text-uppercase ml-auto">
            <s:if test="session !=NULL">
             <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalmyPageForm">MYPAGE</button>
          </s:if>
          <s:else>
             <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalLoginForm">LOGIN</button>
          </s:else>
            
          </ul>
        
      </div>
    </nav>
    
    <!-- login -->
    
   <%@ include file="/common/Member/login.jsp"%>

<!-- Join -->

    <%@ include file="/common/Member/join.jsp"%>
    
    <!--  검색 필터 -->
    <%@ include file="/common/search/searchFilter.jsp"%>
    
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
	$(document).ready(function(){
		
	});  
    
    function goReplace(str) { location.replace(str); }
	    
    
    


    </script>