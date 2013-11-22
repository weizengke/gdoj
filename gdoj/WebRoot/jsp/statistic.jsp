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
    <title>Statistic <s:property value="problemId"/>.<s:property value="problemTitle"/> - GUET Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
	 <div id="sidebar"> 	
         <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.statistic"/></div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px;">
        			Solved user(s):<a href="problemset/status/problem/<s:property value="problemId" default="0"/>/page/1"><s:property value="solved" default="0"/></a> &nbsp;&nbsp;<br/>
        			Submit user(s):<a href="problemset/status/problem/<s:property value="problemId" default="0"/>/page/1"><s:property value="submitUser" default="0"/></a><br/>
        			Submission(s) :<a href="problemset/status/problem/<s:property value="problemId" default="0"/>/page/1"><s:property value="submit" default="0"/></a><br/>
	            </div>
	        </div>    
            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.toolsbox"/></div>
	            </div>  
	            <div class="tools-box" style="margin: 6px;color: #000;">
        			<a style="font-size: 12px;color: #000;font-weight: bold;" href="problemset/problem/<s:property value="problemId"/>">Back</a>
	            </div>
	        </div>    
	       
   	 </div> 
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     <a href="problemset" class="current"><s:text name="problems"/></a>
     	<a href="problemset/status"><s:text name="status"/></a>
    	 <a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="content" style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">
	    <center><h5><a href="problemset/problem/<s:property value="problemId"/>" style="color:#000;text-decoration: none;">
	    <s:property value="problemId"/>.<s:property value="problemTitle"/></a>
	    </h5></center>    	
		<script type="text/javascript">
var chart;
$(document).ready(function() {
	chart = new Highcharts.Chart({
		chart: {
			renderTo: 'container',
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false
		},
		title: {
			text: ''
		},
		tooltip: {
			formatter: function() {
				var s;
				s = '<b>'+ this.point.name +'</b>: '+this.y+"("+ Highcharts.numberFormat(this.percentage, 2) +' %)';
				return s;
			}
		},
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
					enabled: true,
					color: '#000000',
					connectorColor: '#000000',
					formatter: function() {
						return '<b>'+ this.point.name +'</b>: '+this.y;
					}
				},
				showInLegend: true
			}
		},
		series: [{
			type: 'pie',
			name: 'Browser share',
			data: [
				['CE',<s:property value="countList[2]"/>],
				['WA',<s:property value="countList[1]"/>],
				{
					name: 'AC',
					y: <s:property value="countList[0]"/>,
					sliced: true,
					selected: true
				},
				['PE',<s:property value="countList[7]"/>],
				['RE',<s:property value="countList[3]"/>],
				['TLE',<s:property value="countList[4]"/>],
				['MLE',<s:property value="countList[5]"/>],
				['OLE',<s:property value="countList[6]"/>]
			]
		}]
	});
});

		</script>
<script type="text/javascript" src="js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="js/highcharts/modules/exporting.js"></script>
       		<div id="container" style="width: 720px; height: 400px; margin: 0 auto"></div>
	   </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
