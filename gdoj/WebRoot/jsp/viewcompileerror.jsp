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
    <title>Compile Info. of Solution <s:property value="solutionId"/></title>
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
     <div id="content" > 	 <!--class="content-with-sidebar"  -->
     	<div id="nav-content" >	
     	</div>
	    <div class="content" style="">	    	
			<div class="roundbox" style="word-wrap:break-word;">		
				 <div class="roundbox-lt">&nbsp;</div>
	       		  <div class="roundbox-rt">&nbsp;</div>	
	       		  <div class="roundbox-lb">&nbsp;</div>
	       		  <div class="roundbox-rb">&nbsp;</div>	 		
				<div class="info" style="padding:12px;">
				<h5>
				<s:text name="compileinfo"/>:<s:property value="solutionId"/>
				</h5><hr>
					<pre class="code"><s:property value="errorInfo"/></pre>	
				</div>
		    </div>		
			<div style="margin-right: 12px;text-decoration: none;">
				<div class="left"></div>
				<div class="right">
				</div>
			</div>       	  	 
	   </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
