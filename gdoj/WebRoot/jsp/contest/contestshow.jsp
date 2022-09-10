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
    <title>Contest <s:property value="contest.title"/></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shCore.css"/>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shThemeDefault.css"/>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shCore.js"></script>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shBrushes.js"></script>
<script type="text/javascript">
SyntaxHighlighter.config.clipboardSwf = 'js/ckeditor/plugins/syntaxhighlight/scripts/clipboard.swf';
SyntaxHighlighter.all();
</script> 

  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
    <div class="container">
	  	<div class="content">
			<div class="sidebar">
				 <div class="sidebox roundbox">
					<div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
						<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.infobox"/></div>
					</div>
					<div class="" style="margin: 6px;font-size: 12px;word-wrap:break-word;">
						<pre><s:property value="contest.description" escapeHtml="flase"/></pre>
					</div>
				</div>
		 </div>
			<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     	<a href="contest/<s:property value="contest.contest_id"/>" class="current"><s:text name="contestproblems"/></a>
		<a href="contest/<s:property value="contest.contest_id"/>/status"><s:text name="status"/></a>
     	<a href="contest/<s:property value="contest.contest_id"/>/standings" target="blank"><s:text name="standings"/></a>
     	<s:if test="#session.session_username!=null">
     	<a href="contest/<s:property value="contest.contest_id"/>/status/with/<s:property value="#session.session_username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
     	</s:if>
     	</div>
	    <div class="content" style="padding:3px 3px 3px 3px;">	    		
				<div class="data-title">
					<h3>
						<s:property value="contest.title"/>
					</h3>
					Start Time:<s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>	
					&nbsp;&nbsp;End Time:<s:date  name="contest.end_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>
					<br/>
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
<!--					<s:if test="contest.password==''">Public</s:if><s:else>Private</s:else>-->
				</div>
				<div class="roundbox">
				<div>
					<table class="problem rtable">
						 <tr class="header">
							 <th class="id left-item"><s:text name="problemid"/></th>
							 <th class="title"><s:text name="problem"/></th>
							 <s:if test="contest.type==1"><th class="point"><s:text name="point"/></th></s:if>
							 <th class="solved"><s:text name="solved"/>/<s:text name="submit"/></th>
							 <th class="ratio"></th>
						</tr>
						<s:if test="problemList.size==0">
						 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
						</s:if>
						<s:iterator value="problemList" status="st">
						<tr <s:if test="#st.odd">class="dark"</s:if>>
							<td class="id left-item"><a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>"><s:property value="num"/></a></td>
							<td class="title" style="text-align: left;word-wrap:break-word;">
								<a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>"><s:property value="title"/></a>
							</td>
							<s:if test="contest.type==1"><td class="point"><s:property value="point"/>pt</td></s:if>
							<td class="solved">
							<a href="contest/<s:property value="contest.contest_id"/>/status/problem/<s:property value="num"/>/page/1" title="users solved this problem"><s:property value="solved" default="0"/></a><span style="font-size:11px;color:grey;font-family:verdana,Serif,Arial;" title="submissions"><sub>/<s:property value="submit" default="0"/></sub> </span>
							</td>
							<td class="ratio" >
							<a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>" style="">
							<s:if test="problemStatusList[#st.index]==1">
							<img title="<s:text name="submit"/>" src="img/submit-green-22.png" style="vertical-align: middle;">
							</s:if><s:else>
							<img title="<s:text name="submit"/>" src="img/submit-22.png" style="vertical-align: middle;">
							</s:else>
							</a>
							</td>
						</tr>
						</s:iterator>
					</table>
				</div>
			</div>	

		   </div>    
		</div>
		    <div class="clear"></div>
		</div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
