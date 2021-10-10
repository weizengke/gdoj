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
    <title>Contest - Status - <s:property value="contest.title"/> - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
    <div class="container">
	  <div class="content">
     	<div id="nav-content" >
     	<a href="contest/<s:property value="contestId"/>"><s:text name="problems"/></a>
     	<a href="contest/<s:property value="contestId"/>/status" class="current"><s:text name="status"/></a>
     	<a href="contest/<s:property value="contestId"/>/standings" target="blank"><s:text name="standings"/></a>
     		<s:if test="#session.session_username!=null">
     	<a href="contest/<s:property value="contestId"/>/status/with/<s:property value="#session.session_username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
     	</s:if>
     	</div>
     	<div class="data-title" style="width: 100%;position: relative;text-align: center;">
	        <h3><s:property value="contest.title"/></h3>
			<div id="contest_status" class="">
			<s:if test="timeLeft==0" ><span class="ended">Contest Ended</span></s:if>
			<s:elseif test="timeLeft>0">
			<span class="running">Contest Running</span>
			</s:elseif>
			<s:else><span class="pending">Contest Pending</span></s:else>
<s:if test="timeLeft>0" >
			<br/><span id="clock" class="" style=""></span>
<script language="javascript">
var time = <s:property value="timeLeft"/>;
$("#clock").html(OnlineJudge.formatSeconds(time));
function clock(){
if(time>0){
 $("#clock").html(OnlineJudge.formatSeconds(time));
 time--;
 if(time==0){
	$("#contest_status").html("Contest Ended");
	 $("#contest_status").attr('class', 'ended');
	 //alert("Contest Ended.");
 }
 setTimeout(clock, 1000);
}
}

$(document).ready(function(){
clock();
})

</script>
</s:if>
		   </div>
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
	            	<tr class="<s:if test="#st.odd">dark</s:if> ">
	            		<td class="id left-item <s:if test="#session.session_username==username">my</s:if>" title="Open to view source">
	            		<s:if test="opensource==1||#session.session_username==username">
	            		<a solutionId="<s:property value="solution_id" default="0"/>" class="view-source" href="view-source/<s:property value="solution_id" default="0"/>" target="_blank"><s:property value="solution_id" default="0"/></a>
	            		</s:if><s:else><s:property value="solution_id" default="0"/></s:else>
	            		</td>
	            		<td class="coder "><b><a href="profile/<s:property value="username" default="0"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/>"><s:property value="username" default="Unknown"/></a></b></td>
	            		<td class="title" style="">
	            			<a href="contest/<s:property value="contestId"/>/problem/<s:property value="problemList[#st.index].num"/>"><s:property value="problemList[#st.index].num"/>.<s:property value="problemList[#st.index].title" default="Unknow"/></a>
	            		</td>
	            		<td class="language"><s:property value="%{getText('language'+language)}"/></td>
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
						<a href="contest/<s:property value="contestId"/>/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>
					<s:iterator value="pageList" status="st_page">
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="contest/<s:property value="contestId"/>/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>
					<s:if test="page < pageCount">
						<a href="contest/<s:property value="contestId"/>/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>
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
