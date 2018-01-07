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
    <title>Online Judge System</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
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
				     <b><a href="admin/newcontest">New Contest</a></b>				     	
	            </div>	              
	        </div>    
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
				<div class="left"><s:text name="contests"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="contest">
					 <tr class="header">           	 
						 <th class="id left-item"><s:text name="id"/></th>
		               	 <th class="title"><s:text name="contesttitle"/></th>
		                 <th class="start"><s:text name="starttime"/></th>    
		                 <th class="coder"><s:text name="createuser"/></th>
		                 <th class=""></th>
	                </tr>
	                <s:if test="contestList.size==0">
	                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="contestList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>      		
	            		<td class="id left-item">
	            			<a href="admin/contest/<s:property value="contest_id"/>"><s:property value="contest_id"/></a>
	            		</td>
	            		<td class="title">
	            			<a href="admin/contest/<s:property value="contest_id"/>"><s:property value="title"/></a>
	            		</td>
	            		<td class="start"><s:date  name="start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            		<td class="coder"><a href="#"><s:property value="create_user"/></a></td>
	            		<td class=""><a href="admin/contestEdit?contestId=<s:property value="contest_id"/>">Edit</a>
	            		|
	            		<s:if test="defunct==\"N\"">
	            		<a href="admin/delContest?contestId=<s:property value="contest_id"/>">Delete</a>
	            		</s:if><s:else>
	            		<a href="admin/resumeContest?contestId=<s:property value="contest_id"/>" style="color: red;font-weight: bold;">Resume</a>
	            		</s:else>
	            		</td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	
		 </div>  	
		  <div style="margin:0 12px;">	
				<div class=left>

				</div>
				<div class="right">
					<s:if test="page>1">
						<a href="admin/contests/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="admin/contests/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < pageList.size">		
						<a href="admin/contests/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
			</div> 	 
	   </div>   
	       	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
