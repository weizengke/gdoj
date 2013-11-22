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
    <title>Users</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
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
  		<a href="admin">Admin</a>
  		  	  <a href="admin/news">News</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     		<a href="admin/privilege">Privilege</a>	
     	</div>
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left">Users</div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable ">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>
				<table class="standings">
					 <tr class="header" style="">  
		               	 <th  class="rank left-item">#</th>
		               	 <th  class="coder"><s:text name="author"/></th>
		               	 <th  class="motto"><s:text name="motto"/></th>
		                 <th  class="" style="text-align:center;"> = </th>
		                 <th  class="rating">*</th>
	                </tr>
	                <s:if test="usersList.size==0">
	                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="usersList" status="st">	
	            	<tr class="<s:if test="#st.odd">dark</s:if> <s:if test="#session.session_username==username">my</s:if>">
	            		<td class="rank left-item"><s:property value="(page-1)*pageSize+#st.index+1"/></td>
	            		<td class="coder">
	            			<div style="text-align:left;">
	            			<b><a href="profile/<s:property value="username"/>"><s:property value="username"/></a></b>
	            			</div>
	            			<div style="font-size:11px;padding-top:1px;text-align:left;color: grey;">
	            			<s:property value="nickname"/>,<s:property value="school"/>,Email:<a href="mails/new/<s:property value="username"/>"><s:property value="email"/></a>
	            			</div>
	            		</td>
	            		<td class="motto"><s:property value="motto"/></td>
	            		<td class="">
	            		<a href="problemset/status/with/<s:property value="username"/>/page/1" ><s:property value="solved"/></a>
	            		/<a href="problemset/status/with/<s:property value="username"/>/page/1" ><s:property value="submit"/></a>
	            		</td>
	            		<td class="rating"><s:property value="rating"/></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>				  	 
	   </div>   
		<div style="margin-right: 12px;font-size:15px;">
				<div class="left"></div>
				<div class="right">
					<s:if test="page>1">
						<a href="admin/user/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="admin/user/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>	
					<s:if test="page < pageCount">		
						<a href="admin/user/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>		
			</div>
		</div>       	    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
