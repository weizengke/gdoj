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
    <title>News <s:property value="news.title"/></title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
</head>
  <body>
    <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
        <div class="content">       
	     	<div class="sidebar"> 	         
			<div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="" style="margin: 6px;">    	
				     <b><a href="admin/news/edit/<s:property value="news.news_id"/>">Edit</a></b>				     	
	            </div>	              
	        </div>    
 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 

   	</div> 
    		<div class="content-with-sidebar round0123"  >
	   <div id="nav-content" >
     	</div>
	    <div class="topic">
			<div class="title">
			   	<p><s:property value="news.title"/></p>
			</div>
		    <div class="info">		       
			 	<b>Post by <b><a href="profile/<s:property value="news.create_user"/>"><s:property value="news.create_user"/></a></b> at <s:date name="news.date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></b>
			</div>
			<div class="content">   
		       	<blockquote>
		      	<p><s:property value="news.content" escapeHtml="false"/></p>
		        </blockquote>
		     </div>
		    
	    </div>
	</div>
			<div class="clear"></div>
		</div>
      	<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>
   </div>
  </body>
</html>
