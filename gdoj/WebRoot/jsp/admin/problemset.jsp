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
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="" style="margin: 6px;">
	            	大量ReJudge需谨慎！<br/>		
	            	<b><a href="admin/newproblem.action"><s:text name="problemadd"/></a></b>
	            </div>
	           
	        </div>    
	        
	        <br clear="all"/>
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
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="problems"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="problem">
					 <tr class="header">
					   <th class="id left-item"><s:text name="problemid"/></th>
					   <th class="problem"><s:text name="problem"/></th>
					   <th class="ratio"></th>
	                </tr>
	                <s:if test="problemList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="problemList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="id left-item"><a href="admin/problemset/problem/<s:property value="problem_id"/>" target="_blank"><s:property value="problem_id"/></a></td>
	            		<td class="problem">
	            			<div style="float:left;">
	            			<a href="admin/problemset/problem/<s:property value="problem_id"/>" target="_blank"><s:property value="title"/></a>
	            			</div>
	            			 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            				<s:property value="tag"/>
	            			</div>
	            		</td>   		
	            		<td class="ratio"><a href="admin/problemEdit.action?problemId=<s:property value="problem_id"/>">Edit</a>|<a href="admin/problemset/data/<s:property value="problem_id"/>">Data</a>|<a href="admin/rejudge/problem/<s:property value="problem_id"/>" class="re-judge">ReJudge</a></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    
	   
	   <script type="text/javascript">
$(document).ready(function() {
	$("a.re-judge").click(function() {
		if(confirm('WARNING! Do you really want to rejudge this problem?')){
			
		}else return false;
	}); 
});
</script> 
	    <div style="margin:0 12px;">	
			<div class=left></div>
			<div class="right">
					<s:if test="page>1">
						<a href="admin/problemset/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="admin/problemset/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < solutionList.size">		
						<a href="admin/problemset/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
		   </div>
		</div>  	    	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
