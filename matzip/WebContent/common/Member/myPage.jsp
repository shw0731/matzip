 <div class="modal fade" id="modalmyPageForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
    <!--Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">마이페이지</h4>
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
         <label for="">마이리뷰</label>
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
</div>