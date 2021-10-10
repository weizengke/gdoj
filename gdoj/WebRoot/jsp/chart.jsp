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
    <title>Statistic Chart - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript" src="js/highcharts/highcharts.js"></script>
	<script type="text/javascript" src="js/highcharts/modules/exporting.js"></script>
  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
        <div class="content"> 
	    <div style="border-left:4px solid #B9B9B9;padding:3px 3px 3px 0px;">   	
	  		<div style="width: 980px;  margin: 0 auto">
		 		<center>
		 		Type&nbsp;<select id=type name="type" style="width:68px;" onchange="changeType()">						
						<option value="monthly">Monthly</option>
						<option value="dayly" >Dayly</option>
				</select>
				Size&nbsp;<select id=size name="size" style="width:68px;" onchange="changeType()">						
					<%for (int i = 1;i < 1000; i++){%>
						<option value="<%=i%>" <%if (i == 15) {%> selected <%} %>><%=i%></option>
					<%}%>
				</select>
				</center>
				<br/>
			</div>	
				
       		<div id="container" style="width: 980px; height: 480px; margin: 0 auto"></div>
	       		
	   </div>        		
<script type="text/javascript">
var chart;
var options = {
	chart: {
		renderTo: 'container',
		defaultSeriesType: 'spline',
		backgroundColor: null
	},
	title: {
		text: 'Online Judge Statistic'
	},
	loading: {
		hideDuration: 500,
		labelStyle: {
			fontWeight: 'bold',
			position: 'relative',
			top: '1em'
		},
		showDuration: 500,
		style: {
			position: 'absolute',
			backgroundColor: null,
			opacity: 0.5,
			textAlign: 'center'
		}
	},
	xAxis: {
		type: 'datetime',
		dataTimeLabelFormats: {
			month: '%e. %b',
			year: '%b'
		}
	},
	yAxis: {
		title: {
			text: 'Submossions'
		},
		min: 0,
		minorGridLineWidth: 50,
		gridLineWidth: 1,
		alternateGridColor: null
	},
	plotOptions: {
		spline: {
			dataLabels: {
                       enabled: false
               },
			marker: {
				radius: 2,
				lineColor: '#666666',
				lineWidth: 0.5
			}
		}
	},
	credits: {
		enabled: false
	},
	series: [{
		name: 'Submissions',
		showInLegend: false,
		data: []
	}],			
    labels: {
     		style: {
        		color: '#FFF'
     		}
  		},		
	navigation: {
		menuItemStyle: {
			fontSize: '10px'
		}
	}
};
	
function maker(type,size){
	chart.showLoading();
	jQuery.get("chart.action",{type:type,size:size}, function(data)
	{
		chart.hideLoading();
		if (data.list != null) {
			for(var i=0; i<data.list.length; i++) {
				data.list[i]['x'] = parseInt(data.list[i]['x']);
				data.list[i]['y'] = parseFloat(data.list[i]['y']);	
			}
			options.series[0].data = data.list;
			options.title.text = "Online Judge Statistic by " + type;
			chart = new Highcharts.Chart(options);
		} else {
			document.getElementById('rating_container_loading').innerHTML = "Load Failed...";
		}	
	},"json");
}
	
function changeType(){
	var obj_type = document.getElementById("type");
	var obj_size = document.getElementById("size");
	var type_value = obj_type.value;
	var size_value = obj_size.value;
	maker(type_value,size_value);
}
	
$(document).ready(function() {
	chart = new Highcharts.Chart(options);		
	maker("monthly",15);
});		

</script>
   
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
