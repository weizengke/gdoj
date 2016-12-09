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
    <title>Standings - <s:property value="contest.title"/> - Online Judge</title>
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
  <div id="body">
	

     <div id="content" > 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >
 
     	</div>
     	 <div class="data-title" style="width: 100%;position: relative;text-align: center;">
	        <h3>
				<s:property value="contest.title"/>
			</h3>
				<div id="contest_status" class="">
					<s:if test="timeLeft==0" ><span class="ended">Final Standings</span></s:if>
					<s:elseif test="timeLeft>0">
					<span class="running">Current Standings</span>
					</s:elseif>
					<s:else><span class="pending">Contest Pending</span></s:else>
<s:if test="timeLeft>0" >
<br/><span id="clock" class="" style=""></span>
<script language="javascript">
		var time = <s:property value="timeLeft"/>;
		$("#clock").html(OnlineJudge.formatSeconds(time));
		function clock(){
			if(time>0){
				 $("#clock").html(OnlineJudge.formatSeconds(time));
				 time--;
				 if(time==0){
				 	$("#contest_status").html("Final Standing"); 	
				 	$("#contest_status").attr('class', 'ended'); 
				 }
				 setTimeout(clock, 1000);
			}
		}
		
$(document).ready(function(){
		clock();
})
		
</script>
</s:if>					
				   </div>
	    </div>  
	    <div class="datatable" style="">	
	    		<div class="lt">&nbsp;</div>
	            <div class="rt">&nbsp;</div> 
	            <div class="lb">&nbsp;</div>
	            <div class="rb">&nbsp;</div>         
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="standings"/></div>
				<div class="right"><span style="font-size:10px;color:grey;"><s:text name="contestcellnote"/>
				</span></div>
			</div> 		
			<div class="innertable" style="">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>
				<table class="standings">
					 <tr class="header">
		               	 <th  class="rank left-item">#</th>
		               	 <th  class="coder"><s:text name="author"/></th>
		               	 <s:if test="contest.type==0"><th  class="solved2">=</th></s:if>
		               	 <s:elseif test="contest.type==1"><th  class="score"><s:text name="score"/></th></s:elseif>		             	 
		                 <th  class="penalty" ><s:text name="penalty"/></th>
		                 <s:iterator value="cproblemList" status="st">	
		                 <th  class="problem">
		                 <span><a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>" title="<s:property value="num"/> - <s:property value="title"/>"><s:property value="num"/></a></span>
		                 <s:if test="contest.type==1"><br/><span style="font-weight: normal;"><s:property value="point"/>pt</span></s:if>
		                 </th>
						</s:iterator>
	                </tr>
	                <s:if test="attendList.size==0">
	                 <tr ><td class="left-item dark" colspan="32" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
				    <s:iterator value="attendList" status="st">
				    	<tr style="height: 42px;" username="<s:property value="username"/>" class="<s:if test="#st.odd">dark</s:if> <s:if test="#session.session_username==username">my</s:if>">	
							<td class="rank left-item"><s:property value="rankList[#st.index]"/></td>
							<td class="coder source" >
							  <div style="float:left;">
								<b><a href="profile/<s:property value="username"/>" target="_blank" class="user-tip" user="<s:property value="username"/>"><s:property value="username"/></a></b>
							  </div>
							  <div style="float:right;font-size:12px;text-align:right;color: grey;">
							    <span title="<s:property value="userList[#st.index].school" default=""/>"><s:property value="userList[#st.index].nickname" default=""/></span>
							  </div>
							</td>
						 <s:if test="contest.type==0"><td class="solved2"><span <s:if test="solved>0">style="color:#000;font-weight: bold;"</s:if>><s:property value="solved"/></span></td></s:if>
		               	 <s:elseif test="contest.type==1"><td class="score"><span <s:if test="score>0">style="color:#000;font-weight: bold;"</s:if>><s:property value="score"/></span></td></s:elseif>	
							
							<td class="penalty"><s:property value="penaltyList[#st.index]"/></td>
							<s:iterator  value="acTimeList.get(username)" status="acst" var="actime">
						
							 <s:if test="acTimeIntList.get(username)[#acst.index]>0">
							 	 <td  class="problem source"  problemId="<s:property value="cproblemList[#acst.index].num" />">
							 	 	<b><span style="color:#32CD32">+<s:if test="wrongSubmits.get(username)[#acst.index]>0"><span title="<s:property value="wrongSubmits.get(username)[#acst.index]" /> wrong try"><s:property value="wrongSubmits.get(username)[#acst.index]" /></span></s:if></span></b>
									 <br/><span style="font-size:10px;"><s:property value="actime" /></span>						 
								</td>
							 </s:if>
							 <s:else>
							 		<s:if test="wrongSubmits.get(username)[#acst.index]>0">
										<td  class="problem source" problemId="<s:property value="cproblemList[#acst.index].num" />">
										<span style="color:grey" title="<s:property value="wrongSubmits.get(username)[#acst.index]" /> wrong try">-<s:property value="wrongSubmits.get(username)[#acst.index]" /></span>
										</td>
									</s:if>
							 		<s:else><td>&nbsp;</td></s:else>
							 </s:else>
						   </s:iterator>	
						</tr>	
				   </s:iterator>
				</table>
		    </div>			  	 
	   </div> 
<script type="text/javascript">
 $(document).ready(function() {	 
	    $(".source").bind("dblclick", function() {
       		
       		  $(".pop-div p.pop-div-note").html("<img src='img/loader.gif'>");
			$(".pop-div .pop-div-source").html("");			
       		 var username = $(this).parent().attr("username");
       		 var problemId = $(this).attr("problemId");
       		 var contestId= <s:property value="contestId" />;
       		 $(".pop-div").fadeIn(); 
		
       		 
       		 $.getJSON("jsonSolutions.action",{contestId: contestId,problemId:problemId,username:username},function(json){ 	
		            if (json.success != true) {
		            	//alert(json["error"]);
		            	$(".pop-div p.pop-div-note").html("<b>"+json["error"]+"</b>");
		            	return false;
		            }
		         $(".pop-div p.pop-div-note").html("");
		          var opt="<pre class='submissions'>";  
		   
		            $.each(json.solutions, function(i, event) {         	
		            	opt+="&nbsp;"+json.solutions[i].contestTimes+" &nbsp;&nbsp;";
		            	
		            	if(problemId!=""){
		            		opt+="<a href='contest/"+contestId+"/problem/"+json.solutions[i].problemNum+"' target='_blank'>"+json.solutions[i].problemNum+"</a>&nbsp;&nbsp; ";
		            	}
		            	
		            	opt+="<span style=\"color:";
		            	
		            	if(json.solutions[i].status_description=="Accepted"){
		            	 	opt+="green;font-weight:bold;\">";
		            	}else if(json.solutions[i].status_description=="Compilation Error"){
		            		opt+="#000;\">";
		            	}
		            	else{
		            	 	opt+="#00A;\">";
		            	}
		            	opt+=json.solutions[i].status_description+"&nbsp;&nbsp;</span>  &rarr; ";
		            	opt+="<a solutionId=\""+event.solutionId+"\" class=\"viewSource\" href=\"view-source/"+event.solutionId+"\" target=\"_blank\">#"+event.solutionId+"</a><br/>";
		           		
		            });
		            opt+="</pre><br>";
		            //alert(opt);
       				 $(".pop-div .pop-div-source").html(opt);
	 
       		 }); 
        });
        
        
        
});
</script>
	   <div class="pop-div"  >
	     <span style="position:relative;float:right;"><a  class="close" href="javascript:void(0)"><img src="img/closelabel.png"/></a></span>
	  	 <br/>
	  	 <div class="pop-inner-div" >	  	 	    
	  	 <p class="pop-div-note"></p>	 
		 <div class="pop-div-source"></div>
		 </div>
		 <script type="text/javascript">
			 $(document).ready(function() {	 
			 	$("a.close").click(function(){
				    $(".pop-div .pop-div-source").html(""); 
			 		 $(".pop-div").fadeOut(); 
			 	});

			 });
		 </script>
	   </div>
  
	   <div style="margin-right: 12px;">
			<div class="left"></div>
			<div class="right">
					<s:if test="page>1">
						<a href="contest/<s:property value="contestId"/>/standings/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">  &larr; </a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<a href="contest/<s:property value="contestId"/>/standings/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a>	
					</s:iterator>	
					<s:if test="page < pageList.size">		
						<a href="contest/<s:property value="contestId"/>/standings/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">  &rarr; </a>		
					</s:if>						
			</div>
		</div>          
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?uid=1339907478548202&type=left&amp;move=0" charset="utf-8"></script>
<!-- JiaThis Button END -->
  </div>
  </body>
</html>
