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
    <title>Contest - <s:property value="username"/>(<s:property value="user.nickname"/>) - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>

  <body>    
  	<jsp:include page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
  		<div class="content">
		    <div class="sidebar"> 	
	       	  <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	    </div> <!-- End sidebar -->
	      	<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
	     		<div id="nav-content" >    	
			   	    <a href="profile/<s:property value="username"/>" ><s:property value="username"/></a>
					<s:if test="username==#session.session_username">      
			      	<a href="settings"><s:text name="settings"/></a>
			      	</s:if>	      	
			      	<a href="problemset/status/with/<s:property value="username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>  
			      	<a href="contests/<s:property value="username"/>" target="blank" class="current"><s:text name="mycontest"/></a>    
		      	</div>
		      	
				  <div class="roundbox">
					<div>
						<table class="contest rtable">
							 <tr class="header">	               	 
				               	 <th class="title left-item"><s:text name="contesttitle"/></th>
				                 <th class="type"><s:text name="rank"/></th>
				                 <th class="type">+/-</th>
				                 <th class="rating"><s:text name="new_rating"/></th>
				                 <th class="info"></th>
			                </tr>
			                <s:if test="ratingList.size==0">
			                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
			                </s:if>
							<s:iterator value="ratingList" status="st">								
			            	<tr <s:if test="#st.odd">class="dark"</s:if>>
			            		<td class="title left-item">
			            		<a href="contest/<s:property value="contest_id"/>/standings"><s:property value="contest_name"/></a>
			            		</td>
			            		<td><s:property value="rank"/></td>
			            		<td>
			            		<s:if test="delta==0">
								</s:if><s:elseif test="delta<0">
			            		<span style="color:red">- <s:property value="0-delta"/> </span>
			            		</s:elseif><s:else>
			            		<span style="color:green">+ <s:property value="delta"/> </span>
			            		</s:else>
			            		</td>
			            		<td><s:property value="rating"/></td>
			            		<td>
			            		<s:if test="#st.index < ratingList.size - 1 && ratingList[#st.index+1].rate==rate">
			            		<!-- <span class='rated-user user-rate-<s:property value="rate"/>'><s:property value="rating_title"/></span> -->
								</s:if> <s:else>
								<s:text name="became"/> <span class='rated-user user-rate-<s:property value="rate"/>'><s:property value="rating_title"/></span>
								</s:else>			            		
			            		</td>
			            		<s:set name="#prev_rate" value="rate"></s:set>
			            	</tr>	
			           		</s:iterator>   
						</table>
				    </div>	
				 </div> 		  
			</div>
			<div class="clear"></div>
	    </div>
		<jsp:include  page="/jsp/footer.jsp" ></jsp:include>
	</div>
  </body>
</html>
