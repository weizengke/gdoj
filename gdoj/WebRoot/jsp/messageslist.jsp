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
    <title>Topic - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
 
  </head>
	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <body>  
  	
  <div id="body">

	<div id="sidebar"> 	 
   		 <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div>	 
   		 
     <div id="content" class="content-with-sidebar "> 	 
		 <div id="nav-content" >	
			<a class="current" href="topic"><s:text name="topic"/></a>
			<a href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
     	</div>
	   <div id="RecentBlogs">
    	
    	<ul class='BlogList' >
	   		<s:if test="messages.size==0">
	            <li> There is no topic. </li>
	        </s:if>
			<s:iterator value="messages" status="st">	
				<li>	
					<a href="profile/<s:property value="author"/>" class='u user-tip' user="<s:property value="author"/>"><img src="<s:if test="avatar==\"Y\"">upload/userphoto/<s:property value="author"/>/</s:if><s:else>img/</s:else>photo_50.jpg" alt="<s:property value="author"/>" /></a>
					<div class='b'>
<h3><a href="topic/<s:property value="messageId"/>" style="<s:if test="orderNum>0">color:red</s:if>"><s:property value="title"/></a></h3>
    			<p><s:property value="content_abstract" escape="false"/></p>
    			<div class="buttom">
    				<div class="opts">
    				<a href="topic/<s:property value="messageId"/>"><s:text name="topic.more"/></a>&nbsp;
    				<a href="topic/<s:property value="messageId"/>#comments"><s:text name="topic.reply"/>(<s:property value="comments"/>)</a></div>
    				
    				<div class='date'><s:property value="author"/> <s:text name="post"/> <span title="<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"><s:property value="friendly_Date"/></span>
    				<s:if test="lastReplyUser!=null">
    				&nbsp;,&nbsp;<s:text name="topic.lastreply"/>(<span title="<s:date name="lastReplyDate" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"><s:property value="lastReplyFriendlyDate"/></span>):<a href="topic/<s:property value="messageId"/>#rpl_<s:property value="lastReplyId"/>"><s:property value="lastReplyUser"/>&gt;&gt; </a>
    				</s:if>
    				</div>  			
    			</div>
    			</div>
				</li>	
			</s:iterator>	  
	    </ul>
	   
	    <div style="margin:0 12px;font-size:15px;">	
			<div class=left></div>
			<div class="right">
					<s:if test="page>1">
						<a href="topic/page/<s:property value="page-1"/><s:if test="order!=null">?ORDER=<s:property value="order"/></s:if>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="topic/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>	
					<s:if test="page < pageCount">		
						<a href="topic/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
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
