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
    <title>Status - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="OJ,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  <body>  
  <jsp:include page="/jsp/head.jsp"></jsp:include> 
  <div class="container">
     <div class="content" > 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >
     	   <a href="problemset"><s:text name="problems"/></a>
     	   <a href="problemset/status" class="current"><s:text name="status"/></a>
    	   <a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="roundbox" style="">
			<div class="" style="">
				<table class="status rtable">
					 <tr class="header">
		               	 <th  class="id left-item"><s:text name="statusid"/></th>
		                 <th  class="coder"><s:text name="author"/></th>
						 <th  class="title" ><s:text name="problem"/></th>
		                 <th  class="language"><s:text name="language"/></th>
		                 <th  class="time"><s:text name="timeuse"/></th>
		                 <th  class="memory"><s:text name="memoryuse"/></th>
						 <th  class="verdict"><s:text name="status"/></th>
			             <th  class="date"><s:text name="submitdate"/></th>
	                </tr>
	                <s:if test="solutionList.size==0">
	                 <tr ><td class="left-item dark" colspan="20" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="solutionList" status="st">	
	            	<tr class="<s:if test="#st.odd">dark</s:if>">
	            		<td class="id left-item <s:if test="#session.session_username==username">my</s:if>">
	            		<s:if test="opensource==1||#session.session_username==username">
	            		<a solutionId="<s:property value="solution_id" default="0"/>" class="view-source" href="view-source/<s:property value="solution_id" default="0"/>" title="source" target="_blank"><s:property value="solution_id" default="0"/></a>
	            		</s:if><s:else><s:property value="solution_id" default="0"/></s:else>
	            		</td>
	            		<td class="coder "><a href="profile/<s:property value="username" default="0"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="username"/>"><s:property value="username" default="NULL"/></a></td>
						<td class="title">
							<s:if test="timeout==1">
								<a href="problemset/problem/<s:property value="problem_id"/>" ><s:property value="problem_id" default="0"/>.<s:property value="problemTitle[#st.index]" default="Unknow"/></a>
							</s:if><s:else>
							 <span style="color:grey" title="Show after contest ended">Contest Problem</span>
							</s:else>
	            		</td>
	            		<td class="language" title="<s:property value="code_length" default="0"/> B"><s:property value="language_name"/></td>
	            		<td class="time" id="time_<s:property value="solution_id" default="0"/>"><s:property value="time" default="0"/> ms</td>
	            		<td class="memory" id="memory_<s:property value="solution_id" default="0"/>"><s:property value="memory" default="0"/> kb</td>
						<td class="verdict
							<s:if test="verdict==5">verdict_ac</s:if>
							<s:elseif test="verdict==3">verdict_ce</s:elseif>
							<s:elseif test="verdict==10">verdict_pe</s:elseif>
							<s:elseif test="verdict<5">verdict_prev</s:elseif>
							<s:else>verdict_other</s:else>
							"id="status_<s:property value="solution_id" default="0"/>"
							 status="<s:property value="verdict" default="0"/>"
							 manual="0">
							<s:if test="opensource==1||#session.session_username==username">
								<s:if test="verdict==3">
									<a solutionId="<s:property value="solution_id" default="0"/>" class="viewCompileInfo" href="view-compileinfo/<s:property value="solution_id" default="0"/>" >
										<s:property value="%{getText('verdict'+solutionList[#st.index].verdict)}"/>
									</a>
								</s:if>
								<s:else>
									<a solutionId="<s:property value="solution_id" default="0"/>" class="view-source" href="view-source/<s:property value="solution_id" default="0"/>" title="source" target="_blank">
										<s:property value="status_description" default="-"/>
									</a>
								</s:else>
							</s:if><s:else><s:property value="status_description" default="-"/></s:else>
						</td>
						<td class="date" title="<s:date  name="submit_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"><s:property value="friendlySubmitDate"/></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>
			<div style="margin:6px 12px;font-size:15px;">
				<div class="left"></div>
				<div class="right">
					<s:if test="page>1">
						<a href="problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">&larr;</a>
					</s:if>
					<s:iterator value="pageList" status="st_page">
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>
					<s:if test="page < pageCount">

						<a href="problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">&rarr;</a>
					</s:if>
				</div>
			</div>
		</div>
		<div class="clear"></div>
  	 </div>
	  <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  <jsp:include page="/jsp/status-pop.jsp"></jsp:include>
  </body>
</html>
