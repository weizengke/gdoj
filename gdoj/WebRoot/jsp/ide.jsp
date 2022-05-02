<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList,
com.util.StreamHandler,
com.util.Config,
com.gdoj.problem.vo.Problem,
com.gdoj.bean.OJUtil" 
pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="com.gdoj.bean.LangBean" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Coding online - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="在线编译和运行, Compile & Run online,C语言,Java,Pascal,JS,Groovy,Lua,Ruby,Python,Pike,Rust,Go,仓颉">
	<meta http-equiv="description" content="在线编译和运行, Compile & Run online">
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
  #problem-box-left{float:left;width:0px!important;display: none;:hidden!important}
  #problem-box-right{float:right;width:100%!important}
  #problem-drag-bar{display: none!important}
  #test-box {display:inline}
  </style>
  <body>
  <jsp:include page="/jsp/head.jsp"></jsp:include>
  <div id="problem-box">
	  <div id="problem-box-left" >
		  <div id="problem-box-nav" class="problem-second-nav">
			  <ul class="hleft">
				  <li id="problem-box-nav-content" class="nav_menu current">
				  </li>
				  <li id="problem-box-nav-status" class="nav_menu">
				  </li>
			  </ul>
			  <ul class="hright">
				  <li class="nav_menu"> </li>
			  </ul>
		  </div>
		  <div id="problem-content" class="problem-content small-scrollbar">
			  <div id="problem-status" class="problem-status"></div>
			  <div id="problem-information" class="problem-information"></div>
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
				  <input type="hidden" id="problemId" name="problemId"  value="0">
				  <select class="lang-choice" id="select_lang" name="language">
					  <%
						  try {
							  List<LangBean> languages = OJUtil.getSupportLanguages();
							  for (LangBean language : languages) {
								  request.setAttribute("LanguageId",language.getId());%>
								  <s:property value="LanguageId"/><option value="<%=language.getId()%>" <s:if test="#session.session_lang==#request.LanguageId">selected="selected"</s:if>><%=language.getLangName() %></option>
							<%}
					  } catch (Exception e) { %>
					  <option value="1" <s:if test="language==1">selected="selected"</s:if>>MS C++</option>
					  <option value="2" <s:if test="language==2">selected="selected"</s:if>>MS C</option>
					  <option value="3" <s:if test="language==3">selected="selected"</s:if>>GNU C++</option>
					  <option value="4" <s:if test="language==4">selected="selected"</s:if>>GNU C</option>
					  <option value="5" <s:if test="language==5">selected="selected"</s:if>>Java 1.8</option>
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
