<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error.jsp"%>

<%
String path = request.getContextPath();
%>
<%
	String url = request.getParameter("url");
	if(!url.contains("passwordRecovery")&&
            !url.contains("password-recovery")&&
            !url.contains("registration")&&
            !url.contains("register")&&
            !url.contains("login")&&
            !url.contains("enter")&&
            !url.contains("logout")&&
            !url.contains("auth/")&&
            !url.contains("unauth/")){
		session.setAttribute("session_url", url);
	}
 %>

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
//java.util.Date date = new java.util.Date();
//String ip=getIpAddr(request);
//System.out.println("<DEBUG > "+  ip + ", " + url + ", at " + date);
%>