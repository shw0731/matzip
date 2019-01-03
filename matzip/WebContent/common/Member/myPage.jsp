 <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
    <% String id=session.getId();
    %>
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
  </script>

 <div class="modal fade" id="modalmyPageForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
  
  <!-- 회원 -->
  <s:if test="resultClass.isType==0">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">마이페이지</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <a href="#"><small>고객센터</small></a>
      </div>
      <!--Modal body -->
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fa fa-id-badge prefix grey-text">
          	　${resultClass.ID}
          	<%-- </i><button type="button" class="btn btn-primary collapsed" data-toggle="modal" data-target=#modalModifyForm"><small>정보수정</small></button> --%>
          </i><a href="javascript:Modify();"><small>정보수정</small></a>
          <ul>
          <small><li>MyName : ${resultClass.name}</small></li>
          <small><li>MyEmail : ${resultClass.email}</small></li>
          <small><li>MyPhoneNumber : ${resultClass.phoneNumber}</small></li>
          
          </ul>
          </div>
        <div class="md-form mb-5">
          <i class="fa fa-id-badge prefix grey-text">　My Point : <strong><a href="">${resultClass.point}점</strong></a></i>
          
          <!-- 예약현황 -->
          <div>
          <ul>
          	<li>할매순댓국</li>
          </ul>
          </div>
          <!--예약현황 END -->
          
          
          <!-- 마이 리뷰-->
         <div class="md-form mb-5">
         <label for="">　　My Review</label>
         	<ul>
          	<li>존나마싯쓰</li>
          </ul>
         </div>
         <!--마이리뷰 END  -->
         
         
        </div>
      </div>
      <!--Modal Footer -->
      <div class="modal-footer d-flex justify-content-center">
      
      <i class="fas fa-heart w-100"><small>My List</small></i>
      </div>
    <div class="">
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
          <!-- 탈퇴 -->
     <form name="deleteAction" action="MemberDeleteAction.action" onsubmit="return delConfirm()">
     <input type="submit" value="탈퇴하기" class="submit"></td>
    </form>
    </div>
  </div>
  </s:if>
 <%@ include file="/common/Member/myPageOwner.jsp"%>
  
  <!-- 관리자 페이지 -->
  <s:else>
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">관리자페이지</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <p><a href="#"><small>고객센터</small></a></p>	
      </div>
      <!--Modal body -->
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fa fa-id-badge prefix grey-text">
          	${resultClass.ID}
          </i><a href="#"><small>정보수정</small></a>
        </div>
        <div class="md-form mb-5">
          <i class="fa fa-gem prefix grey-text"><a href=""><small>잔여포인트 : <strong>${resultClass.point}점</strong></small></a></i>
          
          <!-- 예약현황 -->
          <div>
          <ul>
          	<li>할매순댓국</li>
          </ul>
          </div>
          <!--예약현황 END -->
          
          
          <!-- 마이 리뷰-->
         <div>
         <label for="">My Review</label>
         	<ul>
          	<li>존나마싯쓰</li>
          </ul>
         </div>
         <!--마이리뷰 END  -->
         
         
        </div>
      </div>
      <!--Modal Footer -->
      <div class="modal-footer d-flex justify-content-center">
      
      <i class="fas fa-heart w-100"><small>관심 목록</small></i>
      </div>
    <div class="">
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
    </div>
  </div>
  </s:else>
</div>