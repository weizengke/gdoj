<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error.jsp"%>


<%!public String getIpAddr(HttpServletRequest request) {  
    String ip = request.getHeader("x-forwarded-for");     
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
        ip = request.getHeader("Proxy-Client-IP");     
    }     
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
        ip = request.getHeader("WL-Proxy-Client-IP");     
    }     
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
        ip = request.getRemoteAddr();     
    }     
    return ip;     
}%>
<%
java.util.Date date = new java.util.Date();
String ip=getIpAddr(request);
%>
<%=ip%>