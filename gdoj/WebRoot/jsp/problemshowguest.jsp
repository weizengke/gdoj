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
  	<div class="container">
  	    <div class="content">
			<div class="sidebar">
              <div class="sidebox roundbox">
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.statistic"/></div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px; font-family:Consolas;">
        			<s:text name="problem.solved_users"/>&nbsp;:&nbsp;<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.solved" default="0"/></a> &nbsp;&nbsp;<br/>
        			<s:text name="problem.submit_users"/>&nbsp;:&nbsp;<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit_user" default="0"/></a><br/>
        			<s:text name="problem.submission"/>&nbsp;:&nbsp;<a href="problemset/status/problem/<s:property value="problem.problem_id" default="0"/>/page/1"><s:property value="problem.submit" default="0"/></a><br/>
	            </div>	         
	        </div>    

	        <div class="sidebox roundbox">
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
	        <a href="enter"/>
        		<button class="button_submit_code" style="vertical-align:middle"><span><s:text name="problem.submit_this_problem"/> </span></button>
        	</a><br/>
   	 	</div> 
     		<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     		<div id="nav-content" >	
     	 	 <a href="problemset" class="current"><s:text name="problems"/></a>
     	  	 <a href="problemset/status"><s:text name="status"/></a>
    	  	 <a href="problemset/standings"><s:text name="standings"/></a>
     		</div> 
	    	<div class="content" style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">	    	
			  <blockquote>
				<div class="data-title">
					<h3><s:property value="problem.problem_id"/>.<s:property value="problem.title"/></h3>
					<s:text name="problem.time_limit"/>:<s:property value="problem.time_limit" default="0"/>MS&nbsp;&nbsp;<s:text name="problem.memory_limit"/>:<s:property value="problem.memory_limit" default="0"/>KB<br/>
				</div>
				<div class="probleminfo" style="padding:0px 12px 12px 0px;">
					<h5><s:text name="problem.description"/>:</h5><s:property value="problem.description" default="" escape="false"/>
					<h5><s:text name="problem.input"/>:</h5><s:property value="problem.input" default="" escape="false"/>
					<h5><s:text name="problem.output"/>:</h5><s:property value="problem.output" default="" escape="false"/>
					<h5><s:text name="problem.sample_test"/>:</h5>
						<div class="sample-test">
							<div class="input"><div class="title"><s:text name="problem.sample_input"/></div>
							<div class="sample-input"><pre><s:property value="problem.sample_input" default="" escape="false"/></pre></div>
							</div>					
							<div class="output"><div class="title"><s:text name="problem.sample_output"/></div>
							<div class="sample-output"><pre><s:property value="problem.sample_output" default="" escape="false"/></pre></div>
							</div>
						</div>				
					<h5><s:text name="problem.note"/>:</h5><s:property value="problem.hint" default="" escape="false"/>
					<h5><s:text name="problem.tags"/>:</h5> 
					<div class="tags">
			           	<s:if test="tagsList.size==0"><span style="font: 11px/26px Monaco, monospace;color: #454545;"><s:text name="notags"/></span></s:if>  			
			           	<s:else><s:iterator  value="tagsList" status="tagsst" >
			           		<a href="search?word=<s:property />&type=problem" rel="tag" ><s:property /></a>
			           	</s:iterator></s:else>
		        	</div>
				</div>
				</blockquote>
	   		</div>    
		</div>
			<div class="clear"></div>
		</div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
