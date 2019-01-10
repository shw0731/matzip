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

	      <s:iterator value="list" status="stat">

		<s:url id="viewURL" action="power.ListPowerAction" >
			<s:param name="restaurantNo">
				<s:property value="restaurantNo" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="restaurantNo" />
        		</td>
                  <td align = "center"><%-- <s:property value = "phoneNumber" /> --%></td>
      	      </tr>

	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	      <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
			
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
    	
    	      <tr align="right">
    		<td colspan="5">
		</td>
    	       </tr>
	</div>
	</table>
   </body>
</html>

