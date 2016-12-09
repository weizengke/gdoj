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
    <title>Latest Contests - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>

<script type="text/javascript">
$(document).ready(function() {

// OnlineJudge.countdown();

});
</script> 
  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include>
  	<div id="body">
		 
		<div id="sidebar"> 	
	 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	 	</div> 
	
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     	<a href="contests"><s:text name="contests"/></a>
     	<a href="contest/recent" class="current"><s:text name="recent-contest"/></a>
     	</div>	 
		<!-- Ended  -->
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left">Data collected from <a href="http://acmicpc.info/archives/224" style="color:#FF8C00;text-decoration: none;">acmicpc.info</a></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="contest" id="contest_body">
<tr class='header'><th class='oj left-item'>OJ</th><th class='name '>Title</th>
		                 <th class='start'>Start</th>
 						 <th class='week'>Week</th>
		                 <th class='access'>Access</th></tr>
<tr><td class='left-item dark' colspan='15' style='text-align: left;'>Loading...</td></tr>
				</table>	
		    </div>	
		 </div> 
		 <div>
		  
		 </div> 			
	</div>  
	
<script type="text/javascript">
$(document).ready(function() {	 	   
			var contest_html = "<tr class='header'><th class='oj left-item'>OJ</th><th class='name '>Title</th>"+
		                 "<th class='start'>Start</th>"+
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
	
	 
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
