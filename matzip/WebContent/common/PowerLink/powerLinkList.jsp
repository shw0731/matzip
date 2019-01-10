<%@ page session="true" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
  
  <body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>PowerLink List</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  <div style="text-align:center">
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="20"><strong>RestaurantName</strong></td>
      		
      		<td width="20"><strong>management</strong>
      		</td>
      	
	
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	      <s:iterator value="List" status="stat">

		
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="restaurantName" />
        		</td>
                  <td align = "center">
                  <s:if test="state==0">
                  	<button type="button"
							onclick="UpdatePowerAction(<s:property value='restaurantNo'/>);">등록</button>
                  </s:if>
                  <s:if test="state==1">
                  	<button type="button"
							onclick="DeletePowerAction(<s:property value='restaurantNo'/>);">삭제</button>
                  </s:if>
                  </td>
      	      </tr>

	      </s:iterator>
			
	      <s:if test="List.size() <= 0">
				
	      <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
		
	
	</table>
	</div>
   </body>
</html>
<script>
function UpdatePowerAction(restaurantNo){
	
	
	var url='UpdatePowerAction.action?restaurantNo='+restaurantNo;
	
	
	open(url, "파워링크 등록", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=600,height=200");
}
function DeletePowerAction(restaurantNo){
	
	
	var url='DeletePowerAction.action?restaurantNo='+restaurantNo;
	
	
	open(url, "파워링크 삭제", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=600,height=200");
}
</script>
