<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
   <sx:head extraLocales="en-us,nl-nl,de-de" />
    <base href="<%=basePath%>">
    <title>Modify Info.</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
 	 <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
 	 <script type="text/javascript" src="js/gdoj.js"></script>
 	<script type="text/javascript">

        $(document).ready(function() {

    $('input.birthday').datepick({

    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:0",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'

    });

        });

    </script>
  </head>

<body>
<jsp:include  page="/jsp/head.jsp" ></jsp:include> 
<div id="body">
	<div id="sidebar"> 	
          
	    <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div> <!-- End sidebar -->
  
    <div id="content"  class="content-with-sidebar">  
       <div id="nav-content" style="">
			<a href="profile/<s:property value="#session.session_username"/>" ><s:property value="#session.session_username"/></a>
	      	<a href="settings" cssClass="current"><s:text name="settings"/></a>	      
	        <a href="problemset/status/with/<s:property value="user.username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
	   </div>
       <div class="content " style="">
		       <div class="profile roundbox " style="">   
		          <div class="roundbox-lt">&nbsp;</div>
	       		  <div class="roundbox-rt">&nbsp;</div>	   
	       		  <div class="roundbox-lb">&nbsp;</div>
	       		  <div class="roundbox-rb">&nbsp;</div>	 
	       		<div style="padding: 6px;">
				    <div style="float:right;border:1px solid #B9B9B9;width:240px;min-height:150px;padding:12px;">
				    	<div>
        					<div style="min-height:200px;line-height:200px;text-align:center;">
				    			<img style="margin:auto;vertical-align:middle;display:inline;" alt="<s:property value="#session.session_username"/>" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo_250.jpg">			
				    		</div>
				    		<div>Change your photo here...<br/>
				    		jpg/png/bmp/gif ,and 5 Mb limit.
				    			<form enctype="multipart/form-data" method="post" action="uploadphoto">
					                <input type="hidden" name="titleFormSubmitted" value="true"/>
					                <input type="file" name="titlePhoto" value="Choose file"/>			                
					                <hr/>
				                	<input style="padding: 0 1em;" type="submit" class="upload-photo" value="Upload"/>  
			           		   </form>
			           		 </div> 
				    	</div>	
				   </div>
				   <div style="word-wrap:break-word;width:350px;">
				      <s:form id="modifyuser" method="post" action="modifyUser.action" theme="simple">
			            <input type="hidden" name="submited" value="true">
			             <div style="margin-left: 6px;width: 368px;">
			                <table class="table-form" >
			                   <tr>
				                  <td class="field-name">Email</td>
				                  <td > <input  id="email" name="user.email" style="width: 250px;" placeholder="Your e-mail address" value="<s:property value="user.email"/>"/></td> 
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td align="left" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>user.email</s:param></s:fielderror></span></div> </td> 
			                  </tr>  
			                  <tr>
				                  <td class="field-name">Old Password</td>
				                  <td> <input  id="old_password" name="old_password" style="width: 250px;" maxlength="30" type="password" placeholder="Input your password" value=""/></td> 
			                  </tr>
			                   <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td align="left" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>old_password</s:param></s:fielderror></span></div> </td> 
			                  </tr>  
			                  <tr>
				                  <td class="field-name">New Password</td>
				                  <td> <input  id="password" name="password" style="width: 250px;" maxlength="30" type="password" placeholder="Make it blank if you don't want to change it" value=""/></td> 
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>password</s:param></s:fielderror></span></div></td> 
			                  </tr>     
			                  <tr>
				                  <td class="field-name">Confirm New Password</td>
				                  <td> <input  id="password2"  name="repeat_password" style="width: 250px;" type="password" maxlength="30" placeholder="Enter password again"  value=""/></td> 
			                  </tr> 
			                   <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>repeat_password</s:param></s:fielderror></span></div></td> 
			                  </tr>
			                  <tr>
				                  <td class="field-name">Nickname</td>
				                  <td class="input"> <input  id="nickname" style="width: 250px;"  name="user.nickname" maxlength="30" placeholder="Less than 30 chars" value="<s:property value="user.nickname"/>" /></td>
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>user.nickname</s:param></s:fielderror></span></div></td>
			                  </tr>
			                  <tr>
			              	  <td colspan="2">
			               		<div class="extra-register-info">
				               		<table>
				               		 <tr>
						                  <td class="field-name">School</td>
						                  <td > <input  name="user.school" style="width: 250px;" value="<s:property value="user.school"/>" maxlength="30" placeholder="Less than 30 chars">
										  </td> 
				                	  </tr>
				               		  <tr>
						                  <td class="field-name">motto(格言)</td>
						                  <td > <textarea  id="motto" name="user.motto" rows="5" style="width: 250px;" placeholder="Your motto(格言)" ><s:property value="user.motto"/></textarea></td> 
				                	  </tr>
				               		 <tr>
						                  <td class="field-name">Birthday</td>
						                  <td ><input style="width: 220px" class="birthday" name="birthday" readonly="readonly" value=<s:property value="birthday"/>> 
										  </td> 
				                	  </tr>
				             		 <tr>
						                  <td class="field-name">Open Source:</td>
						                   <td >
						                   <select id="opensource"  style= "width:60px" name="user.opensource">
											<option value="N" <s:if test="user.opensource==\"N\"">selected="selected"</s:if>>No</option>
											<option value="Y" <s:if test="user.opensource==\"Y\"">selected="selected"</s:if>>Yes</option>
											</select>
						                   </td>
				                	 </tr>        	 
				                	 <tr>
				                	  	<td class="field-name">Default Language:</td>
										<td><select id="select_lang"  style= "width:250px" name="user.language">
														<%
										   try {
										   		long lasting = System.currentTimeMillis();
												File f = new File("D:\\OJ\\GDOJ\\Language.xml");
												DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
												DocumentBuilder builder = factory.newDocumentBuilder();
												Document doc = builder.parse(f);
												NodeList nl = doc.getElementsByTagName("VALUE");
												String LanguageId=new String();
												String Language=new String();
												for (int i = 0; i < nl.getLength(); i++) {	
													LanguageId=doc.getElementsByTagName("ID").item(i).getFirstChild().getNodeValue();
													Language=doc.getElementsByTagName("LANG").item(i).getFirstChild().getNodeValue();
													request.setAttribute("LanguageId",LanguageId); 
													//System.out.print("Language:"+Language);
													//System.out.println("运行时间：" + (System.currentTimeMillis() - lasting)+ "毫秒");
												
								   		 		%>		   		 			
													<s:property value="LanguageId"/><option value="<%=LanguageId%>" <s:if test="user.language==#request.LanguageId">selected="selected"</s:if>><%=Language %></option>
												<%
												}
											} catch (Exception e) {
											%>
													<option value="1" <s:if test="user.language==1">selected="selected"</s:if>>MS C++</option>
													<option value="2" <s:if test="user.language==2">selected="selected"</s:if>>MS C</option>
													<option value="3" <s:if test="user.language==3">selected="selected"</s:if>>GNU C++</option>
													<option value="4" <s:if test="user.language==4">selected="selected"</s:if>>GNU C</option>
													<option value="5" <s:if test="user.language==5">selected="selected"</s:if>>Java</option>
													<option value="8" <s:if test="user.language==8">selected="selected"</s:if>>Pascal</option>
											<% } %>		
													</select>
				                	  	</td>
				                	  </tr>
				               		</table>
				               		
			               		</div>
			               	</td> 
			               </tr>
			                      
			            	<tr>
			                  <td class="field-name">&nbsp;</td>
			                  <td align="center" ><input id="save" type="Submit" value="Save Changes"/> </td> 
			               </tr>	
			      		</table>
			      		</div>
			      	  </s:form>
				    </div>				    
			    </div>
		     </div>  
	    </div>
<script type="text/javascript">
document.getElementById('old_password').focus()
</script> 	    
  </div>   
  <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
