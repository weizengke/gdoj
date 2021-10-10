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
  	<jsp:include page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
  		<div class="content">
		    <div class="sidebar"> 	
	       	  <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	    </div> <!-- End sidebar -->
	      	<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
				<div id="nav-content" >
				<a href="profile/<s:property value="user.username"/>" class="current"><s:property value="user.username"/></a>
				<s:if test="user.username==#session.session_username">
				<a href="settings"><s:text name="settings"/></a>
				</s:if>
				<a href="problemset/status/with/<s:property value="user.username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
				<a href="contests/<s:property value="user.username"/>" target="blank"><s:text name="mycontest"/></a>
				</div>
				<div class="roundbox" style="position: relative; padding:12px;height:300px;">
					<div style="float:right;border:1px solid #f0f0f0;width:260px;height:90%;padding:12px;">
						<div style="height:90%;line-height:200px;text-align:center;">
							<img style="margin:auto;vertical-align:middle;display:inline;max-width:100%;max-height:100%;" alt="<s:property value="user.username"/>" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="user.username"/>/</s:if><s:else>img/</s:else>photo.png" />
						</div>
					</div>
					<div style="word-wrap:break-word;width:350px;">
					 <ul style="padding: 0px;margin: 0px;">
						<li><span class="rated-user user-rate-<s:property value="user.rate"/>" style="font-size: 12px;"><s:property value="%{getText('user_rate'+user.rate)}"/></span></li>
						<li><span class="rated-user user-rate-<s:property value="user.rate"/>" style="font-size: 16px;"><s:property value="user.username"/></span>
							<s:if test="user.nickname==''||user.nickname==null"></s:if><s:else><span style="color:grey;font-size: 16px;">(<s:property value="user.nickname"/>)</span></s:else>
							<!--<a href="mails/new/<s:property value="user.username"/>" title="mail to <s:property value="user.username"/>">@<s:property value="user.username"/></a> --></li>
						<li><span style="color:#000">
							<s:if test="user.school==null||user.school==''"></s:if><s:else><span style="color:grey"><s:text name="profile.from"/></span> <s:property value="user.school"/></s:else>
						</span></li>
						<li><span style="color:#378059;"><s:if test="user.motto==null||user.motto==''">Welcome to Online Judge</s:if><s:else><s:property value="user.motto"/></s:else></span></li>

						<s:if test="#session.session_username==user.username">
						<li><s:text name="profile.email"/>: <s:property value="user.email" default="0"/> &nbsp; &nbsp;<span style="color:grey">(<s:text name="profile.invisible"/>)</span></li>
						<li><s:text name="profile.birthday"/>: <s:date name="user.birthday" nice="false" format="yyyy-MM-dd"/>&nbsp; &nbsp;<span style="color:grey">(<s:text name="profile.invisible"/>)</span></li>
						</s:if>
						<!--
						<li><span title="<s:date name="user.lastlogin" nice="true" format="yyyy-MM-dd HH:mm:ss"/>"> Last login: <s:date name="user.lastlogin" nice="false" format="yyyy-MM-dd HH:mm:ss"/></span></li>
						 -->
						<li><span title="<s:date name="user.lastaccesstime" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"><s:text name="profile.Last_visit"/>: <s:property value="lastAccessTime" default="unknow"/></span> <s:if test="statusFlag == 1"><span style="color:green;font-weight:bold;">Online Now</span></s:if> </li>
						<li><span title="<s:date name="user.regdate" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"> <s:text name="profile.Registered"/>: <s:property value="registerDate" default="unknow"/></span></li>

						<li><s:text name="profile.default_language"/>: <s:property value="%{getText('language'+user.language)}"/></li>
						<li><s:text name="profile.open_source"/>: <s:if test="user.opensource==\"N\"">No</s:if>
						<s:else>Yes</s:else>
						</li>
					   <!-- <li><s:text name="profile.rank"/>: <b><s:property value="rank" default="0"/></b> &nbsp;&nbsp;<s:text name="profile.solve"/>: <b><s:property value="user.solved" default="0"/></b>  &nbsp;&nbsp;<s:text name="profile.submissions"/>: <b><s:property value="user.submit" default="0"/></b></li>	 -->
						<li><s:text name="profile.rating"/>: <span class="rated-user user-rate-<s:property value="user.rate"/>" style="font-size: 12px;"><s:property value="user.rating"/></span></li>
					  </ul>
					</div>
				</div>
				<br/>
				<div class="roundbox">
					<div style="padding: 4px 0 0 6px;position: relative;">
						<div class="left"><s:text name="profile.rating_history"/></div>
						<div class="right"></div>
					</div>
					<br/>
					<div id="placeholder" style="width:100%;height:300px;word-wrap:break-word;"></div>
				</div>
					<script type="text/javascript" src="js/jquery.flot.min.js"></script>
					<script type="text/javascript">
					$(document).ready(function() {
						OnlineJudge.ratingGragh("<s:property value="user.username"/>");
					});
					</script>
				<br/>
				<div class="roundbox">
					<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="profile.problem_solve"/> (<s:property value="problemSolvedList.size"/>)</div>
				<div class="right"></div>
				</div>
					<br/>
					<div style="padding: 6px;word-wrap:break-word;">
						<s:iterator value="problemSolvedList" status="pst">
						 <span title="<s:property value="title"/>"><a class="solved" href="problemset/status/problem/<s:property value="problem_id"/>/with/<s:property value="user.username"/>/page/1"><s:property value="problem_id"/></a></span>
						</s:iterator>
					</div>
				</div>
				<br/>
				<div class="roundbox">
					<div style="padding: 4px 0 0 6px;position: relative;">
						<div class="left"><s:text name="profile.problem_try"/> (<s:property value="problemTryList.size"/>)</div>
						<div class="right"></div>
					</div>
					<br/>
					<div style="padding: 6px;word-wrap:break-word;">
						<s:iterator value="problemTryList" status="pst">
						 <span title="<s:property value="title"/>"><a class="unsolved" href="problemset/status/problem/<s:property value="problem_id"/>/with/<s:property value="user.username"/>/page/1"><s:property value="problem_id"/></a></span>
						</s:iterator>
					</div>
				</div>
	      	</div>
			<div class="clear"></div>
      	</div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
	</div>
  </body>
</html>
