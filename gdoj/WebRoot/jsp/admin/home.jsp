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
    <title>Home</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
</head>
  
<body>
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
	<div class="container">
      <div class="content">       
    	<div class="sidebar">       
 	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div> 	   	
    	<div class="content-with-sidebar round0123"  >
	   <jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    <div class="topic">	
			  <div class="comment " style="position: relative;padding: 6px;">
			  <form action="admin/homemaker.action" method="post">	     																								  			
					Home Page:<br>
					<textarea class="message-content ke-editor" id="home-content" name="content" rows="20" ><s:property value="content"/></textarea>
				    <br>
				    Sidebar:<br>
				    <textarea class="message-content ke-editor" id="sidebar-content" name="sidebar_content" rows="20" ><s:property value="sidebar_content"/></textarea>
                   	<div style="text-align: center;margin-top: 12px;">
					<input class="button_submit" type="submit" value="<s:text name="topic.btn_post"/>" >
					</div>
				</form>     
    		</div> 	
    	</div>
	</div>
		  <div class="clear"></div>

  	</div>
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
