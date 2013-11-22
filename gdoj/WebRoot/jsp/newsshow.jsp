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
    <title>News - <s:property value="news.title"/> - GUET Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shCore.css"/>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shThemeDefault.css"/>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shCore.js"></script>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shBrushes.js"></script>
<script type="text/javascript">
SyntaxHighlighter.config.clipboardSwf = 'js/ckeditor/plugins/syntaxhighlight/scripts/clipboard.swf';
SyntaxHighlighter.all();
</script>
</head>
  
  <body>
    <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">	


	<div id="sidebar"> 	    
 	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 

   	</div> 
    <div id="content" class="content-with-sidebar round0123"  >     
	   <div id="nav-content" >
   			<a href="news"><s:text name="news"/></a>
     	</div>
	    <div class="topic">
			<div class="title">
			   	<p><s:property value="news.title"/></p>
			</div>
		    <div class="info">		       
			 	<b>Post by <b><a href="profile/<s:property value="news.create_user"/>" class="user-tip" user="<s:property value="news.create_user"/>"><s:property value="news.create_user"/></a></b> at <s:date name="news.date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></b>
			</div>
			<div class="content">   
		       	<blockquote>
		      	<p><s:property value="news.content" escape="false"/></p>		      				   
		        </blockquote>
		     </div>
		    
	    </div>
	</div>  

      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
