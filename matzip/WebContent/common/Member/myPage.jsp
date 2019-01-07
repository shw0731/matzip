 <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
   
 <head>
     <style>
      p {
        font-family: 'Abel', sans-serif;
        font-size: 23px;
      }
      p.a {
        font-weight: 200;
      }
      p.b {
        font-weight: 700;
      }
      p.c {
        font-weight: 800;
      }
      p.d {
        font-weight: bold;
      }
    </style>
<link href="https://fonts.googleapis.com/css?family=Abel|Thasadith" rel="stylesheet">
  </head>
  
 <script>
  function Modify(){
	 var url="http://localhost:8080/common/Member/myPageModify.jsp"
	 
		 open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
		 "scrollbars=no,resizable=no,width=500,height=250");
 }
  
  function delConfirm(){
	  if(confirm('정말 탈퇴하시겠습니까?')){
	  }else{
		  alert('취소되었습니다.');
		  return false;
	  }
  }
  function LikeList(){
		 var url="http://localhost:8080/common/like/LikeList.jsp"
		 
			 open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
			 "scrollbars=no,resizable=no,width=630,height=400");
	 }
  </script>
  

 <div class="modal fade" id="modalmyPageForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
  
  <!-- 회원 -->
  <s:if test="session.isType==0">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">My Page</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Modal body -->
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
         <p class="b">♥　${session.ID} </p>
          	<%-- </i><button type="button" class="btn btn-primary collapsed" data-toggle="modal" data-target=#modalModifyForm"><small>정보수정</small></button> --%>
          </i><a href="javascript:Modify();"><small>정보수정</small></a>
          <a href="javascript:LikeList();"><small>내가 좋아요 한 리스트 관리</small></a>

                    
          <ul>
          <small><li>MyName : ${session.name}</small></li>
          <small><li>MyEmail : ${session.email}</small></li>
          <small><li>MyPhoneNumber : ${session.phoneNumber}</small></li>
          
          </ul>
          </div>
        <div class="md-form mb-5">
        
          <p class="b">♥　My Point : <strong><a href="">${session.point}점</p></strong></a></i>
          <!-- 예약현황 -->
          <div>
          <ul>
          	<li>할매순댓국</li>
          </ul>
          </div>
          <!--예약현황 END -->
          
          
          <!-- 마이 리뷰-->
         <div class="md-form mb-5">
        <p class="b"> <label for="">♥　My Review</label></p>
         	<ul>
          	<li>존나마싯쓰</li>
          </ul>
         </div>
         <!--마이리뷰 END  -->
         
         
        </div>
      </div>
      <!--Modal Footer -->
      <div class="modal-body mx-3">
      <p class="b">♥　My List</i></p>
      </div>
    <div class="modal-body mx-3">
      	<ul>
      		<li>
      			<i class="fas fa-utensils"></i> 개마싯쓰 	
      			</li>
   		</ul>
   		<ul>
      		<li>
      			<i class="fas fa-utensils"></i> 쑝마시쓰 	
      			</li>
   		</ul>
     </div>
     
     <a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger pull-right" style="cursor:pointer" onclick="window.open('no_listAction.action?currentPage=<s:property value="currentPage" />','공지','scrollbars=yes, width=650, height=650,');">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;
     
          <!-- 탈퇴 -->
     <form name="deleteAction" action="MemberDeleteAction.action" onsubmit="return delConfirm()">
     <input class="btn btn-link" type="submit" value="탈퇴하기"></td></div>
    </form>
    </div>
  </div>
  </s:if>
 <%@ include file="/common/Member/myPageOwner.jsp"%>
 <%@ include file="/common/Member/myPageManager.jsp"%>