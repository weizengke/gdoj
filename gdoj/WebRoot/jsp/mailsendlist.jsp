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
    <title>Mail Send <s:property value="username"/></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  <!--  <script type="text/javascript" src="js/json.js"></script> -->	
  	<script type="text/javascript">
      $(document).ready(function() {	
});
</script>  

  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div id="body">
		<div id="sidebar"> 	
            
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 </div> <!-- End sidebar -->
	
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >
     	
     	<a href="mails" ><s:text name="mails.recv"/></a>
     	<a href="mails/send" class="current"><s:text name="mails.send"/></a> 
     	    	<a href="mails/new"><s:text name="mails.new"/></a>    	
     	</div>
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="mails.sendlist"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="mails">
					 <tr class="header">
					   <th class="status left-item"><s:text name="mails.status"/></th>
					   <th class="title"><s:text name="mails.title"/></th>
					   <th class="recver"><s:text name="mails.recver"/></th>
					   <th class="date"><s:text name="mails.date"/></th>
	                </tr>
	                <s:if test="mailList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="mailList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="status left-item "><s:if test="isnew==1"><img title="never read" alt="never read" src="img/mail_new.gif" width=16 height=16></s:if><s:else><img title="readed" alt="readed" src="img/mail_old.gif" width=16 height=16></s:else></td>
	            		<td class="title">
	            			<div style="float:left;">
	            			<a href="mails/<s:property value="mail_id"/>" ><s:property value="title"/></a>
	            			</div>
	            			 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            			</div>
	            		</td>
	            		<td class="sender">
	            		<b><a href="profile/<s:property value="to_user"/>" >
	            		<s:property value="to_user" default="NULL"/>
	            		</a></b>
	            		</td>
	            		<td class="date" title=""><s:date  name="create_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    
	    <div style="margin:0 12px;font-size:15px;">	
			<div class=left></div>
			<div class="right">
					<s:if test="page>1">
						<a href="mails/send/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="mails/send/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>	
					<s:if test="page < pageCount">		
						<a href="mails/send/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
		   </div>
		</div>  	    	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
