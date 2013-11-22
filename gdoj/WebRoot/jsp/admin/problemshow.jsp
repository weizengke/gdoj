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
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
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
             <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Problem Info.</div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px;">
					Solved user(s):<a href="admin/problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.solved" default="0"/></a> &nbsp;&nbsp;<br/>
        			Submit user(s):<a href="admin/problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit_user" default="0"/></a><br/>
        			Submission(s) :<a href="admin/problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit" default="0"/></a><br/>
	            </div>	            
	        </div>    

            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="tools-box" style="margin: 6px;color: #000;">
        			<ul >
        		
        			<li style="list-style: circle;"><a href="admin/problemEdit.action?problemId=<s:property value="problem.problem_id"/>">Edit</a></li>
    			
	            	</ul>
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
	    <div class="content" style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">	    	
			<blockquote>
				<div class="data-title">
					<h3>
						<s:property value="problem.title"/>
					</h3>
					<s:if test="problem.spj!=0"><span style="color:red;font-size:11px;"><b>Special Judge</b></span><br></s:if>
					Time Limit:<s:property value="problem.time_limit" default="0"/>MS&nbsp;&nbsp;Memory Limit:<s:property value="problem.memory_limit" default="0"/>KB<br/>
					
				</div>
				<div class="probleminfo" style="padding:0px 12px 12px 0px;">
				<h5>
					Description:
				</h5>
					<s:property value="problem.description" default="null" escape="false"/>
				<h5>
					Input:
				</h5>
					<s:property value="problem.input" default="null" escape="false"/>
				<h5>
					Output:
				</h5>
					<s:property value="problem.output" default="null" escape="false"/>
				<h5>
					Sample test:
				</h5>
					<div class="sample-test">
						<div class="input"><div class="title">Input</div>
						<div class="sample-input"><s:property value="problem.sample_input" default="null" escape="false"/></div>
						</div>					
						<div class="output"><div class="title">Output</div>
						<div class="sample-output"><s:property value="problem.sample_output" default="null" escape="false"/></div>
						</div>
					</div>				
				<h5>
					Note:
				</h5>
					<s:property value="problem.hint" default="null" escape="false"/>
				<h5>
					Source:
				</h5>
					<s:property value="problem.source" default="null" escape="false"/>
				<h5>
					Author:
				</h5>
					<s:property value="problem.author" default="null" escape="false"/>
				</div>	
			</blockquote>	
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
