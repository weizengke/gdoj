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
    <title>404 - Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
</head>
  <body>
    <s:include value="head.jsp"/>
  	<div class="container">
       <div class="content"> 
	   	  <div style="margin: 0 auto;" align="center">
		    <img src="img/404.png" /><br/>
		    <b><span style="color:red">Not found this page.</span></b>
	     </div>	  
	   </div>   
       <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
    </div>
  </body>
</html>
