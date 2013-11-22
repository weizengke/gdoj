<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Contest - Registrants <s:property value="contest.title"/> - GUET Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  <!--  <script type="text/javascript" src="js/json.js"></script> -->	
  	<script type="text/javascript">
      $(document).ready(function() {
 
});
</script>  

  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
	

     <div id="content" > 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >
 
     	</div>
     	 <div style="width: 100%;position: relative;text-align: center;">
	        <h4>
				<s:property value="contest.title"/>
			</h4>
			Contest Registrants
	    </div>  
	    <div class="datatable" style="">	
	    		<div class="lt">&nbsp;</div>
	            <div class="rt">&nbsp;</div> 
	            <div class="lb">&nbsp;</div>
	            <div class="rb">&nbsp;</div>         
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="registrants"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>
				<table class="standings">
					 <tr class="header">
		               	 <th  class="id left-item">#</th>
		               	 <th  class="coder"><s:text name="author"/></th>
		               	 <th  class="solved"><s:text name="solved"/></th>
		                 <th  class="rating" ><s:text name="submit"/></th>
	                </tr>
	                <s:if test="userList.size==0">
	                 <tr ><td class="left-item dark" colspan="32" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
				    <s:iterator value="userList" status="st">
				    	<tr style="height: 42px;" class="<s:if test="#st.odd">dark</s:if> <s:if test="#session.session_username==username">my</s:if>">	
							<td class="id left-item"><s:property value="pageSize*(page-1)+#st.index+1"/></td>
							<td class="coder"><b><a href="profile/<s:property value="username"/>" class="user-tip" user="<s:property value="username"/>"><s:property value="username"/></a></b><s:if test="#session.session_username==username">&nbsp;<a href="contest/<s:property value="contestId"/>/UnRegisterContest" title ="UnRegister this contest?"><img src="img/delete.gif"></img></a></s:if></td>
							<td class="solved"><s:property value="solved"/></td>
							<td class="rating"><s:property value="submit"/></td>
						</tr>	
				   </s:iterator>
				</table>
		    </div>			  	 
	   </div> 
	   <div style="margin-right: 12px;">
			<div class="left"></div>
			<div class="right">
					<s:if test="page>1">
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < pageList.size">		
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
			</div>
		</div>          
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
