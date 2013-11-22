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
    <title>Admin - News</title>
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
		 

	<div id="sidebar"> 	 
		<div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="" style="margin: 6px;">    	
				     <b><a href="admin/newsnew">New News</a></b>				     	
	            </div>	              
	        </div>    
  		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include>   
   	 </div> 
	
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
   		<div id="nav-content" >	
	    	 <a href="admin">Admin</a>
	    	  <a href="admin/news">News</a>
	     	<a href="admin/problemset">Problems</a>
	     	<a href="admin/problemset/status">Status</a>
	     	<a href="admin/contests">Contests</a>
	     	<a href="admin/user">Users</a>	
	     		<a href="admin/privilege">Privilege</a>		     		
  	 	</div>
		 <!-- Ended  -->
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left">News</div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="topics">
					 <tr class="header">           	 
						 <th class="id left-item">ID.</th>
		               	 <th class="title">Title[orderNum]</th>
		                 <th class="date">Date</th>
		                 <th class="coder">Author</th>
		                 <th class="operator">*</th>
	                </tr>
	                <s:if test="newsList.size==0">
	                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="newsList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>      		
	            		<td class="id left-item">
	            			<a href="admin/news/<s:property value="news_id"/>"><s:property value="news_id"/></a>
	            		</td>
	            		<td class="title">
	            			[<s:property value="orderNum"/>]<a href="admin/news/<s:property value="news_id"/>"><s:property value="title"/></a>
	            		
	            		</td>	
	            		<td class="date"><s:date name="date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            		<td class="coder"><a href="profile/<s:property value="create_user"/>"><s:property value="create_user"/></a></td>
	            		<td class="operator"><a href="admin/news/edit/<s:property value="news_id"/>">Edit</a>
	            		
	            		<s:if test="defunct==\"N\"">
	            		</s:if><s:else>|
	            		<span style="color:grey;">Hide</span>
	            		</s:else>
	            		</td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	
		 </div>  	
		  <div style="margin:0 12px;">	
				<div class=left></div>
				<div class="right">
					<s:if test="page>1">
						<a href="admin/news/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="admin/news/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < pageList.size">		
						<a href="admin/news/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
			</div> 	 
	   </div>       	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
