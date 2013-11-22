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
    <title>Welcome to GuiLin University of Electronic Technology Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System fof ACM">
 	<link href="css/styles.css" type="text/css" rel="stylesheet">
 	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <style>
	.ui-autocomplete-loading { background: white url('img/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-autocomplete {
		max-height: 200px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 3px;
		
		font-size:11px;
		line-height: 12px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 200px;
	}
	
	</style>
    
	 
  </head>
  
  <body>
  <jsp:include  page="../head.jsp" ></jsp:include> 
 
  <div id="body">
   	<div id="content">
   		<div id="nav-content" >	
   		<a href="admin">Admin</a>
   		<a href="admin/news">News</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     	<a href="admin/privilege">Privilege</a>	
     	<a href="admin/operate!switchs.action">Switch</a>
    	 </div>
    	 <div>
    	 	<a href="admin/statistic-chart">统计</a><br/>
    	 	<a href="admin/home-edit">编辑页面</a><br/>
			<a href="admin/recent-action">生成RecentAction页面</a>(自动生成)<br/>
     		<a href="admin/topUsers">生成Top10页面</a>(自动生成)<br/>
			<a href="admin/OpenPath.action?type=OJ_PATH&path=OJ_TMP">查看输出文件目录</a><br/>
			<a href="admin/OpenPath.action?type=OJ_WEB&path=upload\\file">查看上传文件目录</a><br/>
			<form id="runcmd" method="post" action="admin/operate!runcmd.action">
				<input  id="cmdline" style="width: 256px;"  name="cmdline" maxlength="256" /> 
				<input id="sub" style="width: 86px;" type="Submit" value="Run"/>
			</form><br>
     		<form  enctype="multipart/form-data" method="post" action="admin/operate!upload.action">	
				<div class="shiftUp">
					<span class="fielderror"><s:fielderror ><s:param>tip</s:param></s:fielderror></span>
				</div>
      			<input type="file" name="file" value="Choose File"/><input id="sub" type="Submit" style="width: 86px;" value="上传"/>
      			<s:property value="tip"/> 			
			</form><br>
			
		</div>		
     	
     	
   	</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
