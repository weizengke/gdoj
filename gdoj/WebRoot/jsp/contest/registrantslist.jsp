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
    <title>Contest - Registrants <s:property value="contest.title"/> - Online Judge</title>
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
     <div class="content" > 	 <!-- class="content-with-sidebar" -->
     	 <div style="width: 100%;position: relative;text-align: center;">
	        <h4><s:property value="contest.title"/></h4>
			<s:text name="registrants"/>
	    </div>  
	    <div class="roundbox" style="">
			<div>
				<table class="standings rtable">
					 <tr class="header">
		               	 <th  class="id left-item">#</th>
		               	 <th  class="coder"><s:text name="author"/></th>
		                 <th  class="solved2" ><s:text name="rating"/></th>
	                </tr>
	                <s:if test="ratingList.size==0">
	                 <tr ><td class="left-item dark" colspan="32" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
				    <s:iterator value="ratingList" status="st">
				    	<tr style="height: 42px;" class="<s:if test="#st.odd">dark</s:if> <s:if test="#session.session_username==username">my</s:if>">	
							<td class="id left-item"><s:property value="pageSize*(page-1)+#st.index+1"/></td>
							<td class="coder">
								<div style="float:left;">
								<b>
									<a href="profile/<s:property value="username"/>" class="rated-user user-rate-<s:property value="rate"/> user-tip" user="<s:property value="username"/>">
										<s:property value="username"/>
									</a>
								</b>
								<s:if test="#session.session_username==username">
									&nbsp;<a href="contest/<s:property value="contestId"/>/UnRegisterContest" title ="UnRegister this contest?">
									<img src="img/delete.gif"></img>
									</a>
								</s:if>
								</div>
								<div style="float:right;font-size:12px;text-align:right;color: grey;">
									<span title="<s:property value="school" default=""/>"><s:property value="nickname" default=""/></span>
								</div>
							</td>
							<td class="solved2">
							<s:property value="rating-delta"/>
							<s:if test="delta==0">
							</s:if><s:elseif test="delta<0">
		            		<span style="color:red">- <s:property value="0-delta"/> </span>
		            		</s:elseif><s:else>
		            		<span style="color:green">+ <s:property value="delta"/> </span>
		            		</s:else>
		            		</td>
						</tr>	
				   </s:iterator>
				</table>
		    </div>
			<div style="margin:6px 12px;font-size:15px;">
				<div class="left"></div>
				<div class="right">
					<s:if test="page>1">
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>
					<s:iterator value="pageList" status="st_page">
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>
					</s:iterator>
					<s:if test="page < pageList.size">
						<a href="contestRegistrants/<s:property value="contestId"/>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>
					</s:if>
				</div>
			</div>
		</div>
		 <div class="clear"></div>
	</div>
	  <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
