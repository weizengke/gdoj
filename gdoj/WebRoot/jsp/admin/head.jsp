<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

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