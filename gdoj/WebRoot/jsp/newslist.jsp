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
    <title>News - GUET Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include>
  	<div id="body">
		 
		<div id="sidebar"> 	          
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	</div> <!-- End sidebar -->
	
     <div id="content" class="content-with-sidebar round0123"> 	 <!-- class="content-with-sidebar" -->
   		<div id="nav-content" >	
	    	  		
  	 	</div>
		 <!-- Ended  -->
		 
	<div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="news"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="topics">
					 <tr class="header">           	 
		               	 <th class="title left-item"><s:text name="topic.title"/></th>

		                 <th class="coder"><s:text name="topic.author"/></th>
		                 <th class="date"><s:text name="topic.date"/></th>
	                </tr>
	                <s:if test="newsList.size==0">
	                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no News.</td></tr>
	                </s:if>
					<s:iterator value="newsList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>      		

	            		<td class="title left-item">
	            			<s:if test="orderNum>0"><span style="color:red;">[<s:text name="topic.top"/>]</span></s:if>
	            			<a href="news/<s:property value="news_id"/>"><s:property value="title"/></a>
	            			
	            		</td>	
	            		<td class="coder"><b><a href="profile/<s:property value="create_user"/>" class="user-tip" user="<s:property value="create_user"/>"><s:property value="create_user"/></a></b></td>
	            		<td class="date"><s:date name="date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	
		 </div>  	
		  <div style="margin:0 12px;">	
				
				<div class="left">
					<s:if test="page>1">
						<a href="news/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="news/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < pageList.size">		
						<a href="news/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
				</div> 	 
				<div class=right></div>
	   </div>       	  
  	</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
