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
  <div id="body">
	

	<div id="sidebar"> 	
             <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.statistic"/></div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px;">
					Solved user(s):<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.solved" default="0"/></a>&nbsp;&nbsp;<br/>
        			Submit user(s):<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.submit_user" default="0"/></a><br/>
        			Submission(s) :<a href="contest/<s:property value="contestId" default="0"/>/status/problem/<s:property value="cproblem.num" default="0"/>/page/1"><s:property value="cproblem.submit" default="0"/></a><br/>
	            </div>
	        </div>    
            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.toolsbox"/></div>
	            </div>  
	            <div class="tools-box" style="margin: 6px;color: #000;">	
        			<a style="font-size: 12px;color: #000;font-weight: bold;" href="contest/<s:property value="contestId"/>/submit/<s:property value="cproblem.num"/>">Submit</a><br/>
	            </div>
	        </div>    
	         <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="problems"/></div>
	            </div>  
	            <div class="sidebar-problems" style="padding: 6px;">
 					
	            </div>	          
	        </div>    
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
   	 
   	 
   	 
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
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
					<h3>
						<s:property value="cproblem.num"/>. <s:property value="cproblem.title"/>
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
					Author:
				</h5>
					<s:property value="problem.author" default="null" escape="false"/>
				</div>	
				<div style="margin-right: 12px;text-decoration: none;">
					<div class="left"></div>
					<div class="right">
					</div>
				</div>		  
			</blockquote>   	  	 
	   </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
