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
    <title>Problem <s:property value="problem.problem_id"/>.<s:property value="problem.title"/> - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
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
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.statistic"/></div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px; font-family:Consolas;">
        			Solved user(s):<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.solved" default="0"/></a> &nbsp;&nbsp;<br/>
        			Submit user(s):<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit_user" default="0"/></a><br/>
        			Submission(s) :<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit" default="0"/></a><br/>
	            </div>	         
	        </div>    

	        <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%;"><s:text name="sidebar.tags"/></div>
	            </div>  
	            <div class="tags" style="margin: 6px;">     
	            	<s:if test="tagsList.size==0"><span style="font: 11px/26px Monaco, monospace;color: #454545;"><s:text name="notags"/></span></s:if>  			
	            	<s:else>
	            	<s:iterator  value="tagsList" status="tagsst" >
	            		<a href="search?word=<s:property />&type=problem" rel="tag" ><s:property /></a>
	            	</s:iterator>
	            	</s:else>
	            </div>	           
	        </div>    

            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.toolsbox"/></div>
	            </div>  
	            <div class="tools-box" style="margin: 6px;color: #000;">
  		
        			<a style="font-size: 12px;color: #000;font-weight: bold;" href="problemset/submit/<s:property value="problem.problem_id"/>">Submit</a><br/>
 					<a style="font-size: 12px;color: #000;font-weight: bold;" href="problemset/statistic/<s:property value="problem.problem_id"/>">Statistic</a>
 
	            </div>	   
	        </div>    
  
   	 </div> 
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     <a href="problemset" class="current"><s:text name="problems"/></a>
     	<a href="problemset/status"><s:text name="status"/></a>
    	 <a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="content" style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">	    	
			<blockquote>
				<div class="data-title">
					<h3>
						<s:property value="problem.title"/>
					</h3>
					<s:if test="problem.spj!=0"><span style="color:red;font-size:11px;"><b>Special Judge</b></span><br></s:if>
					Time Limit:<s:property value="problem.time_limit" default="0"/>MS&nbsp;&nbsp;Memory Limit:<s:property value="problem.memory_limit" default="0"/>KB<br/>					
					<s:if test="problem.isvirtual!=0"><span style="color:red;font-size:11px;"><b>This problem will be judged on <s:property value="problem.oj_name"/></b></span><br></s:if>
				</div>
				<div class="probleminfo" style="padding:0px 12px 12px 0px;">
				<h5>
					Description:
				</h5>
					<s:property value="problem.description" default="" escape="false"/>
				<h5>
					Input:
				</h5>
					<s:property value="problem.input" default="" escape="false"/>
				<h5>
					Output:
				</h5>
					<s:property value="problem.output" default="" escape="false"/>
				<h5>
				Sample test:
				</h5>
					<div class="sample-test">
						<div class="input"><div class="title">Input</div>
						<div class="sample-input"><s:property value="problem.sample_input" default="" escape="false"/></div>
						</div>					
						<div class="output"><div class="title">Output</div>
						<div class="sample-output"><s:property value="problem.sample_output" default="" escape="false"/></div>
						</div>
					</div>				
				<h5>
					Note:
				</h5>
					<s:property value="problem.hint" default="" escape="false"/>
				<h5>
					Source:
				</h5>
					<s:property value="problem.source" default="" escape="false"/>
				<h5>
					Author:
				</h5>
					<s:property value="problem.author" default="" escape="false"/>
				</div>	
			</blockquote>	
				<div style="margin-right: 12px;text-decoration: NULL">
					<div class="left"></div>
					<div class="right">
					</div>
				</div>     
			  	  	 
	   </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?uid=1339907478548202&type=left&amp;move=0" charset="utf-8"></script>
<!-- JiaThis Button END -->
  </div>
  </body>
</html>
