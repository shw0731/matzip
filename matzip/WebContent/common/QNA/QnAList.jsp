<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="euc-kr" ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>1:1 문의게시판</title>
<style>

.button{
  display:;
  text-decoration: none;
  padding: 9px;
  width: 70px;
  border: none;
  border-radius: 5px;
  text-align: center;
  color: #FFF;
  background: #407775;
  font-family: sans-serif;
  font-size: 15px;
  cursor: pointer;
  margin-top: -470px;

}

.button:hover{
  background: #2c3e50;
}

#pagingnum	{  
	margin-top:300px;
     text-align:center; 
     color:#00cdcd;
     font-size:15px;
}

#input-write{
	text-align:right;
	color:#00cdcd;
	font-size:15px;
	font-weight: bold;
	 padding: 450px;

}

</style>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
		<link rel="stylesheet" href="/YammyYammy/css/admin/qna.css">

</head>
<body>
  <section class="section--top">
  <!--for demo wrap-->
  <h1>Q&A 게시판</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th><strong>번	호</strong></th>
          <th width="350"><strong>제	목</strong></th>
          <th><strong>글 쓴 이</strong></th>
          <th><strong>등록날짜</strong></th>
        
          
        	</tr>
    	  </thead>
   	 </table>
  		</div>
 	 <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
<tbody>
        
	<s:iterator value="list" status="stat">

		<s:url id="qnaViewURL" action="QnAViewAction" >
			<s:param name="serviceno">
				<s:property value="serviceno" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr>
				<td align="center"><s:property value="serviceno" /></td>
				<td width="350" align="center"><s:a href="%{qnaViewURL}"><s:property value="subject" /></s:a></td>
				<td align="center"><s:property value="id" /></td>
				<td align="center"><s:property value="reg_date" /></td>
				
		</tr>
		<tr>
			<td></td>
		</tr>
			
	      </s:iterator>
			
		<s:if test="list.size() <= 0">
				
			<tr align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>						
			<tr>
				<td height="1" colspan="5"></td>
			</tr>
    		
		</s:if>
		    	

		</tbody>
    </table>

  </div>
</section>
<br/><br/><br/><br/><br/><br/><br/>
    		 <div id="pagingnum"><s:property value="pagingHtml"  escape="false" /></div>
    
    
    		
		
		<div id="input-write">
  <%--  <s:if test='%{#session.member_email != null}'> --%>
    <input name="write" type="button" value="글쓰기" class="button" onClick="javascript:location.href='QnAWriteForm.action?currentPage=<s:property value="currentPage" />'"/>
   
   <%--  </s:if> --%>
    </div>
		
   </body>
