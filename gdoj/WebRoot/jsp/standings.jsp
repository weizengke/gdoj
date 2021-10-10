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
    <title>Standings - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  <!--  <script type="text/javascript" src="js/json.js"></script> -->	
  	<script type="text/javascript">
      $(document).ready(function() {
 
});
</script>  

  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
      <div class="content">    
     	<div class="sidebar"> 	          
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	</div>
   	 	<div class="content-with-sidebar"> 	
	     	<div id="nav-content" >
	     	 <a href="problemset"><s:text name="problems"/></a>
	     	<a href="problemset/status"><s:text name="status"/></a>
	    	 <a href="problemset/standings" class="current"><s:text name="standings"/></a>
	     	</div>
		    <div class="roundbox">
				<div class=" ">
					<table class="standings rtable">
						 <tr class="header" style="">  
			               	 <th  class="rank left-item">#</th>
			               	 <th  class="coder"><s:text name="author"/></th>
			               	 <th  class="motto"><s:text name="motto"/></th> 
			                 <th  class="solved" > <s:text name="solved"/></th>
			                 <th  class="rating"><s:text name="rating"/></th>
		                </tr>
		                <s:if test="usersList.size==0">
		                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
		                </s:if>
						<s:iterator value="usersList" status="st">	
		            	<tr class="<s:if test="#st.odd">dark</s:if>">
		            		<td class="rank left-item <s:if test="#session.session_username==username">my</s:if>"><s:property value="(page-1)*pageSize+#st.index+1"/></td>
		            		<td class="coder <s:if test="#session.session_username==username">my</s:if>">
		            			<b><a href="profile/<s:property value="username"/>" class="user-rate-<s:property value="rate"/> user-tip" user="<s:property value="username"/>"><s:property value="username"/></a></b>
		            		</td>
		            		<td class="motto"><s:property value="motto"/></td>
		            		<td class="solved2">
		            		<a href="problemset/status/with/<s:property value="username"/>/page/1" >
		            		<s:property value="solved"/>
		            		</a>
		            		</td>
		            		<td class="rating"><s:property value="rating"/></td>
		            	</tr>	
		           		</s:iterator>   
					</table>
			    </div>
				<div style="margin: 6px 12px;font-size:15px;">
					<div class="left"></div>
					<div class="right">
						<s:if test="page>1">
							<a href="problemset/standings/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
						</s:if>
						<s:iterator value="pageList" status="st_page">
							<s:if test="pageList[#st_page.index]==0">...</s:if>
							<s:else><a href="problemset/standings/page/<s:property/>" style="color:#000;text-decoration: none;">
								<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
								<s:else><s:property/></s:else>
							</a></s:else>
						</s:iterator>
						<s:if test="page < pageCount">
							<a href="problemset/standings/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>
						</s:if>
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
