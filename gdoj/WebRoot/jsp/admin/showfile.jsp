<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Welcome to GuiLin University of Electronic Technology Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System fof ACM">
 	<link href="css/styles.css" type="text/css" rel="stylesheet">
 	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
 	  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  
  <body>
  <jsp:include  page="../head.jsp" ></jsp:include> 
 
  <div id="body">
   	<div id="content">
   		<div id="nav-content" >	
   		<a href="admin">Admin</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     	</div>
     	<s:property value="fileName" escape="false"/>
     	<div class="probleminfo" style="margin: 0 auto;">
     	<div class="sample-test">
				<div class="input"><div class="title">Content</div>
					<div class="sample-input"><s:property value="content" escape="false"/></div>
				</div>							
		</div>		   	
     	</div>	
   	</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
