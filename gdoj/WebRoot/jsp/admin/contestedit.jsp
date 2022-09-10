<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
   <s:head theme="xhtml"/>
    <base href="<%=basePath%>">
    <title>Online Judge System</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript" src="js/datepick.js"></script>
  </head>
  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
        <div class="content">       
	     	<div class="sidebar">      
		 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
		   	</div> 	
     		<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    <div class="content round_0123">	    	
			<s:form id="contestUpdate" method="post" action="contestUpdate.action"  theme="simple">
			    	<input type="hidden" id="id" name="contest.contest_id" style="width: 100%;"  value="<s:property value="contest.contest_id"/>"/>
					<div style="padding:6px;">
					<div style="text-align:center;" ><span class="fielderror"><s:property value="tip"/></span></div>
					<h5>
					Title:
					</h5>
					<input  id="title" name="contest.title" style="width: 100%;"  value="<s:property value="contest.title"/>"/>
					<span class="fielderror"><s:fielderror ><s:param>title</s:param></s:fielderror></span>
					<h5>
						Description:
					</h5>
					<textarea class="ke-editor" id="ke-editor" name="contest.description" rows="10" style="width: 100%" ><s:property value="contest.description"/></textarea>
					<br/>
					Contest Start Time:<input style="width: 100px" class="start-date" name="start_date" readonly="readonly" value=<s:property value="start_date"/>>
					<input style="width: 24px" class="shour" name="shour"  value=<s:property value="shour"/>>HH
					<input style="width: 24px" class="sminute" name="sminute"  value=<s:property value="sminute"/>>MM
					<span class="fielderror"><s:fielderror ><s:param>start_date</s:param></s:fielderror></span>
					<br/>
					Contest End Time&nbsp;&nbsp;:<input style="width: 100px" class="end-date" name="end_date" readonly="readonly" value=<s:property value="end_date"/>>
					<input style="width: 24px" class="ehour" name="ehour"  value=<s:property value="ehour"/>>HH
					<input style="width: 24px" class="eminute" name="eminute"  value=<s:property value="eminute"/>>MM
					<span class="fielderror"><s:fielderror ><s:param>end_date</s:param></s:fielderror></span>
					<br/>
					Start Register Time:<input style="width: 100px" class="start-reg-date" name="start_reg_date" readonly="readonly" value=<s:property value="start_reg_date"/>>
					<input style="width: 24px" class="shour_reg" name="shour_reg"  value=<s:property value="shour_reg"/>>HH
					<input style="width: 24px" class="sminute_reg" name="sminute_reg"  value=<s:property value="sminute_reg"/>>MM<span class="fielderror"><s:fielderror ><s:param>start_reg_date</s:param></s:fielderror></span>
					<br/>
					End Register Time&nbsp;&nbsp;:<input style="width: 100px" class="end-reg-date" name="end_reg_date" readonly="readonly" value=<s:property value="end_reg_date"/>>
					<input style="width: 24px" class="ehour_reg" name="ehour_reg"  value=<s:property value="ehour_reg"/>>HH
					<input style="width: 24px" class="eminute_reg" name="eminute_reg"  value=<s:property value="eminute_reg"/>>MM<span class="fielderror"><s:fielderror ><s:param>end_reg_date</s:param></s:fielderror></span>
					<h5>
					Contest Type: 	
					<select id="type"  style= "width:150px" name="contest.type">
						<option value="0" <s:if test="contest.type==0">selected="selected"</s:if>>ACM/ICPC</option>
						<option value="1" <s:if test="contest.type==1">selected="selected"</s:if>>Google Code Jam</option>
					</select>
					</h5>
					<h5>
					Password:
					</h5>
					<input  id="password" name="contest.password" style="width: 200px;"  value="<s:property value="contest.password"/>"/>
	
					</div>
			    	<div style="text-align: center;margin: 12px;">	
			    		<input id="add" type="Submit" value="Save Contest"/>
			    	</div>	
			    </s:form>

<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>
<script type="text/javascript">
$(document).ready(function() {
	$('input.start-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:2",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.end-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:2",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.start-reg-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:2",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.end-reg-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:2",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
});
</script>					
			<div style="margin-right: 12px;text-decoration: none;">
					<div class="left"></div>
					<div class="right">
					</div>
		  </div>       	  	 
	   </div>    
	</div>
			<div class="clear"></div>
    	</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
