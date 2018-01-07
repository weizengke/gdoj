<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>


<html>
  <head lang="en">
    <base href="<%=basePath%>">
    <title><s:text name="register"/> - Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
		
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="js/jquery-1.7.1.js"></script>
	<script src="js/ui/jquery.ui.core.js"></script>
	<script src="js/ui/jquery.ui.widget.js"></script>
	<script src="js/ui/jquery.ui.datepicker.js"></script>
	
	<script type="text/javascript" src="js/ui/jquery.ui.mouse.js"></script>
    <script type="text/javascript" src="js/ui/jquery.ui.sortable.js"></script>
	
  	<script type="text/javascript" src="js/gdoj.js"></script>

</head>
  
  <body>
    <jsp:include  page="/jsp/head.jsp" ></jsp:include>
  <div id="body">
	    
    <div style="position: relative;">
      	<div id="content" >
		 	<div>
				<div class="roundbox" style="width: 420px;margin:24px auto;">
					 <div class="roundbox-lt">&nbsp;</div>
	           		<div class="roundbox-rt">&nbsp;</div>
	           		<div class="roundbox-lb">&nbsp;</div>
	           		<div class="roundbox-rb">&nbsp;</div>
					 <div class="top-link">
			           	<div class="titled"><s:text name="register"/>
			          	 </div>
		       		 </div>	 		       		 
					 <div class="register-box">
						<form id="register" method="post" action="register">	
			                <table class="table-form">
			                  <tr>
				                  <td class="field-name"><s:text name="register.username"/></td>
				                  <td class="input"> <input  id="username" style="width: 250px;"  name="username" maxlength="30" placeholder="Only letters, numbers, dashes or dots" value="<s:property value="username"/>" /></td>
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>username</s:param></s:fielderror></span></div></td>
			                  </tr>
			                  <tr>
				                  <td class="field-name"><s:text name="register.password"/></td>
				                  <td> <input  id="password" name="password" style="width: 250px;" maxlength="30" type="password" placeholder="Minimum of 6 chars" value=""/></td> 
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>password</s:param></s:fielderror></span></div></td> 
			                  </tr>     
			                  <tr>
				                  <td class="field-name"><s:text name="register.confirm"/></td>
				                  <td> <input  id="password2"  name="repeat_password" style="width: 250px;" type="password" maxlength="30" placeholder="Enter password again"  value=""/></td> 
			                  </tr> 
			                   <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>repeat_password</s:param></s:fielderror></span></div></td> 
			                  </tr>
			                  <tr>
				                  <td class="field-name"><s:text name="register.email"/></td>
				                  <td > <input  id="email" name="email" style="width: 250px;" placeholder="Your e-mail address" value="<s:property value="email"/>"/></td> 
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td align="left" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>email</s:param></s:fielderror></span></div> </td> 
			                  </tr>  
			           <!--       
			                  <tr>
			               <td colspan="2">
			               		<div class="extra-register-info">
				               		<table>
				               		  <tr>
						                  <td class="field-name">motto</td>
						                  <td > <textarea  id="motto" name="motto" rows="5" style="width: 250px;" placeholder="Your motto(格言)" ><s:property value="motto"/></textarea></td> 
				                	  </tr>
				               		 <tr>
						                  <td class="field-name">Birthday</td>
						                  <td > 	
										  </td> 
				                	  </tr>
				               		</table>
				               		
			               		</div>
			               	</td> 
			               </tr>
			              -->        
			            	<tr>
			                  <td align="center" colspan="2"><input id="sub" type="Submit" style="width: 86px;" value="<s:text name="register"/>"/> </td> 
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
