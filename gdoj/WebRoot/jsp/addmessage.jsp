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
    <title>Welcome to GuiLin University of Electronic Technology Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript">
	$(document).ready
(
	function()
	{	
		 $("#login").submit
		    (
		       function()
		        {
		    	//alert("login");
		        //login();
		        //return false;
		       }
		  );
	}	   
);
	</script>
</head>
  
  <body>
  <div id="body">
	<s:include   value="head.jsp"/> 
	
	<div id="tip">
  		<marquee scrollamount=4 width=80% scrolldelay=30  onMouseOver="javascript:this.stop();" 
  			onMouseOut="javascript:this.start();"> 
  			<b style="margin-right:20px"> 	
	  			我爱中华    This is where you can put your latest news.
  			</b>
		</marquee>
	</div>
    
    <div style="position: relative;">
      <div id="content" >
		 <div>
			  <s:form action="addmessage" method="post">
				<s:token/>
					<table class="table-form">
						<tr>
						<td><input type="hidden" name="moduleId" value="0" ></td>
						<td><input type="hidden" name="reply" value="0" ></td>
						</tr>
						<tr>
						<td class="field-name">You Name</td>
						<td><textarea name="createUser" rows="1" >solo</textarea></td>
						</tr>

						<tr>
						<td class="field-name">Title</td>
						<td><textarea name="title" rows="1" ></textarea></td>
						</tr>
						<tr>
						<td class="field-name">Content</td>
						<td><textarea name="content" rows="5"></textarea></td>
						</tr>
						<tr>
						<td><input  type="Submit" value="Submit"></td>
						<td><input type="reset" value="Reset"></td>
						</tr>
					</table>
					
			</s:form>
	    </div>     
	 </div>   
    </div>
    
    <div id="footer">
      copyright &copy; 2012 ACSolo | <a href="#">269574524@qq.com</a> | <a href="http://validator.w3.org/check?uri=referer">XHTML 1.1</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.dcarter.co.uk">design by dcarter</a>
    </div>
  </div>
  </body>
</html>
