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
    <title>Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
 	<link href="css/styles.css" type="text/css" rel="stylesheet">
 	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  
  <body>
  <jsp:include  page="../head.jsp" ></jsp:include> 
   	<div class="container">
        <div class="content">  
			<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include>
			<div style="margin: 12px;">
	 	<strong>权限控制</strong><br/>
	 	开放源码&nbsp;<select id=OPENSOURCE name="OPENSOURCE" style="width:68px;" onchange="change('OPENSOURCE')">						
					<option value="YES" <s:if test="opensource==\"YES\"">selected</s:if>>开启</option>
					<option value="NO" <s:if test="opensource==\"NO\"">selected</s:if>>关闭</option>
			</select>
		<br/>
		开放BBS&nbsp;<select id=OPENBBS name="OPENBBS" style="width:68px;" onchange="change('OPENBBS')">						
					<option value="YES" <s:if test="topic_switch==\"YES\"">selected</s:if>>开启</option>
					<option value="NO" <s:if test="topic_switch==\"NO\"">selected</s:if>>关闭</option>
			</select>
		<br/>
<script>
function change(privilege){
	var obj = document.getElementById(privilege);	
	var privilege_value = obj.value;
	 $.post("admin/operate!changeSwitch.action", { privilege:privilege,privilege_value:privilege_value} ,function(data){
			var obj = eval('(' + data + ')');
			alert(obj.message);		
	});
}
</script>		
	 	</div>
			<div class="clear"></div>
   		</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
