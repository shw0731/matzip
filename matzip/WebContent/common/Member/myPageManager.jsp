 <%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
 <script>

 function list(){
	 var url="ListPowerAction.action"
	 
		 open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
		 "scrollbars=no,resizable=no,width=600,height=400");
 }
 
 
 </script>
  <!-- 관리자 페이지 -->
  <s:else>
   <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">관리자 페이지</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Modal body -->
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          </div>
        <div class="md-form mb-5">

          <!-- 마이 리뷰-->
         <div class="md-form mb-5">
<!--         <p class="b"> <label for="">♥　BlackList</label><a href="javascript:list();">List</a> <a href="javascript:register();">regist</p></a>
 -->        <p class="b"> <label for="">♥<a href="http://localhost:8080/no_listAction.action">　Notice</label></p></a>
			<p class="b"> <label for="">♥<a href="http://localhost:8080/QnAList.action">　QnA</label></p></a>
			<p class="b"> <label for="">♥　PowerLink</label> <a href="javascript:list();">List</a>
         </div>
         <!--마이리뷰 END  -->
        </div>
      </div>
   </div>
    </div>
 
  </s:else>
  </div>