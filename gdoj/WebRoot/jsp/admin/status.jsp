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
    <title>Status</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
	<LINK href="css/prettify.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="js/prettify.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		  	prettyPrint();	
		});
	</script> 
  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
 
  <div id="body">

     <div id="content" > 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >
   			 <a href="admin">Admin</a>
   			   	  <a href="admin/news">News</a>
     		<a href="admin/problemset">Problems</a>
     	 <a href="admin/problemset/status">Status</a>
     		<a href="admin/contests">Contests</a>
     		<a href="admin/user">Users</a>
     			<a href="admin/privilege">Privilege</a>	
     	</div>
	    <div class="datatable" style="">	
	    		<div class="lt">&nbsp;</div>
	            <div class="rt">&nbsp;</div>
	            <div class="lb">&nbsp;</div>
	            <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="status"/></div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>
				<table class="status">
					 <tr class="header">
		               	 <th class="left-item"></th>
		               	 <th  class="id"><s:text name="statusid"/></th>
		               	 <th  class="date"><s:text name="submitdate"/></th>		   
		                 <th  class="coder"><s:text name="author"/></th>
		                 <th  class="title" ><s:text name="problem"/></th>
		                 <th  class="language"><s:text name="language"/></th>
		                 <th  class="verdict"><s:text name="status"/></th>
		                 <th  class="time"><s:text name="timeuse"/></th>
		                 <th  class="memory"><s:text name="memoryuse"/></th>
		                 
		                 
		                 
	                </tr>
	                <s:if test="solutionList.size==0">
	                 <tr ><td class="left-item dark" colspan="20" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="solutionList" status="st">	
	            	<tr class="<s:if test="#st.odd">dark</s:if>">
	            		<td class="left-item"><b><a class="re-judge" href="admin/rejudge/status/<s:property value="solution_id" default="0"/>" title="Re-Judge this submission">ReJudge</a></b></td>
	            		<td class="id">
	            		<a solutionId="<s:property value="solution_id" default="0"/>" class="viewSource" href="admin/view-source/<s:property value="solution_id" default="0"/>" title="source" target="_blank"><s:property value="solution_id" default="0"/></a>	
	            		</td>
	            		<td class="date"><s:date  name="submit_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></td>
	            		
	            		<td class="coder"><b><a href="profile/<s:property value="username" default="0"/>"><s:property value="username" default="Unknown"/></a></b></td>
	            		<td class="title">	            		
	            		<a href="admin/problemset/problem/<s:property value="problem_id"/>" ><s:property value="problem_id" default="0"/>.<s:property value="problemTitle[#st.index]" default="Unknow"/></a>
	            		</td>
	            		<td class="language" title="<s:property value="code_length" default="0"/> B"><s:property value="%{getText('language'+solutionList[#st.index].language)}"/></td>
	            		
	            		<td class="verdict 
	            		<s:if test="solutionList[#st.index].verdict==5">verdict_ac</s:if>
	            		<s:elseif test="solutionList[#st.index].verdict==3">verdict_ce</s:elseif>
	            		<s:elseif test="solutionList[#st.index].verdict==10">verdict_pe</s:elseif>
	            		<s:elseif test="solutionList[#st.index].verdict<5">verdict_prev</s:elseif>
	            		
	            		<s:else>verdict_other</s:else>
	            		" 
	            		id="status_<s:property value="solution_id" default="0"/>"
	            		status="<s:property value="solutionList[#st.index].verdict" default="0"/>"
	            		manual="0"
	            		>
	            		<s:if test="solutionList[#st.index].verdict==3">
	            		<a solutionId="<s:property value="solution_id" default="0"/>" class="viewCompileInfo" href="view-compileinfo/<s:property value="solution_id" default="0"/>" target="_blank"><s:property value="%{getText('verdict'+solutionList[#st.index].verdict)}"/></a>
	            		</s:if>
	            		<s:else>
	            			<s:property value="%{getText('verdict'+solutionList[#st.index].verdict)}"/>
	            			<s:if test="solutionList[#st.index].verdict==5"></s:if>
	            			<s:elseif test="solutionList[#st.index].verdict==4">
<s:if test="testcase>0"><span>on test <s:property value="testcase" default="1"/></span>
</s:if>
</s:elseif>
	            			<s:elseif test="solutionList[#st.index].verdict>5">
<s:if test="testcase>0">
<span>on test <s:property value="testcase" default="1"/></span>
</s:if>
</s:elseif>           			
	            		</s:else>	            		
	            		</td>
	            		<td class="time" id="time_<s:property value="solution_id" default="0"/>"><s:property value="time" default="0"/> ms</td>
	            		<td class="memory" id="memory_<s:property value="solution_id" default="0"/>"><s:property value="memory" default="0"/> kb</td>
					</tr>	
	           		</s:iterator>   
				</table>
		    </div>			  	 
	   </div> 
<script type="text/javascript">
$(document).ready(function() {
	$("a.re-judge").click(function() {
		if(confirm('WARNING! Do you really want to rejudge this submission?')){
			
		}else return false;
	}); 
});
</script> 

<script language="JavaScript">
var loader = "&nbsp; <img src='img/loader.gif' style='vertical-align: middle;'/>";
		function load(){
                a = new Array();
                for(var i = 1; i<5; i++){
                		if(i!=3){
                			 var results = $('.verdict[status='+i+'][manual=0]').each(function(i, el){
                                var zz = $(el).attr('id').substring(7);
                                a.push( zz );
                                //$("#status_" + zz).html($("#status_" + zz).val()+"...");
                                //$('#time_'+zz).html(loader);
                       	 	});
                		} 
                };
               
                if( a.length > 0 ){
               
                	$.ajax({
                        type: "POST",
                        url: "ajaxStatus",
                        data: "ids="+a.join(','),
                        dataType: 'json',
                        success: function(data){
                       // alert(data.success);
                              	   for(var i = 0; i<data.status.length; i++){
                                        
                               			$("#status_" + data.status[i].solutionId).attr('status', data.status[i].verdictId);
                                       
                                        $("#time_" + data.status[i].solutionId).html(data.status[i].time+" MS");
                                        $("#memory_" + data.status[i].solutionId).html(data.status[i].memory+" KB");
                                        if( data.status[i].verdictId >5 ){
if (data.status[i].testCase>0)
{
                                                $("#status_" + data.status[i].solutionId).html(data.status[i].status_description +" on test "+data.status[i].testCase);
}
else{
                                                $("#status_" + data.status[i].solutionId).html(data.status[i].status_description);
}
                                        		$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_other');
                                        }
					 					if(  data.status[i].verdictId == 5 ){
                                       			 $("#status_" + data.status[i].solutionId).html(data.status[i].status_description);
                                                $("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_ac');    
                                        }
                                        if( data.status[i].verdictId == 10 ){
                                        	   //$("#status_" + data.status[i].solutionId).html(data.status[i].status_description+" on test "+data.status[i].testCase);
                                               $("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_pe');
                                        }
                                        if( data.status[i].verdictId == 4 ){
if (data.status[i].testCase>0)
{
                                                $("#status_" + data.status[i].solutionId).html(data.status[i].status_description +" on test "+data.status[i].testCase);
}
else{
                                                $("#status_" + data.status[i].solutionId).html(data.status[i].status_description);
}
                                                $("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_prev');
                                              //  $("#time_" + data.status[i].solutionId).html( loader );
                                                
                                        }
                                        if(data.status[i].verdictId ==3){
                                        	 var url = "<a solutionId="+data.status[i].solutionId +" class=\"viewCompileInfo\" href=\"view-compileinfo/"+ data.status[i].solutionId +"\" target=\"_blank\">" + data.status[i].status_description+ "</a>";
                                              $("#status_" + data.status[i].solutionId).html(url);
                                              $("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_ce');
                                        }
 										if( data.status[i].verdictId < 3 ){
                                         	   $("#status_" + data.status[i].solutionId).html(data.status[i].status_description);
                                               $("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_prev');
                                            //   $("#time_" + data.status[i].solutionId).html( loader );
                                        }                                       
                                }
                               
								setTimeout(load, 4000);
                        }
                	});
                }
        }

$(document).ready(function(){


		load();
})

</script>

<script>
 $(document).ready(function() {	 
 		$("a.viewSource").click(function() {
       		//alert("a");
       		  $(".pop-div p.pop-div-note").html("<img src='img/loader.gif'>");
       		 $(".pop-div p.pop-div-content").html(""); 
			$(".pop-div .pop-div-source").html("");			
       		 var solutionId = $(this).attr("solutionId");
       		 $(".pop-div").fadeIn(); 
		 //alert(solutionId);
       		 var opt="";
       		 $.getJSON("admin/json-view-source.action",{solutionId: solutionId},function(json){ 	
		        //  alert(json);
		            if (json.success != true) {
		            	//alert(json["error"]);
		            	$(".pop-div p.pop-div-note").html("<b>"+json["error"]+"</b>");
		            	return false;
		            }
		         	$(".pop-div p.pop-div-note").html("");
		         	
		         	opt+="By:<b><a style='color:#00C;' href='profile/"+json.solution.username+"'>" +json.solution.username+ "</a></b>, ";

					if(json.solution.contest_id>0){
						opt+="At <a style='color:#00C;' title='"+json.contestTitle+"' href='contest/"+json.solution.contest_id+"/problem/"+ json.problemId +"'>" + json.problemId + ". " + json.problemTitle + "</a>";
					}else{
						opt+="At <a style='color:#00C;' href='problemset/problem/"+ json.problemId +"'>" + json.problemId + ". " + json.problemTitle + "</a>";
					}										
		         	
		         	opt+=", <span class='";
		         	if(json.solution.verdict==5){
		         		opt+="verdict_ac";
		         	}else if(json.solution.verdict==3){
		         		opt+="verdict_ce";
		         	}else if(json.solution.verdict==10){
		         		opt+="verdict_pe";
		         	}else if(json.solution.verdict < 5){
		         		opt+="verdict_prev";
		         	}else{
		         		opt+="verdict_other";
		         	}
		         	opt+="'>";
		         	
		         	if(json.solution.verdict==3){
		         		opt+="<a style='color:#00C;' solutionId='"+ json.solution.solution_id +"' class='viewCompileInfo' href='view-compileinfo/"+ json.solution.solution_id + "'>" + json.verdict + "</a>";
		         	}else {
		         		opt+=json.verdict ;
						if(json.solution.verdict==5){
						}
						else if(json.solution.verdict==4){
							opt += " on test "+json.solution.testcase;
						}else if(json.solution.verdict>5){
							opt += " on test "+json.solution.testcase;
						}						
		         	}		         	 		
		         	opt+="</span>";
		         	//opt+= json.solution.time+" ms, "+ json.solution.memory +" kb";
		         	opt+="&nbsp;&nbsp;<a title='Open at new window' href='view-source/"+json.solutionId+"' target='_blank' >#</a>"
		         	opt+="<hr>";
		         	opt+="<pre class='prettyprint'>";
		            opt+=json.solutionSource.source;
		            opt+="</pre><br>";
		           	//alert(opt);
       				$(".pop-div .pop-div-source").html(opt);
       				
       				opt="<h5>Judge Log:</h5><br>" ;
       				opt+="<pre class='prettyprint'>";
       				opt+=json.judgeLog;
		            opt+="</pre><br>";
       				
       				$(".pop-div .pop-div-judgelog").html(opt);
       				
       				
       				prettyPrint();	
	 
       		 }); 
       		 return false;
        });
        
	    $("a.viewCompileInfo").click(function() {
       		//alert("a");
       		  $(".pop-div p.pop-div-note").html("<img src='img/loader.gif'>");
       		 $(".pop-div p.pop-div-content").html(""); 
			$(".pop-div .pop-div-source").html("");			
       		 var solutionId = $(this).attr("solutionId");
       		 $(".pop-div").fadeIn(); 
		
       		 var opt="";
       		 $.getJSON("viewcompileinfo.action",{solutionId: solutionId},function(json){ 	
		            if (json.success != true) {
		            	//alert(json["error"]);
		            	$(".pop-div p.pop-div-note").html("<b>"+json["error"]+"</b>");
		            	return false;
		            }
		         	$(".pop-div p.pop-div-note").html("");
		         	opt+="<a title='Open at new window'style='color:#00C;' href='view-compileinfo/"+ json.solutionId + "'  target='_blank'>#"+ json.solutionId +"</a>";
		            opt+="<pre class='code'>";
		            opt+=json.errorInfo;
		           	opt+="</pre><br>";
       				$(".pop-div .pop-div-source").html(opt);
	 
       		 }); 
       		 return false;
        });
      
});

</script>
	<!-- Pop div -->
	    <div class="pop-div"  >
	     <span style="position:relative;float:right;"><a  class="close" href="javascript:void(0)"><img src="img/closelabel.png"/></a></span>
	  	 <br/>
	  	 <div class="pop-inner-div" >	  	 	    
	  	 <p class="pop-div-note"></p>	 
		 <p class="pop-div-content"></p>
		 <div class="pop-div-source"></div>
		 		 <div class="pop-div-judgelog"></div>
		 </div>
		 <script type="text/javascript">
			 $(document).ready(function() {	 
			 	$("a.close").click(function(){
			 		$(".pop-div p.pop-div-content").html(""); 
				    $(".pop-div .pop-div-source").html(""); 
				     $(".pop-div .pop-div-judgelog").html("");
			 		 $(".pop-div").fadeOut(); 
			 	});

			 });
		 </script>
	   </div>
	<!--End Pop div -->
	   <div style="margin-right: 12px;font-size:15px;">
			<div class="left"></div>
			<div class="right">
					<s:if test="page>1">
						<a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page-1"/>" style="color:#000;text-decoration: none;">&larr;</a>
					</s:if>	
					<s:iterator value="pageList" status="st_page">				
						<s:if test="pageList[#st_page.index]==0">...</s:if>
						<s:else><a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property/>" style="color:#000;text-decoration: none;">
							<s:if test="page==pageList[#st_page.index]"><b><s:property/></b></s:if>
							<s:else><s:property/></s:else>
						</a></s:else>
					</s:iterator>
					<s:if test="page < pageCount">	
					    	
						<a href="admin/problemset/status<s:if test="problemId!=null">/problem/<s:property value="problemId"/></s:if><s:if test="username!=null">/with/<s:property value="username"/></s:if>/page/<s:property value="page+1"/>" style="color:#000;text-decoration: none;">&rarr;</a>		
					</s:if>						
			</div>
		</div>  
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </div>
  </body>
</html>
