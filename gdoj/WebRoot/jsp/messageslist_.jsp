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
    <title>Topic</title>
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
             <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tool Box.</div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px;">
        			+<a href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
	            </div>
	            <div class="bottom-link" >
					<div class="left">
							
					</div>
					<div class="right">
						
		         	</div>
				</div>   
	        </div>   
	        <br/>
   		 <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div>	 
   		 
     <div id="content" class="content-with-sidebar "> 	 
		 <div id="nav-content" >	

     	</div>
	    <div class="content " style="position: relative;">	
			<div class="comments">			
				<ol>	
				 <s:iterator value="messages" status="st">	
						<s:if test="message_id==root_id">
							<s:if test="#st.index>0"></div></s:if>				
							<div class="roundbox-comments" style="position: relative;">		
						</s:if>	
						<s:else><s:if test="#st.index>0"><hr></s:if></s:else>
					 			<li style="">		
						 				<s:if test="nodeID[#st.index]!=''">
							            <div id=m_<s:property value="message_id"/> class="comment" >
						 				<img src="img/om.gif" alt="close it's comments" title="close it's comments" id=i<s:property value="nodeID[#st.index]"/> onClick=s2('<s:property value="nodeID[#st.index]"/>') >
						 				
						 				<img src=<s:if test="message_id==root_id">"img/user.png"</s:if><s:else>"img/message-small.png"</s:else>/>
						 				
						 				<s:if test="latestOrNot[#st.index]==1">
						 					<span style="color:red;font-size:10px;">Latest~</span>
						 				</s:if>
						 				<b>Title:<span style="color:red;"><a href="topic/<s:property value="message_id"/>"><s:property value="title"/></a></span> Posted By <b><a href="profile/<s:property value="create_user"/>" ><s:property value="create_user"/></a></b> <span  title="<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">at <s:date name="in_date" nice="true" format="yyyy-MM-dd HH:mm:ss"/></span>
						 				 </b>						 		
						 				  <s:if test="#session.session_username==create_user"> | <a href="topic/edit/<s:property value="message_id"/>">Eidt</a></s:if></span>
						 				 <br/>		 	
						 					 <div class="content "><s:property value="content" escape="false"/></div>
						 					 <div><ul class=<s:property value="message_id"/>><li></li></ul>	</div>
										 </div>
							 			<ul id=u<s:property value="nodeID[#st.index]"/>>
						 			</s:if><s:else>
						 			<div id=m_<s:property value="message_id"/> class="comment">
						 			<img src=<s:if test="message_id==root_id">"img/user.png"</s:if><s:else>"img/message-small.png"</s:else>/>
						 			<s:if test="latestOrNot[#st.index]==1"><span style="color:red;font-size:10px;">Latest~</span></s:if>
						 			<b>Title:<span style="color:red;"><a href="topic/<s:property value="message_id"/>"><s:property value="title"/></a></span> Posted By <b><a href="profile/<s:property value="create_user"/>" ><s:property value="create_user"/></a></b> <span title="<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">at <s:date name="in_date" nice="true" format="yyyy-MM-dd HH:mm:ss"/></span>
						 			</b>
									 <s:if test="#session.session_username==create_user"> | <a href="topic/edit/<s:property value="message_id"/>">Eidt</a></s:if></span>
						 				 <br/>
						 					 <div class="content "><s:property value="content"  escape="false"/></div>
						 					 <div><ul class=<s:property value="message_id"/>><li></li></ul></div>
										 </div>
						 			</s:else>
						 		</li> 		
						<s:property value="prevUL[#st.index]" escape="false"/>	 
				 </s:iterator>

				</ol>			
			</div>  	  	  	 
	    </div> 
	    <div style="margin-right: 12px;font-size:15px;">
					<div class="left"></div>
					<div class="right">
					<s:if test="page>1">
						<a href="topic/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">&larr;</a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="topic/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>
					<s:if test="page < pageCount">	 	
						<a href="topic/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">&rarr;</a>		
					</s:if>						
				</div>	
	     </div>     
	</div>   
        <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
