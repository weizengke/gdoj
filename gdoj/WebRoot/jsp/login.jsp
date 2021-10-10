<%@ page language="java" import="java.util.*,
com.util.Config
" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
</head>
  <body>
  <jsp:include   page="/jsp/head.jsp"/> 
	<div class="container">
		<div class="content">
			<div class="roundbox" style="width: 420px;margin: 24px auto;">
					<div class="roundbox-title">
					  <div class="titled"><s:text name="login"/></div>
					</div>
					<div class="register-box">
						<form id="login" method="post" action="login">
							<table class="table-form">
							   <tr>
								  <td colspan="2" class="input">
									  <input class="register-box-input" id="handle" name="handle" maxlength="30" placeholder="<s:text name="login.username"/>" value="<s:property value="handle"/>"/>
								  </td>
							  </tr>
							  <tr class="subscription-row">
								  <td colspan="2"> <div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>handle</s:param></s:fielderror></span></div></td>
							  </tr>
							  <tr>
								  <td colspan="2">
									  <input class="register-box-input" id="password" name="password" maxlength="30" placeholder="<s:text name="login.password"/>" type="password"  value=""/>
								  </td>
							  </tr>
							  <tr class="subscription-row">
								  <td colspan="2"><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>password</s:param></s:fielderror></span></div></td>
							  </tr>
								<tr>
									<td colspan="2" align="right">
										<input id="remember" style="top:0.25em;" type="checkbox"  checked="checked" name="remember"/><s:text name="login.remember"/>
									</td>
								</tr>
								 <tr>
									<td colspan="2">
										<div>
											<input class="register-box-submit" id="sub" type="Submit" value="<s:text name="login"/>"/>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="text-align: right; margin-bottom: -16px;"><a href="registration"><s:text name="login.register"/></a> | <a href="password-recovery"><s:text name="login.recovery"/></a></div>
									</td>
								</tr>

							</table>
						</form>
						<span class="third-party-title"> &nbsp;<s:text name="login-with-third-part-account"/>&nbsp; </span>
						<table class="table-form" style="">
							<tr>
								<td align="center">
									<%
										String github_client_id = Config.getValue("GITHUB_CLIENT_ID");
										String gitee_client_id = Config.getValue("GITEE_CLIENT_ID");
										String gitee_redirect_url = Config.getValue("GITEE_REDIRECT_URL");
									%>
									<a href="https://github.com/login/oauth/authorize?client_id=<%=github_client_id%>">
										<img class="third-party-logo" src="img/github.jpeg" title="<s:text name="login-with-github"/>" alt="<s:text name="login-with-github"/>">
									</a>&nbsp;&nbsp;
									<a href="https://gitee.com/oauth/authorize?client_id=<%=gitee_client_id%>&redirect_uri=<%=gitee_redirect_url%>&response_type=code">
										<img class="third-party-logo" src="img/gitee.jpeg" title="<s:text name="login-with-gitee"/>" alt="<s:text name="login-with-gitee"/>"></a>
									</a>
								</td>
							</tr>
							<tr class="subscription-row">
								<td colspan="3" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>open-auth</s:param></s:fielderror></span></div></td>
							</tr>
						</table>
				  </div>
			  </div>
			<div class="clear"></div>
		</div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
	 </div>
  </body>
</html>
