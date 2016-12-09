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
    <title>Problem Set - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>

  	<script type="text/javascript">
      $(document).ready(function() {	
});
</script>  

  </head>

  <body>  
  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div id="body">
		<div id="sidebar"> 	          
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	</div> <!-- End sidebar -->
	
      <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >    	
	     	<a href="problemset" class="current"><s:text name="problems"/></a>
	     	<a href="problemset/status"><s:text name="status"/></a>
    	 	<a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="problems"/></div>
				<div class="right"></div>
			</div> 	
			<br/>	
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="problem">
					 <tr class="header">
					   <th class="id left-item"><s:text name="problemid"/></th>
					   <th class="title"><s:text name="problem"/></th>
					   <th class="solved">
					   <s:if test="order=='BY_SOLVED_ASC'"><a href="problemset?ORDER=BY_SOLVED_DESC" style="color: #000;text-decoration: none;">					
					   	 <s:text name="solved"/><img alt="Sort desc." title="Sort desc." src="img/order/tablesorter-desc.gif" style="vertical-align: middle;">   
					   </a></s:if>
					   <s:elseif test="order=='BY_SOLVED_DESC'"><a href="problemset?ORDER=BY_SOLVED_ASC" style="color: #000;text-decoration: none;">
					  	 <s:text name="solved"/><img alt="Sort asc." title="Sort asc." src="img/order/tablesorter-asc.gif" style="vertical-align: middle;">   
					   </a></s:elseif>
					   <s:else><a href="problemset?ORDER=BY_SOLVED_DESC" style="color: #000;text-decoration: none;">
						  <s:text name="solved"/><img alt="Sort desc." title="Sort desc." src="img/order/tablesorter-bg.gif" style="vertical-align: middle;"> 
					   </a>
					   </s:else>
					   </th>
					   <th class="ratio"></th>
	                </tr>
	                <s:if test="problemList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="problemList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="id left-item "><a href="problemset/problem/<s:property value="problem_id"/>" ><s:property value="problem_id"/></a></td>
	            		<td class="title">
	            			<div class="problem-link" style="float:left;vertical-align: middle;">
	            			<a href="problemset/problem/<s:property value="problem_id"/>" ><s:property value="title"/></a>
	            			</div>
	            			 <div class="tags" style="float:right;text-align:right;padding: 0px;">
	            				<s:iterator  value="tagsList.get(problem_id)" status="tagsst" var="tagname">
	            					<a href="search?word=<s:property />&type=problem" rel="tag" ><s:property /></a>
	            				</s:iterator>
	            			</div>
	            		</td>
	            		<td class="solved">
	            		<a href="problemset/status/problem/<s:property value="problem_id"/>/page/1" title="users solved this problem">
	            		<s:property value="solved" default="0"/></a>&nbsp;<span style="font-size:11px;color:grey;font-family:verdana,Serif,Arial;" title="submissions"><sub>/&nbsp;<s:property value="submit" default="0"/></sub></span>
	            		</td>
	            		<td class="ratio <s:if test="problemStatusList[#st.index]==1">problem-ac</s:if><s:elseif test="problemStatusList[#st.index]==2">problem-failed</s:elseif>" >
	            			<a title="submit your code?" href="problemset/submit/<s:property value="problem_id"/>" style=""><s:text name="submit"/></a>
	            			</td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    
	    <div style="margin:0 12px;font-size:15px;">	
			<div class=left></div>
			<div class="right">
					<s:if test="page>1">
						<a href="problemset/page/<s:property value="page-1"/>?ORDER=<s:property value="order"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="problemset/page/<s:property/>?ORDER=<s:property value="order"/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>	
					<s:if test="page < pageCount">		
						<a href="problemset/page/<s:property value="page+1"/>?ORDER=<s:property value="order"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
		   </div>
		</div>  	    	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
