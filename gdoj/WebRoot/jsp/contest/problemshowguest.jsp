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
    <title>Contest - Problem - <s:property value="cproblem.num"/>. <s:property value="cproblem.title"/> - Online Judge</title>
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
	            <div class="" style="margin: 6px;font-size: 12px;">
					<s:text name="problem.solved_users"/>&nbsp;:&nbsp;<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.solved" default="0"/></a>&nbsp;&nbsp;<br/>
        			<s:text name="problem.submit_users"/>&nbsp;:&nbsp;<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.submit_user" default="0"/></a><br/>
        			<s:text name="problem.submission"/>&nbsp;:&nbsp;<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.submit" default="0"/></a><br/>
	            </div>
	        </div>     
	         <div class="sidebox roundbox">
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="problems"/></div>
	            </div>  
	            <div class="sidebar-problems" style="padding: 6px;">
 					
	            </div>	          
	        </div>    
	        <a href="contest/<s:property value="contestId"/>/problem/<s:property value="cproblem.num"/>">
        		<button class="button_submit_code" style="vertical-align:middle"><span><s:text name="problem.submit_this_problem"/> </span></button>
        	</a><br/>
   	 </div> 
<script type="text/javascript">
$(document).ready(function() {
	 var contestId =<s:property value="contestId"/>;	
	   $.getJSON("contestProblems.action",{contestId: contestId},function(json){ 	
	            if (json.success != true) {
	            	alert(json["error"]);
	            }
	            var opt="";
	           
	          	 for(var i in json.cproblemTitle){		
				 	 opt+="<a style='font-size:12px;' href='contest/"+contestId+"/problem/"+json.cproblemNum[i]+"'>"+json.cproblemNum[i]+". "+ json.cproblemTitle[i]+"</a><br/>"	 	
				}  
				
				$("div.sidebar-problems").html(opt);
	  });
});
</script>
     <div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
		<a  class="current" href="contest/<s:property value="contestId"/>"><s:text name="contestproblems"/></a>
		<a href="contest/<s:property value="contestId"/>/status"><s:text name="status"/></a>
     	<a href="contest/<s:property value="contestId"/>/standings" target="blank"><s:text name="standings"/></a>
     		<s:if test="#session.session_username!=null">
     	<a href="contest/<s:property value="contestId"/>/status/with/<s:property value="#session.session_username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
     	</s:if>
     	</div>
	    <div class="content" style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">	    		
			<blockquote>
				<div class="data-title">
					<h3><s:property value="num"/>.<s:property value="problem.title"/></h3>
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
