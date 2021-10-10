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
    <title>view-source Solution <s:property value="solutionId"/></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
	<LINK href="css/prettify.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="js/prettify.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		  	prettyPrint();	
		});
	</script> 

  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
        <div class="content">
			<div class="roundbox" style="word-wrap:break-word;">
				<div class="info" style="padding:12px;">
				<h5>
				<s:text name="source"/>:<s:property value="solutionId" />
				</h5>
				<span style="font-size:12px;"><s:text name="codingby"/>:<a class="rated-user user-rate-<s:property value="solution.user.rate" default="0"/> user-tip" user="<s:property value="solution.username"/>" href="profile/<s:property value="solution.username" />"><s:property value="solution.username" /></a>,
				 <s:text name="problem"/>:
				 <s:if test="solution.contest_id>0">
				 <a title="<s:text name="contests"/>:<s:property value="contestTitle" />" href="contest/<s:property value="solution.contest_id" />/problem/<s:property value="problemId" />"><s:property value="problemId" />.<s:property value="problemTitle"/>
				 </a>
				 </s:if>
				 <s:else>
				 <a href="problemset/problem/<s:property value="problemId" />"><s:property value="problemId" />.<s:property value="problemTitle"/>
				 </a>
				</s:else>
				 ,
				 <s:text name="status"/>:<span class="
						<s:if test="solution.verdict==5">verdict_ac</s:if>
						<s:elseif test="solution.verdict==3">verdict_ce</s:elseif>
						<s:elseif test="solution.verdict==10">verdict_pe</s:elseif>
						<s:elseif test="solution.verdict<5">verdict_prev</s:elseif>
						<s:else>verdict_other</s:else>
						" >
						<s:if test="solution.verdict==3">
						<a href="view-compileinfo/<s:property value="solution.solution_id" default="0"/>" ><s:property value="%{getText('verdict'+solution.verdict)}"/></a>
						</s:if>
						<s:else>
							<s:property value="%{getText('verdict'+solution.verdict)}"/>
							<s:if test="solution.verdict==5"></s:if>
							<s:elseif test="solution.verdict==4"><span title="Running on test #<s:property value='testcase' default='1'/>">on test <s:property value="solution.testcase" default="1"/></span></s:elseif>
							<s:elseif test="solution.verdict>5"><span title="Stop on test #<s:property value='testcase' default='1'/>">on test <s:property value="solution.testcase" default="1"/></span></s:elseif>
						</s:else>
						</span>, <s:property value="%{getText('language'+solution.language)}"/>, <s:text name="timeuse"/>:<s:property value="solution.time" /> MS, <s:text name="memoryuse"/>:<s:property value="solution.memory" /> KB, <s:text name="codelength"/>:<s:property value="solution.code_length" /> B
				</span>
				<hr/>
					<pre class="prettyprint"><s:property value="solutionSource.source" /></pre>

				</div>
				<div class="info" style="padding:12px;">
				<h5>Judge Log:</h5>
					<pre class="prettyprint"><s:property value="judgeLog" /></pre>
				</div>
			</div>
			<div style="margin-right: 12px;text-decoration: none;">
				<div class="left"></div>
				<div class="right">
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
