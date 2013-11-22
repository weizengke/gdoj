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
    <title>Password-Recovery</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript">
	</script>
</head>
  
  <body>
  <jsp:include   page="/jsp/head.jsp"/> 
  <div id="body">   
    <div style="position: relative;">
      <div id="content" >
		 <div>
			<div class="roundbox" style="width: 420px;margin: 24px auto;">
            	<div class="roundbox-lt">&nbsp;</div>
           		<div class="roundbox-rt">&nbsp;</div>
           		<div class="roundbox-lb">&nbsp;</div>
           		<div class="roundbox-rb">&nbsp;</div>
					<div class="top-link"> 
					  <div class="titled">Password-Recovery  
			          </div>
			        </div>  
					<div class="register-box">
						<form id="revocer" method="post" action="passwordRecovery">
							<table class="table-form">       
							 <tr>
				                  <td class="field-name">Username</td>
				                  <td class="input"> <input  id="username" style="width: 250px;"  name="username" maxlength="30" placeholder="Your username,not your nickname" value="<s:property value="username"/>"/></td>
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>username</s:param></s:fielderror></span></div></td>
			                  </tr>	
							 <tr>
				                  <td class="field-name">Register-Email</td>
				                  <td class="input"> <input  id="email" style="width: 250px;"  name="email" maxlength="30" placeholder="Your registration-email" value="<s:property value="email"/>"/></td>
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>email</s:param></s:fielderror></span></div></td>
			                  </tr>	
				                  
			                    <tr>
			                        <td colspan="2">
			                            <div style="text-align: center;"><input id="sub" type="Submit" value="Revocer"/></div>        
			                        </td>
			                    </tr>
			                </table>
			            </form>
			      </div>
			  </div>      
	       </div>     
	    </div>   
    </div>
    
        <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
