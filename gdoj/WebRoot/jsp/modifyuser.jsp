<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList,
com.util.Config" pageEncoding="UTF-8"%>
<%@ page import="com.gdoj.bean.LangBean" %>
<%@ page import="com.gdoj.bean.OJUtil" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="/struts-dojo-tags" prefix="sx"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
   <sx:head extraLocales="en-us,nl-nl,de-de" />
    <base href="<%=basePath%>">
    <title>Setings</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
 	 <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
 	 <script type="text/javascript" src="js/gdoj.js"></script>
 	 <script type="text/javascript" src="js/datepick.js"></script>
  	<link rel="stylesheet" href="js/cropperjs/dist/cropper.css">
	<script src="js/cropperjs/dist/cropper.js"></script>	
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
    <div class="container">
	  <div class="content">
		<div class="sidebar">       
	 	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
	   	</div> 
    	<div class="content-with-sidebar round0123"  >    
	       <div id="nav-content" style="">
				<a href="profile/<s:property value="#session.session_username"/>" ><s:property value="#session.session_username"/></a>
		      	<a href="settings" class="current"><s:text name="settings"/></a>
		        <a href="problemset/status/with/<s:property value="user.username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
			    <a href="contests/<s:property value="username"/>" target="blank"><s:text name="mycontest"/></a>
		   </div>
	       <div class="content " style="">
			       <div class="profile roundbox ">
		       		<div style="padding: 6px;">
					    <div style="float:right;border:1px solid #B9B9B9;width:300px;height:300px;padding:12px;margin-rigut:15px;">
        					<div style="text-align:center;">
				    			<img style="margin:auto;vertical-align:middle;width:250px;max-height:250px;" alt="<s:property value="#session.session_username"/>" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo.png">			
	           					<hr>
	           					<a href="" class="photo" ><s:text name="profile.uploadphoto_tip"/></a>
	           				</div>
					   </div>
					   <div style="word-wrap:break-word;width:350px;">
					      <s:form id="modifyuser" method="post" action="modifyUser.action" theme="simple">
				            <input type="hidden" name="submited" value="true">
				             <div style="margin-left: 6px;width: 368px;">
				                <table class="table-form" >
				                   <tr>
					                  <td class="field-name"><s:text name="profile.email"/></td>
					                  <td > <input  id="email" name="user.email" style="width: 250px;" placeholder="Your e-mail address" value="<s:property value="user.email"/>"/></td> 
				                  </tr>
				                  <tr class="subscription-row">
					                  <td >&nbsp;</td>
					                  <td align="left" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>user.email</s:param></s:fielderror></span></div> </td> 
				                  </tr>  
				                  <tr>
					                  <td class="field-name"><s:text name="profile.oldpwd"/></td>
					                  <td> <input  id="old_password" name="old_password" style="width: 250px;" maxlength="30" type="password" placeholder="Input your password" value="" required="required"/></td> 
				                  </tr>
				                   <tr class="subscription-row">
					                  <td >&nbsp;</td>
					                  <td align="left" ><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>old_password</s:param></s:fielderror></span></div> </td> 
				                  </tr>  
				                  <tr>
					                  <td class="field-name"><s:text name="profile.newpwd"/></td>
					                  <td> <input  id="password" name="password" style="width: 250px;" maxlength="30" type="password" placeholder="Make it blank if you don't want to change it" value=""/></td> 
				                  </tr>
				                  <tr class="subscription-row">
					                  <td >&nbsp;</td>
					                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>password</s:param></s:fielderror></span></div></td> 
				                  </tr>     
				                  <tr>
					                  <td class="field-name"><s:text name="profile.reppwd"/></td>
					                  <td> <input  id="password2"  name="repeat_password" style="width: 250px;" type="password" maxlength="30" placeholder="Enter password again"  value=""/></td> 
				                  </tr> 
				                   <tr class="subscription-row">
					                  <td >&nbsp;</td>
					                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>repeat_password</s:param></s:fielderror></span></div></td> 
				                  </tr>
				                  <tr>
					                  <td class="field-name"><s:text name="profile.nickname"/></td>
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
							                  <td class="field-name"><s:text name="profile.school"/></td>
							                  <td > <input  name="user.school" style="width: 250px;" value="<s:property value="user.school"/>" maxlength="30" placeholder="Less than 30 chars">
											  </td> 
					                	  </tr>
					               		  <tr>
							                  <td class="field-name"><s:text name="profile.motto"/></td>
							                  <td > <textarea  id="motto" name="user.motto" rows="5" style="width: 250px;" placeholder="Your motto(格言)" ><s:property value="user.motto"/></textarea></td> 
					                	  </tr>
					               		 <tr>
							                  <td class="field-name"><s:text name="profile.birthday"/></td>
							                  <td ><input style="width: 220px" class="birthday" name="birthday" readonly="readonly" value=<s:property value="birthday"/>> 
											  </td> 
					                	  </tr>
					             		 <tr>
							                  <td class="field-name"><s:text name="profile.open_source"/></td>
							                   <td >
							                   <select id="opensource"  style= "width:60px" name="user.opensource">
												<option value="N" <s:if test="user.opensource==\"N\"">selected="selected"</s:if>>No</option>
												<option value="Y" <s:if test="user.opensource==\"Y\"">selected="selected"</s:if>>Yes</option>
												</select>
							                   </td>
					                	 </tr>        	 
					                	 <tr>
					                	  	<td class="field-name"><s:text name="profile.default_language"/></td>
											<td><select id="select_lang"  style= "width:250px" name="user.language">
												<%
												try {
													List<LangBean> languages = OJUtil.getSupportLanguages();
													for (LangBean language : languages) {
														request.setAttribute("LanguageId",language.getId()); %>
														<s:property value="LanguageId"/><option value="<%=language.getId()%>" <s:if test="user.language==#request.LanguageId">selected="selected"</s:if>><%=language.getLangName() %></option>
													<%}
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
				                  <td colspan="2" align="right" >
									  <input class="modify-box-submit" id="save" type="Submit" value="<s:text name="profile.save"/>"/>
								  </td>
				               </tr>	
				      		</table>
				      		</div>
				      	  </s:form>
					    </div>				    
				    </div>
			     </div>
			  	    <h4><s:text name="third-part-account"/></h4>
			   		<h5><s:text name="third-part-account-list"/></h5>
				 <div class="roundbox">
				   <div >
					   <table class="problem rtable">
						   <tr class="header">
							   <th> <s:text name="third-part-account-no"/> </th>
							   <th> <s:text name="third-part-account-provider"/> </th>
							   <th> <s:text name="third-part-account-username"/> </th>
							   <th> <s:text name="third-part-account-date"/> </th>
							   <th> <s:text name="third-part-account-action"/> </th>
						   </tr>
							<%
				   				Integer gitee_bind = 0;
								Integer github_bind = 0;
				   			%>
							<s:iterator value="oauthList" status="st">
							<s:if test="provider==\"github\""><% github_bind = 1;%></s:if>
							<s:if test="provider==\"gitee\""><% gitee_bind = 1;%></s:if>
							<tr <s:if test="#st.odd">class="dark"</s:if>>
							    <td> <s:property value="#st.index+1"/> </td>
							    <td> <img class="third-party-avatar" src="img/<s:property value="provider"/>.jpeg" title="<s:property value="provider"/>" alt="<s:text name="third-part-account-bind"/> <s:property value="provider"/>"> <s:property value="provider"/> </td>
							    <td> <img class="third-party-avatar" src="<s:property value="avatar_url"/>" title="<s:property value="login"/>" alt="<s:property value="login"/>"> <s:property value="nickname"/></td>
								<td> <s:date name="create_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
								<td> <a href="unauth/<s:property value="provider"/>"><s:text name="third-part-account-unbind"/></a> </td>
						   </tr>
							</s:iterator>
					   </table>
				   </div>
				</div>
			   <% if (github_bind == 0 || gitee_bind == 0) { %>
			    <h5><s:text name="third-part-account-pend"/></h5>
			   <% }%>
			   <% if (github_bind == 0) { %>
				   <%String github_client_id = Config.getValue("GITHUB_CLIENT_ID");%>
				   <a href="https://github.com/login/oauth/authorize?client_id=<%=github_client_id%>">
					   <img class="third-party-logo" src="img/github.jpeg" title="<s:text name="third-part-account-bind"/> github" alt="<s:text name="third-part-account-bind"/> github">
				   </a>&nbsp;&nbsp;
			   <% }%>
			   <% if (gitee_bind == 0) { %>
			   <%
				   String gitee_client_id = Config.getValue("GITEE_CLIENT_ID");
				   String gitee_redirect_url = Config.getValue("GITEE_REDIRECT_URL");
			   %>
			   <a href="https://gitee.com/oauth/authorize?client_id=<%=gitee_client_id%>&redirect_uri=<%=gitee_redirect_url%>&response_type=code">
			   	   <img class="third-party-logo" src="img/gitee.jpeg" title="<s:text name="third-part-account-bind"/> gitee" alt="<s:text name="third-part-account-bind"/> gitee">
			   </a>
			   <% }%>
		   </div>
		<script type="text/javascript">
		document.getElementById('old_password').focus()
		</script> 	    
	  </div>
		<div class="clear"></div>
	  </div>
	  <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
	</div>
  							
<!-- Pop div -->
<div class="pop-div-photo"  id="pop-div-photo">
</div>
<div class="pop-inner-div-photo" id="pop-inner-div-photo">
  <div class="box">
     <div class="preview-wrap">
         <div class="title"><s:text name="profile.prereview"/></div>
         <div class="preview-img-wrap">
             <img id="imga-preview" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo.png" alt=""  />
         </div>
         <div>250 x 250</div>
         <div class="preview-img-wrap_80">
             <img id="imga-preview80" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo.png" alt=""  />
         </div>
         <div>80 x 80</div>
         <div class="preview-img-wrap_50">
             <img id="imga-preview50" src="<s:if test="user.avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo.png" alt=""  />
         </div>
         <div>50 x 50</div>
       </div>
       <div class="img-wrap">
           <img src="" alt="" id="img-photo" />
       </div>
   </div>
   <div class="btn-wrap">
       <input type="file" id="file" style="position:absolute;clip:rect(0,0,0,0)" />
       <label for="file" class="btn btn-primary" style="margin:0 20px 0 90px; color:black;"><s:text name="profile.choose"/></label>
       <button class="btn-avatar-upload"><s:text name="profile.upload"/></button>
  	</div>
</div>
<script type="text/javascript" src="js/avatar.js"></script>
<!--End Pop div -->		
  </body>
</html>
