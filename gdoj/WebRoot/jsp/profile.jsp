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
    <title>Profile - <s:property value="user.username"/>(<s:property value="user.nickname"/>) - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>

  </head>

  <body>  
  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div id="body">
		 <div id="sidebar"> 	
	    <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 </div> <!-- End sidebar -->
	
      <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >    	
	   	    <a href="profile/<s:property value="user.username"/>" class="current"><s:property value="user.username"/></a>
			<s:if test="user.username==#session.session_username">      
	      	<a href="settings"><s:text name="settings"/></a>
	      	</s:if>	      	
	      	<a href="problemset/status/with/<s:property value="user.username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>      
	      	</div>
	  <div class="content " style="">   
	      <div class="profile roundbox" style="">
			   <div class="roundbox-lt">&nbsp;</div>
	       	   <div class="roundbox-rt">&nbsp;</div>	
	       	   <div class="roundbox-lb">&nbsp;</div>
	           <div class="roundbox-rb">&nbsp;</div>	    
			   <div style="padding:6px;height:320px;">
			  		 <div style="float:right;border:1px solid #B9B9B9;width:260px;min-height:150px;padding:12px;">
			  				<div style="min-height:200px;line-height:200px;text-align:center;">
				    			<img style="margin:auto;vertical-align:middle;display:inline;" alt="<s:property value="user.username"/>" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="user.username"/>/</s:if><s:else>img/</s:else>photo_250.jpg" /> 
			  		 		</div>
			  		 </div>
				     <div style="word-wrap:break-word;width:350px;">
				   			 <ul style="padding: 0px;">
				   			 	<li><b><s:property value="user.username"/></b> <a href="mails/new/<s:property value="user.username"/>" title="mail to <s:property value="user.username"/>">@<s:property value="user.username"/></a></li>
				   			 	<li><span style="color:#000">
				   			 		<s:if test="user.nickname==''||user.nickname==null"><s:property value="user.username"/></s:if><s:else><s:property value="user.nickname"/></s:else>
				   			 		<s:if test="user.school==null||user.school==''"></s:if><s:else> , <s:property value="user.school"/></s:else>
				   			 	</span></li>
				       			<li><span style="color:#378059;"><s:if test="user.motto==null||user.motto==''">Welcome to GUET Online Judge</s:if><s:else><s:property value="user.motto"/></s:else></span></li>
				       			
				       			<s:if test="#session.session_username==user.username">
	                   			<li>E-mail: <s:property value="user.email" default="0"/> &nbsp; &nbsp;<span style="color:grey">(not visible)</span></li>
						        <li>Birthday: <s:date name="user.birthday" nice="false" format="yyyy-MM-dd"/>&nbsp; &nbsp;<span style="color:grey">(not visible)</span></li>       
						        </s:if>
				       			<!-- 
				   				<li><span title="<s:date name="user.lastlogin" nice="true" format="yyyy-MM-dd HH:mm:ss"/>"> Last login: <s:date name="user.lastlogin" nice="false" format="yyyy-MM-dd HH:mm:ss"/></span></li> 
				       		 	 -->
				       		 	<li><span title="<s:date name="user.lastaccesstime" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"> Last visit: <s:property value="lastAccessTime" default="unknow"/></span> <s:if test="statusFlag == 1"><span style="color:green;font-weight:bold;">Online Now</span></s:if> </li>
	                   			<li><span title="<s:date name="user.regdate" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"> Registered: <s:property value="registerDate" default="unknow"/></span></li> 	       	

						        <li>Default Language: <s:property value="%{getText('language'+user.language)}"/></li>
						        <li>Open Source: <s:if test="user.opensource==\"N\"">No</s:if>
								<s:else>Yes</s:else>
								</li>
						        <li>Rank: <b><s:property value="rank" default="0"/></b> &nbsp;&nbsp;Solve: <b><s:property value="user.solved" default="0"/></b>  &nbsp;&nbsp;Submissions: <b><s:property value="user.submit" default="0"/></b></li>				       
				       			<li></li>
				   				    
						       </ul>
				     </div>
			   </div>
		  </div>
		  
		  <div class="profile roundbox" style="">
		   		  <div class="roundbox-lt">&nbsp;</div>
	       		  <div class="roundbox-rt">&nbsp;</div>	   
			   	  <div class="roundbox-lb">&nbsp;</div>
	       		  <div class="roundbox-rb">&nbsp;</div>	 
			   	 <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="titled" style="width: 100%">Problem Solved (<s:property value="problemSolvedList.size"/>)</div>
	            </div>  
				<div style="padding: 6px;word-wrap:break-word;">
				    <s:iterator value="problemSolvedList" status="pst">	
			   	 	 <span title="<s:property value="title"/>"><a class="solved" href="problemset/status/problem/<s:property value="problem_id"/>/with/<s:property value="user.username"/>/page/1"><s:property value="problem_id"/></a></span>	  	
			  		</s:iterator> 	
				</div>		   
		   </div>  
		   <div class="profile roundbox" style="">
		        <div class="roundbox-lt">&nbsp;</div>
	       		  <div class="roundbox-rt">&nbsp;</div>	   
			   	<div class="roundbox-lb">&nbsp;</div>
	       		  <div class="roundbox-rb">&nbsp;</div>	 
			   	 <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="titled" style="width: 100%">Problem Tried (<s:property value="problemTryList.size"/>)</div>
	            </div> 
	            <div style="padding: 6px;word-wrap:break-word;">
		         <s:iterator value="problemTryList" status="pst">	
			   	 	 <span title="<s:property value="title"/>"><a class="unsolved" href="problemset/status/problem/<s:property value="problem_id"/>/with/<s:property value="user.username"/>/page/1"><s:property value="problem_id"/></a></span>
			  	</s:iterator> 
			  	</div>	
		  </div> 
	  </div>	    	  
      </div>   
     <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  	</div>
  </body>
</html>
