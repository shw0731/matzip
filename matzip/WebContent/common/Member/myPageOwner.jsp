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
  <s:elseif test="session.isType==1">
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

          	<text align=right padding="5">${session.ID} 님의 방문을 환영합니다.<small>&nbsp;&nbsp;</small><br>
			<a href="javascript:Modify();" target="_blank", width="100" border="0" class="btn btn-outline-warning btn-lg  text-uppercase js-scroll-trigger" style="cursor:pointer"><small>정보수정</small></a><small>&nbsp;&nbsp;</small></text><br>
<%-- 			<a href="javascript:location.href='#.action?currentPage=<s:property value="currentPage" />';" target="_blank", width="100" border="0" class="btn btn-outline-warning btn-lg  text-uppercase js-scroll-trigger" style="cursor:pointer"><small>고객센터</small></a><small>&nbsp;&nbsp;</small></text><br>
 --%>
          	<text align=center>
          	
          	<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('WriteForm.action?currentPage=<s:property value="currentPage" />','음식점페이지 입력','scrollbars=yes, width=650, height=650,');">나의 음식점 등록</a></p> &nbsp;&nbsp;&nbsp;&nbsp;
          	<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('modifyForm.action?currentPage=<s:property value="currentPage" />','음식점페이지 수정','scrollbars=yes, width=650, height=650,');">음식점 정보 수정</a></p>&nbsp;&nbsp;&nbsp;&nbsp;
<%--           	<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('list.action?currentPage=<s:property value="currentPage" />','내 가게 리뷰 리스트','scrollbars=yes, width=650, height=650,');">내 가게 리뷰 보기</p></a>&nbsp;&nbsp;&nbsp;&nbsp;
 --%>          	<p class="b"><a href="javascript:location.href='deleteAction.action?currentPage=<s:property value="currentPage" />';" target="_blank", width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer">음식점 정보 삭제</a></p><br>
    		<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('no_listAction.action?currentPage=<s:property value="currentPage" />','공지','scrollbars=yes, width=650, height=650,');">공지사항</a></p>&nbsp;&nbsp;&nbsp;&nbsp;
    		<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="javascript:location.href='QnAList.action?currentPage=<s:property value="currentPage" />','QNA','scrollbars=yes, width=650, height=650,';">QnA</a></p>&nbsp;&nbsp;&nbsp;&nbsp;
    		<p class="b"><a href="#" width="100" border="0" class="btn btn-outline-warning btn-lg btn-block text-uppercase js-scroll-trigger" style="cursor:pointer" onclick="window.open('no_listAction.action?currentPage=<s:property value="currentPage" />','파워링크','scrollbars=yes, width=650, height=650,');">파워링크 신청</a></p>&nbsp;&nbsp;&nbsp;&nbsp;
    		<br><br><br><br>
  
  
  
  <form name="deleteAction" action="MemberDeleteAction.action" onsubmit="return delConfirm()">
     <input class="btn btn-link" type="submit" value="탈퇴하기"></td></div>
    </form>
  </div>
  </s:elseif>