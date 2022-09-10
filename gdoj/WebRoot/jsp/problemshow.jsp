<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<s:if test="#session.session_username==null">
<jsp:include   page="/jsp/problemshowguest.jsp"></jsp:include>
</s:if>
<s:else>
<jsp:include   page="/jsp/problemshowex.jsp"></jsp:include> 
</s:else>
				