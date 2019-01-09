 <%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<meta charset="UTF-8" />
 <head>
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  </head>
 <style>  
.nanum{
  font-family: 'Do Hyeon', sans-serif;
}
</style>
 <div class="modal fade" id="searchFilter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
<link rel="stylesheet" href="css/checkbox.css">
<p class="nanum" style="font-size: 18pt" align="center">지역별</p>
<div class="container-b">
  <input type="checkbox" id="Checkbox" name="filter_address[]" value="강남">
  <label for="Checkbox">
    <span class="label-name">&nbsp;&nbsp;<b>강남</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  
  <input type="checkbox" id="Checkbox2" name="filter_address[]" value="역삼">
  <label for="Checkbox2">
    <span class="label-name">&nbsp;&nbsp;<b>역삼</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  
  <input type="checkbox" id="Checkbox3" name="filter_address[]" value="신사동">
  <label for="Checkbox3">
    <span class="label-name">&nbsp;&nbsp;<b>신사동</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  <input type="checkbox" id="Checkbox4" name="filter_address[]" value="구로구">
  <label for="Checkbox4">
    <span class="label-name">&nbsp;&nbsp;<b>구로구</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  <input type="checkbox" id="Checkbox5" name="filter_address[]" value="신림">
  <label for="Checkbox5">
    <span class="label-name">&nbsp;&nbsp;<b>신림</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
   <input type="checkbox" id="Checkbox6" name="filter_address[]" value="마포구">
  <label for="Checkbox6">
    <span class="label-name">&nbsp;&nbsp;<b>마포구</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
 
</div>
<p class="nanum" style="font-size: 18pt" align="center"><b>카테고리 별</b></p>
<div class="container-b">
  <input type="checkbox" id="Checkbox7" name="filter_category[]" value="중식">
  <label for="Checkbox7">
    <span class="label-name">&nbsp;&nbsp;<b>중식</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  
  <input type="checkbox" id="Checkbox8" name="filter_category[]" value="일식">
  <label for="Checkbox8">
    <span class="label-name">&nbsp;&nbsp;<b>일식</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  
  <input type="checkbox" id="Checkbox9" name="filter_category[]" value="양식">
  <label for="Checkbox9">
    <span class="label-name">&nbsp;&nbsp;<b>양식</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  <input type="checkbox" id="Checkbox10" name="filter_category[]" value="한식">
  <label for="Checkbox10">
    <span class="label-name">&nbsp;&nbsp;<b>한식</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
  <input type="checkbox" id="Checkbox11" name="filter_category[]" value="세계">
  <label for="Checkbox11">
    <span class="label-name">&nbsp;&nbsp;<b>세계</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
   <input type="checkbox" id="Checkbox12" name="filter_category[]" value="뷔페">
  <label for="Checkbox12">
    <span class="label-name">&nbsp;&nbsp;<b>뷔페</b></span>
    <div class="checkmark">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" xml:space="preserve"><g><path d="M50,91C27.393,91,9,72.607,9,50S27.393,9,50,9s41,18.393,41,41S72.607,91,50,91z M50,16   c-18.748,0-34,15.252-34,34c0,18.748,15.252,34,34,34c18.748,0,34-15.252,34-34C84,31.252,68.748,16,50,16z"/></g><path d="M66.141,39.393c-1.367-1.366-3.582-1.366-4.949,0L47.403,53.182l-6.594-6.594  c-1.367-1.366-3.583-1.366-4.95,0c-1.367,1.367-1.367,3.583,0,4.95l9.066,9.066c0.001,0.001,0.001,0.002,0.002,0.003  c0.684,0.684,1.58,1.025,2.475,1.025l0,0c0,0,0,0,0,0c0.896,0,1.792-0.342,2.475-1.025c0.002-0.002,0.003-0.004,0.004-0.005  l16.258-16.258C67.508,42.976,67.508,40.76,66.141,39.393z"/></svg>
    </div>
  </label>
   
   
    
      <div class="modal-footer d-flex justify-content-center">
        <button type="button" class="btn btn-primary" onclick="javascript:fn_get_filter(); return false;">적용</button>
      </div>
      
    </div>
  </div>
</div>
</div>
 <script type="text/javascript">
var fn_get_filter = function(){
    	
   		var address_data = '';
   		var address = $("input[name='filter_address[]']");
   		for(i=0;i<address.length;i++) {
   		    if (address[i].checked == true){
   		    		address_data += address[i].value+'|';
   		    }
   		}
   		address_data.slice(0,-1);
   		var category_data = '';
   		var category = $("input[name='filter_category[]']");
   		for(i=0;i<category.length;i++) {
   		    if (category[i].checked == true){
   		        category_data += category[i].value+'|';
   		    }
   		}
   		category_data.slice(0,-1);
   		$('#address').val(address_data);
   		$('#category').val(category_data);
   		
   		$('#searchFilter').modal('hide');
   		$('.modal-backdrop').css('display','none');
   		
    }
    
    
    
</script>