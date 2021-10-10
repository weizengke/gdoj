<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList,
com.util.Config,
com.gdoj.problem.vo.Problem,
com.gdoj.bean.OJUtil" 
pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Problem <s:property value="problem.problem_id"/>.<s:property value="problem.title"/> - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
	<link data-name="js/monaco-editor/vs/editor/editor.main" rel="stylesheet" href="js/monaco-editor/min/vs/editor/editor.main.css">
	<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shCore.css"/>
	<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shThemeDefault.css"/>
	<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shCore.js"></script>
	<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shBrushes.js"></script>
	<script type="text/javascript">
	SyntaxHighlighter.config.clipboardSwf = 'js/ckeditor/plugins/syntaxhighlight/scripts/clipboard.swf';
	SyntaxHighlighter.all();
	</script>
  </head>
  <style>
  .headerNav{min-width:1024px;width:96%!important;}
  .headerNav ul.hright{margin-right:0px;!important;}
  .container {width:100%!important;}
  body, html {margin:0!important; height:100%!important; overflow-x:hidden!important;overflow-y:hidden!important}
  </style>
  <body> 
  	<jsp:include page="/jsp/head.jsp"></jsp:include> 
  	<div style="height:100%;">
	  <div id="problem-box">
	    <div id="problem-box-left" >
	 		<div id="problem-box-nav" class="problem-second-nav">
				<ul class="hleft">
					<li id="problem-box-nav-content" class="nav_menu current">
						<span><s:text name="problem.description"/></span>
					</li>
					<li id="problem-box-nav-status" class="nav_menu">
						<span class="problem-box-nav-status" ><s:text name="problem.mysubmit"/></span>
					</li>
				</ul>
				<ul class="hright">
					<li class="nav_menu"> </li>
				</ul>
	     	</div>
	 		<div id="problem-content" class="problem-content small-scrollbar">
				<div id="problem-status" class="problem-status">
					<div class="roundbox" style="">
						<div class="roundbox-title ">
							<div class="left"><s:property value="problem.problem_id"/>.<s:property value="problem.title"/></div>
							<div class="right">
								<span><a style="margin-right: 6px;font-size:10px;color:grey;text-decoration:none;" href="problemset/status/problem/<s:property value="problem.problem_id"/>/page/1"><s:text name="problem.all_submit"/></a></span>
							</div>
						</div>
						<div class="" style="">
							<table class="status rtable">
								<tr class="header">
									<th  class="verdict left-item"><s:text name="status"/></th>
									<th  class="time"><s:text name="timeuse"/></th>
									<th  class="memory"><s:text name="memoryuse"/></th>
									<th  class="language"><s:text name="language"/></th>
									<th  class="date"><s:text name="submitdate"/></th>
								</tr>
							</table>
						</div>
						<div id="problem-status-loader" class="problem-status-loader"><img src='img/loader.gif'></div>
					</div>

				</div>
				<div id="problem-information" class="problem-information">
					<div class="data-title">
						<h3><s:property value="problem.problem_id"/>.<s:property value="problem.title"/></h3>
						<s:text name="problem.time_limit"/>:<s:property value="problem.time_limit" default="0"/>MS&nbsp;&nbsp;<s:text name="problem.memory_limit"/>:<s:property value="problem.memory_limit" default="0"/>KB<br/>
					</div>
					<div class="probleminfo" style="padding:0px 12px 12px 0px;">
						<h5><s:text name="problem.description"/>:</h5><s:property value="problem.description" default="" escape="false"/>
						<h5><s:text name="problem.input"/>:</h5><s:property value="problem.input" default="" escape="false"/>
						<h5><s:text name="problem.output"/>:</h5><s:property value="problem.output" default="" escape="false"/>
						<h5><s:text name="problem.sample_test"/>:</h5>
							<div class="sample-test">
								<div class="input"><div class="title"><s:text name="problem.sample_input"/></div>
								<div class="sample-input"><pre><s:property value="problem.sample_input" default="" escape="false"/></pre></div>
								</div>
								<div class="output"><div class="title"><s:text name="problem.sample_output"/></div>
								<div class="sample-output"><pre><s:property value="problem.sample_output" default="" escape="false"/></pre></div>
								</div>
							</div>
						<h5><s:text name="problem.note"/>:</h5><s:property value="problem.hint" default="" escape="false"/>
						<h5><s:text name="problem.tags"/>:</h5>
						<div class="tags">
							<s:if test="tagsList.size==0"><span style="font: 11px/26px Monaco, monospace;color: #454545;"><s:text name="notags"/></span></s:if>
							<s:else><s:iterator  value="tagsList" status="tagsst" >
								<a href="search?word=<s:property />&type=problem" rel="tag" ><s:property /></a>
							</s:iterator></s:else>
						</div>
					</div>
				</div>
			</div>
			<div id="bottom-bar-left">
				<div class="bottom_button"></div>
			</div>
	 	</div>
	 	<div id="problem-drag-bar"></div>
	 	<div id="problem-box-right">
			<div id="ide-box-nav" class="ide-second-nav">
				<div class="ide-box-nav-left">
					<input type="hidden" id="username" name="username" value="<s:property value="#session.session_username"/>"/>
					<input type="hidden" id="contestId" name="contestId" value="0"/>
					<input type="hidden" id="problemId" name="problemId"  value="<s:property value="problemId"/>">
					<select class="lang-choice" id="select_lang" name="language">
						<%
							try {
								Integer problemId = Integer.valueOf(request.getParameter("problemId"));
								Problem problem = OJUtil.queryProblem(problemId);
								String szOjName = "GUET";
								if (null != problem) {
									szOjName = problem.getOj_name();
								}

								String szLangPath = Config.getValue("OJ_LANG_PATH");
								if (1 == problem.getIsvirtual() && szOjName.equals("HDU")) {
									szLangPath = Config.getValue("OJ_LANG_PATH_HDU");
								}
								File f = new File(szLangPath);
								DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
								DocumentBuilder builder = factory.newDocumentBuilder();
								Document doc = builder.parse(f);
								NodeList nl = doc.getElementsByTagName("VALUE");
								String LanguageId=new String();
								String Language=new String();
								for (int i = 0; i < nl.getLength(); i++) {
									LanguageId=doc.getElementsByTagName("ID").item(i).getFirstChild().getNodeValue();
									Language=doc.getElementsByTagName("LANG").item(i).getFirstChild().getNodeValue();
									request.setAttribute("LanguageId",LanguageId); %>
						<s:property value="LanguageId"/><option value="<%=LanguageId%>" <s:if test="#session.session_lang==#request.LanguageId">selected="selected"</s:if>><%=Language %></option>
						<%}
						} catch (Exception e) {%>
						<option value="1" <s:if test="language==1">selected="selected"</s:if>>MS C++</option>
						<option value="2" <s:if test="language==2">selected="selected"</s:if>>MS C</option>
						<option value="3" <s:if test="language==3">selected="selected"</s:if>>GNU C++</option>
						<option value="4" <s:if test="language==4">selected="selected"</s:if>>GNU C</option>
						<option value="5" <s:if test="language==5">selected="selected"</s:if>>Java</option>
						<option value="8" <s:if test="language==8">selected="selected"</s:if>>Pascal</option>
						<% } %>
					</select>
				</div>
				<div class="ide-box-nav-right">
					<span class="ide-setting" title="<s:text name="ide.setting"/>">
						<img src="img/ide_setting.png" onmouseover="this.src='img/ide_setting_on.png'" onmouseout="this.src='img/ide_setting.png'" />
					</span>
				</div>
			</div>
			<div id="ide-box" class="ide-box">
				<div id="source" class="source-box"></div>
				<div id="test-box">
					<div id="test-box-nav">
						<div id="test-nav-tab-input" class="test-box-nav-tab test-box-nav-tab-cur"><s:text name="problem.testbox.input"/></div>
						<div id="test-nav-tab-output" class="test-box-nav-tab"><s:text name="problem.testbox.output"/></div>
					</div>
					<table class="test-box-tb">
						<tr id="test-box-tb-input" >
							<td><textarea id="input" class="test-box-input small-scrollbar" name="input" rows="10"><s:property value="problem.sample_input" default="" escape="false"/></textarea></td>
						</tr>
						<tr id="test-box-tb-output" style="display:none">
							<td>
							<span id="output-status" class="test-box-output-status"><s:text name="problem.testbox.running_code"/></span><br>
							<textarea id="output" class="test-box-output small-scrollbar" name="output" rows="10"readonly="readonly"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="bottom-bar-right">
				<div id="consoleMenu" class="console-menu"><s:text name="problem.console"/><span id="consoleCaert" class="caret-down"></span></div>
	 			<div class="bottom_button">	
					<input id="runsolution" class="run-solution button_submit" type="submit" value="<s:text name="submit.run"/>"/>  
					<input id="submitsolution" class="submit-solution button_submit" type="submit" value="<s:text name="submit.submit"/>"/>
				</div>
	 	 	</div>
		</div>
  	  </div>
	</div>

<script>var require = { paths: { 'vs': 'js/monaco-editor/min/vs' } };</script>
<script type="text/javascript" src="js/monaco-editor/min/vs/loader.js"></script>
<script type="text/javascript" src="js/monaco-editor/min/vs/editor/editor.main.nls.js"></script>
<script type="text/javascript" src="js/monaco-editor/min/vs/editor/editor.main.js"></script>  
<script type="text/javascript" src="js/submit.js"></script>  
<jsp:include page="/jsp/ide-setting.jsp"></jsp:include>
<jsp:include page="/jsp/status-pop.jsp"></jsp:include>
  </body>
</html>
