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
  	<jsp:include   page="/jsp/head.jsp"></jsp:include>
  	<div id="body">
		 

		<div id="sidebar"> 	
            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.infobox"/></div>
	            </div>  
	            <div class="" style="margin: 6px;">
	            	<b>How to participate in contest：</b>  <br/>
	            	<span style="font-size:10px;">
	            	1:Login Online Judge.<br/>
	            	2:Click <b><span style="font-size:10px;color:blue">Register contest.</span></b><br/>
	            	3:You will see <b><span style="font-size:10px;color:red">Register success</span></b><br/>
	            	4:After Running, click contest title.<br/>

	            	Any question,ask at <a href="topic">Topic</a>  
	            	</span>			
	            </div>

	        </div>     

	 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 </div> 
	
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     	<a href="contests" class="current"><s:text name="contests"/></a>
     	<a href="contest/recent" ><s:text name="recent-contest"/></a>
     	</div>	 
     	<!-- Pending  -->
     	 <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="runningorpendingcontests"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="contest">
					 <tr class="header">	               	 
		               	 <th class="title left-item"><s:text name="contesttitle"/></th>
		                 <th class="start"><s:text name="starttime"/></th>
		                 <th class="during"><s:text name="during"/></th>
		                 <th class="info"><s:text name="contest.status"/></th>
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
		            					<span style="font-size:10px;"><a href="contest/<s:property value="contest.contest_id"/>">Enter &raquo;</a></span>
		            				</s:if>
		            				<s:else>
		            					<s:property value="contest.title"/><br/>
		            					<span style="font-size:10px;color:grey">You must register contest first.</span>
		            				</s:else>
		            		</s:if>
		            		<s:else>
		            			<s:property value="contest.title"/><br/>
		            			<span style="font-size:10px;color:grey">You must register contest first.</span>
		            		</s:else>	
	            		</s:elseif>
	            		<s:else><s:property value="contest.title"/></s:else>
	            		</td>
	            		<td class="start"><s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            		<td class="during"><s:property value="during"/></td>
	            		<td class="info" title="From <s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/> to <s:date  name="contest.end_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">
	            			
	            			<s:if test="status==\"PENDING\"">
	            				<!--<span style="color:green;"><b>Pending</b></span><br/>-->
								Before start &nbsp;<span style="color:grey" class="countdown"><span title="<s:property value="leftTime"/>"><s:property value="leftTime"/></span></span>
							</s:if>
	            			<s:elseif test="status==\"RUNNING\"">
	            				<span style="color:red;"><b>Running</b></span><br/>
	            				<span style=""><a href="contest/<s:property value="contest.contest_id"/>/standings">Current standings</a></span><br/>
	            				<span style="color:grey" class="countdown"><span title="<s:property value="leftTime"/>"><s:property value="leftTime"/></span></span>		
	            			</s:elseif>
	            			<s:else><span style="color:grey;"><b>Ended</b></span></s:else>
	            		</td>
	            		<td class="reg" title="From <s:date  name="contest.start_reg" nice="false" format="yyyy-MM-dd HH:mm:ss"/> to <s:date  name="contest.end_reg" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">      	
	            		  	<span class="link-to-contest" style="">
		            			<s:if test="regStatus==\"PENDING\"">
		            			Before registration &nbsp;<span style="font-size:10px;color:grey" class="countdown"><span title="<s:property value="regleftTime"/>"><s:property value="regleftTime"/></span></span></s:if>
		            			<s:elseif test="regStatus==\"RUNNING\"">            			
		            				<s:if test="#session.session_username!=null">
			            				<s:if test="isRegister==\"Y\""><b><font style="color: red">Register success</font></b></s:if>
			            				<s:else><b><a href="javascript:void(0)" class="reg <s:property value="contest.contest_id"/>" >Register contest&raquo;</a></b></s:else>
		            				</s:if>
		            				<s:else>
		            					<b><a href="javascript:void(0)" class="reg"> Register contest&raquo;</a></b>
		            				</s:else>
		            					<a href="contestRegistrants/<s:property value="contest.contest_id"/>" title="The num of registrants"><s:property value="registrants"/></a>
		            				<br/>
		            				Registration running &nbsp;<span style="color:grey;" class="countdown"><span title="<s:property value="regleftTime"/>"><s:property value="regleftTime"/></span></span>
	            				</s:elseif>
	            				<s:else>
	            					<a href="contestRegistrants/<s:property value="contest.contest_id"/>" title="The num of registrants"><s:property value="registrants"/></a>
		            				<br/>
		            				<font style="color:grey">Registration ended</font>
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
	 		//setUrlSession();
			//window.location = "enter";
			alert("You must login first.");
			 return false;
	}); 
});
</script>
</s:else>		 
		 
		 
		  <br/>
		 <!-- Ended  -->
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="endedcontests"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="contest">
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
	            		<td class="standings"><a href="contest/<s:property value="contest.contest_id"/>/standings">Final standings</a> </td>
	            		<td class="registrants"><a href="contestRegistrants/<s:property value="contest.contest_id"/>"><s:property value="registrants"/></a></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	
		 </div>  	
		  <div style="margin:0 12px;font-size:15px;">	
				<div class=left>
	<!-- 								     	<a href="javascript:;" class="test" rel="solo">Test</a>
<script>
$(function() {
	 $(".test").mouseover(function() {
	 	var left = $(".test").offset().left+$(".test").width();
		var top = $(".test").offset().top+$(".test").height();//元素相对于窗口的上边的偏移量
		var pleft = $(".test").scrollLeft();//元素相对于滚动条左边的偏移量
		var ptop = $(".test").scrollTop();//元素相对于滚动条顶部的偏移量
		
		// alert(left+" "+top+" "+pleft+" "+ptop+" "+$(".test").width()+" "+$(".test").height());
		var htm= "<div><p><br /><strong>Sorry! This page doesn't support Internet Explorer 6.</strong><br /><br />If you'd like to read our content please <a href='http://getfirefox.org'>upgrade your browser</a>.</p>"
				+"<p><br /><strong>You can use chrome , firefox or IE7! Thanks for your understanding!</strong></p>";
		 $(htm)
			.css({
				backgroundColor: '#f8f8f8',
				'top': top,
				'left': left,
				
				width: 410,
				paddingRight: 10,
				height: 200,
				'position': 'absolute',
				zIndex: 6000
			})
			.appendTo("body");
	 })    	
});
</script>
	 -->		
	 
	 
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
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?uid=1339907478548202&type=left&amp;move=0" charset="utf-8"></script>
<!-- JiaThis Button END -->
  </body>
</html>
