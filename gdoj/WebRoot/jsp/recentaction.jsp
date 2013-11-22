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
    <title>Recent Actions</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
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
	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <body>  
  	
  <div id="body">

	<div id="sidebar"> 	
          
   		 <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div>	 
   		 
     <div id="content" class="content-with-sidebar "> 	 
		 <div id="nav-content" >	
			<a href="topic"><s:text name="topic"/></a>
			<a class="current" href="recent-actions"><s:text name="sidebar.recentaction"/></a>
			<a href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
     	</div>
	   <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="sidebar.recentaction"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="topics">
					 <tr class="header">	
					   
					   <th class="title left-item"><s:text name="topic.title"/></th>
					   <th class="rating "><s:text name="topic.rating"/></th>					 
					   <th class="reply"><s:text name="topic.reply"/></th>
					   <th class="views"><s:text name="topic.views"/></th>
					   <th class="coder"><s:text name="topic.author"/></th>	
					   <th class="date"><s:text name="topic.date"/></th>
	                </tr>
	                <s:if test="messages.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="messages" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>	   
	            		<td class="title left-item" >
	            			<div style="float:left;">
	            			<a href="topic/<s:property value="message_id"/>" ><s:property value="title"/></a>
	            			</div>
	            			 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            			
	            			</div>
	            		</td>
	            		 <td class="rating ">
							<s:if test="votes>0">
							<span style="color:green;font-weight:bold;">
							+<s:property value="votes"/>
							</span>
							</s:if><s:else>
							<span style="color:gray;font-weight:bold;">
							<s:property value="votes"/>
							</span>
							</s:else>	            	    
	            	    </td>
	            		<td class="reply">
	            			<s:property value="commentList[#st.index]"/>
	            		</td>
	            		<td class="views">
	            			<s:property value="views"/>
	            		</td>
	            	    <td class="coder">
	            	   	 <b><a href="profile/<s:property value="create_user"/>" class="user-tip" user="<s:property value="create_user"/>"><s:property value="create_user"/></a></b>
	            	    </td>				   
					   <td class="date">
					   		<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>
					   </td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    
	    <div style="margin:0 12px;font-size:15px;">	
			<div class=left></div>
			<div class="right">
					<s:if test="page>1">
						<a href="recent-actions/page/<s:property value="page-1"/><s:if test="order!=null">?ORDER=<s:property value="order"/></s:if>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="recent-actions/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>	
					<s:if test="page < pageCount">		
						<a href="recent-actions/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
		   </div>
		</div>  	    	  
	</div>   
        <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
