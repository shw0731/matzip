
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<form name="ReviewModifyAction" action="ReviewModifyAction.action" method="post" enctype="multipart/form-data">

  <s:hidden name="restaurantNo" value="%{restaurantNo}" />
  <s:hidden name="reviewNo" value="%{reviewNo}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		
   <div class="modal-er text-center" style="text-align:center">
        <h4 class="modal-title w-100 font-weight-bold">Review Modify</h4>
      </div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm" cols="40">제목</span>
    <input type="text" name="subject" class="form-control validate">
  </div>
  </div>
 <div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <textarea class="form-control" cols="40" rows="5" name="context">내용</textarea>
  </div></div>
   <div class="col-xs-4">
</div>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">별점</span>
    <input type="text" name="starPoint" class="form-control validate">
  </div>
   <div class="col-xs-4">
   
   <s:file label="File[1]" name="uploads" />
</div></div>

 <input class="btn btn-info" type="submit" value="수정하기"></input></form>
 
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>