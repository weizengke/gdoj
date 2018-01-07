<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList,
com.util.Config,
com.gdoj.problem.vo.Problem,
com.gdoj.bean.OJUtil" 
pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Submit Solution - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>  	
  </head>
  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
 	  <div id="sidebar"> 	          
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
        
   	  </div> <!-- End sidebar -->

     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
		<a href="problemset"><s:text name="problems"/></a>
     	<a href="problemset/status"><s:text name="status"/></a>
    	 <a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="content" style="">	    	
			<s:form id="submit" method="post" action="submited.action" theme="simple">
				<div class="info" style="width:560px;margin: 0px auto;padding:12px 12px 12px 12px;">
					<input type="hidden" name="problemId" style="width: 100px;" value="<s:property value="problemId"/>">
					Problem:&nbsp;<s:property value="problem.problem_id"/> - <s:property value="problem.title"/>
					<br/>
					Language:&nbsp;
					<select id="select_lang"  style= "width:250px" name="language">

				<%
		   try {
		   		Integer problemId = Integer.valueOf(request.getParameter("problemId"));
		   		Problem problem = OJUtil.queryProblem(problemId);
		   		String szOjName = "GUET";
		   		if (null != problem)
		   		{
		   			szOjName = problem.getOj_name();
		   		}
				
		   		String szLangPath = Config.getValue("OJ_LANG_PATH");
		   		if (1 == problem.getIsvirtual() && szOjName.equals("HDU"))
		   		{
		   			szLangPath = Config.getValue("OJ_LANG_PATH_HDU");
		   		}
		   		System.out.println("szOjName:" + szOjName + " szLangPath:" + szLangPath);
		   		
		   		File f = new File(szLangPath);
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
   		 		%>		   		 			
					<s:property value="LanguageId"/><option value="<%=LanguageId%>" <s:if test="language==#request.LanguageId">selected="selected"</s:if>><%=Language %></option>
				<%
				}
			} catch (Exception e) {
			%>
												<option value="1" <s:if test="language==1">selected="selected"</s:if>>MS C++</option>
												<option value="2" <s:if test="language==2">selected="selected"</s:if>>MS C</option>
												<option value="3" <s:if test="language==3">selected="selected"</s:if>>GNU C++</option>
												<option value="4" <s:if test="language==4">selected="selected"</s:if>>GNU C</option>
												<option value="5" <s:if test="language==5">selected="selected"</s:if>>Java</option>
												<option value="8" <s:if test="language==8">selected="selected"</s:if>>Pascal</option>
			<% } %>		
					</select>
					</br>
					Source code:				
					
					<textarea id="source" name="source" rows="25" style="width: 100%" ><s:property value="source"/></textarea>	
					<span style="color:red"><s:fielderror></s:fielderror></span>
				</div>
				<div style="text-align: center;margin: 12px;">	
		    		<input id="submitsolution" type="submit" value="Submit"/>
		    	</div>
			</s:form>
		<script language="javascript" type="text/javascript" src="js/editarea/edit_area/edit_area_full.js"></script>
		<script language="javascript" type="text/javascript">
		editAreaLoader.init({
			id : "source"		// textarea id
			,start_highlight: true
			,allow_toggle: true
			,language: "en"
			,syntax: "cpp"	
			,toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
			,syntax_selection_allow: "c,cpp,pas,java,python,ruby"
			,show_line_colors: true
			,replace_tab_by_spaces: 4
		});
		</script>
		<script>				
		$('#submit').submit(function(){
		    $('input[type=submit]', this).attr('disabled', 'disabled');
		});
		</script>		     	  	  	    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
