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
    <title>Status</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include>
   	<div class="container">
        <div class="content">  
			<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include>
			<div class="roundbox" style="">
				<div class="" style="">
					<table class="status rtable">
						 <tr class="header">
							 <th class="left-item"></th>
							 <th  class="id"><s:text name="statusid"/></th>
							 <th  class="date"><s:text name="submitdate"/></th>
							 <th  class="coder"><s:text name="author"/></th>
							 <th  class="title" ><s:text name="problem"/></th>
							 <th  class="language"><s:text name="language"/></th>
							 <th  class="verdict"><s:text name="status"/></th>
							 <th  class="time"><s:text name="timeuse"/></th>
							 <th  class="memory"><s:text name="memoryuse"/></th>
						</tr>
						<s:if test="solutionList.size==0">
						 <tr ><td class="left-item dark" colspan="20" style="text-align: left;">There is no records.</td></tr>
						</s:if>
						<s:iterator value="solutionList" status="st">
						<tr class="<s:if test="#st.odd">dark</s:if>">
							<td class="left-item"><b><a class="re-judge" href="admin/rejudge/status/<s:property value="solution_id" default="0"/>" title="Re-Judge this submission">ReJudge</a></b></td>
							<td class="id">
							<a solutionId="<s:property value="solution_id" default="0"/>" class="view-source" href="admin/view-source/<s:property value="solution_id" default="0"/>" title="source" target="_blank"><s:property value="solution_id" default="0"/></a>
							</td>
							<td class="date"><s:date  name="submit_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>

							<td class="coder"><b><a href="profile/<s:property value="username" default="0"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="username"/>"><s:property value="username" default="Unknown"/></a></b></td>
							<td class="title">
							<a href="admin/problemset/problem/<s:property value="problem_id"/>" ><s:property value="problem_id" default="0"/>.<s:property value="problemTitle[#st.index]" default="Unknow"/></a>
							</td>
							<td class="language" title="<s:property value="code_length" default="0"/> B"><s:property value="%{getText('language'+solutionList[#st.index].language)}"/></td>

							<td class="verdict
							<s:if test="solutionList[#st.index].verdict==5">verdict_ac</s:if>
							<s:elseif test="solutionList[#st.index].verdict==3">verdict_ce</s:elseif>
							<s:elseif test="solutionList[#st.index].verdict==10">verdict_pe</s:elseif>
							<s:elseif test="solutionList[#st.index].verdict<5">verdict_prev</s:elseif>

							<s:else>verdict_other</s:else>
							"
							id="status_<s:property value="solution_id" default="0"/>"
							status="<s:property value="solutionList[#st.index].verdict" default="0"/>"
							manual="0"
							>
							<s:if test="solutionList[#st.index].verdict==3">
							<a solutionId="<s:property value="solution_id" default="0"/>" class="viewCompileInfo" href="view-compileinfo/<s:property value="solution_id" default="0"/>" target="_blank"><s:property value="%{getText('verdict'+solutionList[#st.index].verdict)}"/></a>
							</s:if>
							<s:else>
								<s:property value="%{getText('verdict'+solutionList[#st.index].verdict)}"/>
								<s:if test="solutionList[#st.index].verdict==5"></s:if>
								<s:elseif test="solutionList[#st.index].verdict==4">
	<s:if test="testcase>0"><span>on test <s:property value="testcase" default="1"/></span>
	</s:if>
	</s:elseif>
								<s:elseif test="solutionList[#st.index].verdict>5">
	<s:if test="testcase>0">
	<span>on test <s:property value="testcase" default="1"/></span>
	</s:if>
	</s:elseif>
							</s:else>
							</td>
							<td class="time" id="time_<s:property value="solution_id" default="0"/>"><s:property value="time" default="0"/> ms</td>
							<td class="memory" id="memory_<s:property value="solution_id" default="0"/>"><s:property value="memory" default="0"/> kb</td>
						</tr>
						</s:iterator>
					</table>
				</div>
				<div style="margin: 6px;">
					<div class="left"></div>
					<div class="right">
						<s:if test="page>1">
							<a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">&larr;</a>
						</s:if>
						<s:iterator value="pageList" status="st_page">
							<s:if test="pageList[#st_page.index]==0">...</s:if>
							<s:else><a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property/>" style="color:#000;text-decoration: none;">
								<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
								<s:else><s:property/></s:else>
							</a></s:else>
						</s:iterator>
						<s:if test="page < pageCount">
							<a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">&rarr;</a>
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
