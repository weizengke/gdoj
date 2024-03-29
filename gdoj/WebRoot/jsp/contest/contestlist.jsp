﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Contests - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	OnlineJudge.countdown();
});
</script> 
  </head>
  <body>  
  	<jsp:include page="/jsp/head.jsp"></jsp:include>
    <div class="container">
	  <div class="content">
		<div class="sidebar">  	
          <jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	</div>
     	<div class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
	     	<div id="nav-content" >
				<a href="contests" class="current"><s:text name="contests"/></a>
				<!-- <a href="contest/recent" ><s:text name="recent-contest"/></a> -->
	     	</div>
     		<!-- Pending  -->
	     	 <div class="roundbox">
		    	<div class="roundbox-title ">
					<s:text name="runningorpendingcontests"/>
				</div>
				<div class="" style="">
					<table class="contest rtable">
						 <tr class="header">	               	 
			               	 <th class="title left-item"><s:text name="contesttitle"/></th>
			                 <th class="start"><s:text name="starttime"/></th>
			                 <th class="during"><s:text name="during"/></th>
			                 <th class="info" ><s:text name="contest.status"/></th>
			                 <th class="reg"><s:text name="contest.registration"/></th>
		                </tr>
		                <s:if test="rpList.size==0">
		                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
		                </s:if>
						<s:iterator value="rpList" status="st">	
		            	<tr <s:if test="#st.odd">class="dark"</s:if>>
		            		
		            		<td class="title left-item">
		            		<s:if test="status==\"ENDED\""><s:property value="contest.title"/></s:if>
		            		<s:elseif test="status==\"RUNNING\"">		            	
			            		<s:if test="#session.session_username!=null">
			            				<s:if test="isRegister==\"Y\"">
			            					<s:property value="contest.title"/><br/>
			            					<span style="font-size:10px;"><a href="contest/<s:property value="contest.contest_id"/>"><s:text name="contest.enter"/> &raquo;</a></span>
			            				</s:if>
			            				<s:else>
			            					<s:property value="contest.title"/><br/>
			            					<span style="font-size:10px;color:grey">
			            					<s:if test="regStatus==\"ENDED\"">
			            					<s:text name="contest.tip_miss_the_contest_reg"/>
			            					</s:if>
			            					<s:else>
			            					<s:text name="contest.tip_must_register_first"/>
			            					</s:else>
			            					</span>
			            				</s:else>
			            		</s:if>
			            		<s:else>
			            			<s:property value="contest.title"/><br/>
			            			<span style="font-size:10px;color:grey"><s:text name="contest.tip_must_register_first"/></span>
			            		</s:else>	
		            		</s:elseif>
		            		<s:else><s:property value="contest.title"/></s:else>
		            		</td>
		            		<td class="start"><s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
		            		<td class="during"><s:property value="during"/></td>
		            		<td class="info" title="From <s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/> to <s:date  name="contest.end_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">
		            			<s:if test="status==\"PENDING\"">
		            				<s:text name="contest.status_before_start"/> &nbsp;<span style="color:grey" class="countdown"><span title="<s:property value="leftTime"/>"><s:property value="friendlyLeftTime"/></span></span>
								</s:if>
		            			<s:elseif test="status==\"RUNNING\"">
		            				<span style=""><b><a href="contest/<s:property value="contest.contest_id"/>/standings"><s:text name="contest.current_standing"/></a></b></span><br/>
		            				<s:text name="contest.util_close"/> &nbsp;<span style="color:grey" class="countdown"><span title="<s:property value="leftTime"/>"><s:property value="friendlyLeftTime"/></span></span>		
		            			</s:elseif>
		            			<s:else><span style="color:grey;"><b><s:text name="contest.status_end"/></b></span></s:else>
		            		</td>
		            		<td class="reg" title="From <s:date  name="contest.start_reg" nice="false" format="yyyy-MM-dd HH:mm:ss"/> to <s:date  name="contest.end_reg" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">      	
		            		  	<span class="link-to-contest" style="">
			            			<s:if test="regStatus==\"PENDING\"">
			            			<s:text name="contest.reg_before_start"/> &nbsp;<span style="font-size:10px;color:grey" class="countdown"><span title="<s:property value="regleftTime"/>"><s:property value="friendlyRegleftTime"/></span></span></s:if>
			            			<s:elseif test="regStatus==\"RUNNING\"">            			
			            				<s:if test="#session.session_username!=null">
				            				<s:if test="isRegister==\"Y\""><b><font style="color: red"><s:text name="contest.reg_success"/></font></b></s:if>
				            				<s:else><b><a href="javascript:void(0)" class="reg <s:property value="contest.contest_id"/>" ><s:text name="contest.reg_contest"/>&raquo;</a></b></s:else>
			            				</s:if>
			            				<s:else>
			            					<b><a href="javascript:void(0)" class="reg"> <s:text name="contest.reg_contest"/>&raquo;</a></b>
			            				</s:else>
			            					<a href="contestRegistrants/<s:property value="contest.contest_id"/>" title="The num of registrants"><s:property value="registrants"/></a>
			            				<br/>
			            				<s:text name="contest.util_close"/> &nbsp;<span style="color:grey;" class="countdown"><span title="<s:property value="regleftTime"/>"><s:property value="friendlyRegleftTime"/></span></span>
		            				</s:elseif>
		            				<s:else>
		            					<a href="contestRegistrants/<s:property value="contest.contest_id"/>" title="The num of registrants"><s:property value="registrants"/></a>
			            				<br/>
			            				<font style="color:grey"><s:text name="contest.reg_end"/></font>
			            			</s:else>
		            			</span>
		            		</td>
		            	</tr>	
		           		</s:iterator>   
					</table>
			    </div>	
			 </div>  	
<s:if test="#session.session_username!=null">
<script type="text/javascript">
$(document).ready(function() {
	$(".link-to-contest a.reg").click(function() {
		if(confirm('Register to take part in this conetst?')){
			var classed = $(this).attr("class").split(" ");	
	 		var contestId = classed[1];	
	 		 $.post(
                "registerContest.action",
                {contestId: contestId},
                function(data) {    
                   if (data.success != true) {
                    alert(data["error"]);
                    return false;
                  }	          
                  alert("Register Success! Click contest title into contest after contest running");
                  window.location.reload();        
                },
                "json"
            );		
		}
		return false;
	}); 
});
</script> 
</s:if>
<s:else>
<script type="text/javascript">	
$(document).ready(function() {
	$(".link-to-contest a.reg").click(function() {
		alert("You must login first.");
		return false;
	}); 
});
</script>
</s:else>
		  <br/>
			<!-- other-oj  -->
			<div class="roundbox">
				<div class="roundbox-title ">
					<s:text name="recent-contest" />
				</div>
				<div class="">
					<table class="contest rtable" id="contest_body">
						<tr class='header'><th class='oj left-item'>OJ</th><th class='name '><s:text name="contesttitle"/></th>
							<th class='start'><s:text name="starttime"/></th>
							<th class='week'>Week</th>
							<th class='access'>Access</th></tr>
						<tr><td class='left-item dark' colspan='15' style='text-align: left;'>Loading...</td></tr>
					</table>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						var contest_html = "<tr class='header'><th class='oj left-item'>OJ</th><th class='name '><s:text name="contesttitle"/></th>"+
								"<th class='start'><s:text name="starttime"/></th>"+
								"<th class='week'>Week</th>"+
								"<th class='access'>Access</th></tr>";
						$.getJSON('otheroj.json',function(data){
							if(data.size == 0){
								contest_html = "<tr><td class='left-item dark' colspan='15' style='text-align: left;'>There is no records.</td></tr>";
							}else{
								$.each(data, function(i,item){
									//alert(item.oj+item.link);
									contest_html +="<tr ";
									if(i%2==0){
										contest_html += "class='dark'";
									}
									contest_html +=">";
									contest_html +="<td class='oj left-item'>"+ item.oj +"</td>";
									contest_html +="<td class='name'><a href='"+ item.link +"' target='_blank'>"+ item.name +"</a></td>";
									contest_html +="<td class='start'>"+ item.start_time +"</td>";
									contest_html +="<td class='week'>"+ item.week +"</td>";
									contest_html +="<td class='access'>"+ item.access +"</td>";
									contest_html +="</tr>";
								});
							}
							$('#contest_body').html(contest_html);
						});
					});
				</script>
			</div>
			<br/>

		 <!-- Ended  -->
		    <div class="roundbox">
		    	<div class="roundbox-title ">
					<s:text name="endedcontests"/>
				</div>
				<div class="" style="position: relative;">
					<table class="contest rtable">
						 <tr class="header">           	 
			               	 <th class="title left-item"><s:text name="contesttitle"/></th>
			                 <th class="start"><s:text name="starttime"/></th>
			                  <th class="during"><s:text name="during"/></th>
			                 <th class="standings"><s:text name="standings"/></th>
			                 <th class="registrants" title="The num of registrants">=</th>
		                </tr>
		                <s:if test="endedList.size==0">
		                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
		                </s:if>
						<s:iterator value="endedList" status="st">	
		            	<tr <s:if test="#st.odd">class="dark"</s:if>>      		
		            		<td class="title left-item">
		            			<a href="contest/<s:property value="contest.contest_id"/>"><s:property value="contest.title"/></a>
		            		</td>
		            		<td class="start"><s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
		            		<td class="during"><s:property value="during"/></td>
		            		<td class="standings"><a href="contest/<s:property value="contest.contest_id"/>/standings"><s:text name="contest.final_standing"/></a> </td>
		            		<td class="registrants"><a href="contestRegistrants/<s:property value="contest.contest_id"/>"><s:property value="registrants"/></a></td>
		            	</tr>	
		           		</s:iterator>   
					</table>
			    </div>
				<div style="margin:6px 12px;font-size:15px;">
					<div class=left>
					</div>
					<div class="right">
						<s:if test="page>1">
							<a href="contests/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
						</s:if>
						<s:iterator value="pageList" status="st_page">
							<s:if test="pageList[#st_page.index]==0">...</s:if>
							<s:else><a href="contests/page/<s:property/>" style="color:#000;text-decoration: none;">
								<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
								<s:else><s:property/></s:else>
							</a></s:else>
						</s:iterator>
						<s:if test="page < pageCount">
							<a href="contests/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>
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
