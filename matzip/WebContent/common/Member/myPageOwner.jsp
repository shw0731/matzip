 <%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
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

 <!-- 점주 -->
  <s:elseif test="resultClass.isType==1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">점주 페이지</h4><br>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Modal body -->

          	<text align=right padding="5">${resultClass.ID} 님의 방문을 환영합니다.<small>&nbsp;&nbsp;</small><br>
          </i><a href="javascript:location.href='MemberDeleteAction.action?currentPage=<s:property value="currentPage" />';" target="_blank", width="100" border="0" class="btn btn-primary btn text-uppercase js-scroll-trigger" style="cursor:pointer"><small>탈퇴하기</small></a>
			<a href="javascript:Modify();" target="_blank", width="100" border="0" class="btn btn-primary btn text-uppercase js-scroll-trigger" style="cursor:pointer"><small>정보수정</small></a>
			<a href="javascript:location.href='#.action?currentPage=<s:property value="currentPage" />';" target="_blank", width="100" border="0" class="btn btn-primary btn text-uppercase js-scroll-trigger" style="cursor:pointer"><small>고객센터</small></a><small>&nbsp;&nbsp;</small></text><br>

          	<text align=center>
          	<a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('WriteForm.action?currentPage=<s:property value="currentPage" />','음식점페이지 입력','scrollbars=yes, width=650, height=650,');">나의 음식점 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
          	<a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('modifyForm.action?currentPage=<s:property value="currentPage" />','음식점페이지 수정','scrollbars=yes, width=650, height=650,');">음식점 정보 수정</a><br><br>
          	<a href="#" width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('list.action?currentPage=<s:property value="currentPage" />','내 가게 리뷰 리스트','scrollbars=yes, width=650, height=650,');">내 가게 리뷰 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;
          	<a href="javascript:location.href='deleteForm.action?currentPage=<s:property value="currentPage" />';" target="_blank", width="100" border="0" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" style="cursor:pointer">음식점 정보 삭제</a><br><br><br><br>
    
  </div>
  </div>
  </s:elseif>