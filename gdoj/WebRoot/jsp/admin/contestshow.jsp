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
    <title>Online Judge System</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shCore.css"/>
<link type="text/css" rel="stylesheet" href="js/ckeditor/plugins/syntaxhighlight/styles/shThemeDefault.css"/>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shCore.js"></script>
<script type="text/javascript" src="js/ckeditor/plugins/syntaxhighlight/scripts/shBrushes.js"></script>
<script type="text/javascript">
SyntaxHighlighter.config.clipboardSwf = 'js/ckeditor/plugins/syntaxhighlight/scripts/clipboard.swf';
SyntaxHighlighter.all();
</script> 

	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <style>
	.ui-autocomplete-loading { background: white url('img/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-autocomplete {
		max-height: 200px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 3px;
		
		font-size:11px;
		line-height: 12px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 200px;
	}	
	</style>
	
  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div class="container">
        <div class="content">       
	     	<div class="sidebar"> 
              <div class="sidebox roundbox">
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Contest Info.</div>
	            </div>  
	            <div class="" style="margin: 6px;font-size: 12px;word-wrap:break-word;">
        			<pre><s:property value="contest.description" escape="flase"/></pre>
	            </div>           
	        </div>    	   
            <div class="sidebox roundbox">
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="tools-box" style="margin: 6px;color: #000;">
        			<b><a href="admin/contestEdit.action?contestId=<s:property value="contest.contest_id"/>">Edit Contest</a></b>
        			<br/><b><a href="admin/reJudge?contestId=<s:property value="contest.contest_id"/>" class="re-judge">ReJudge Contest</a></b>
	            </div>
	        </div>    
	        
   	 </div> 
    		 <div  class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    <div class="content" style="padding:3px 3px 3px 3px;">	    		
				<div class="data-title">
					<h3>
						<s:property value="contest.title"/>
					</h3>
					Start Time:<s:date  name="contest.start_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>
					<br/>
					&nbsp;&nbsp;End Time:<s:date  name="contest.end_time" nice="false" format="yyyy-MM-dd HH:mm:ss"/>
					<br/>
<!--					<s:if test="contest.password==''">Public</s:if><s:else>Private</s:else>-->
				</div>
				<div class="roundbox">
				    	<div class="roundbox-title">
							<s:text name="contestproblems"/>
						</div>
						<div >
							<table class="problem rtable">
								 <tr class="header">
					               	 <th class="id left-item"><s:text name="problemid"/></th>
					               	 <th class="problem">
					               	 <div style="float:left;">
				            				<s:text name="problem"/>
				            			</div>
				            			<div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">				
	            							Title at Contest
	            						</div>
	            						
	            						</th>
					                 <s:if test="contest.type==1"><th class="point"><s:text name="point"/></th></s:if>					               
					                 <th class=""></th>
				                </tr>    
				                <s:if test="cproblemList.size==0">
				                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
				                </s:if>
								<s:iterator value="cproblemList" status="st">	
				            	<tr <s:if test="#st.odd">class="dark"</s:if> id="tr<s:property value="num"/>">
				            		<td class="id left-item"><a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>"><s:property value="num"/></a></td>
				            		<td class="title" style="text-align: left;word-wrap:break-word;">
				            			<div style="float:left;">
				            				<a href="admin/problemset/problem/<s:property value="problemList[#st.index].problem_id"/>"><s:property value="problemList[#st.index].problem_id"/>. <s:property value="problemList[#st.index].title"/></a>
				            			</div>
				            			<div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">				
	            							<a href="contest/<s:property value="contestId"/>/problem/<s:property value="num"/>"><s:property value="title"/></a>
	            						</div>
				            		</td>
				            		<s:if test="contest.type==1"><td class="point"><s:property value="point"/>pt</td></s:if>
				            		<td class=""><a href="admin/contestProblemDelete.action?num=<s:property value="num"/>&contestId=<s:property value="contest.contest_id"/>" class="problem-delete" num="<s:property value="num"/>" contestId="<s:property value="contest.contest_id"/>">Delete</a>
				            		|<a href="admin/reJudge?problemId=<s:property value="problemList[#st.index].problem_id"/>&contestId=<s:property value="contest.contest_id"/>" class="re-judge">ReJudge</a>
				            		</td>
				            	</tr>	
				           		</s:iterator>   
				           		<tr>
				           		<s:form action="contestaddproblem" theme="simple" namespace="admin">					
									<td class="id left-item">
										<span style="color:grey"><s:property value="index"/></span>
										<input type="hidden" name="problem.num" value="<s:property value="index"/>"/>
										<input type="hidden" name="problem.contest_id" value="<s:property value="contestId"/>"/>
									</td>
									<td class="title" style="text-align: left;word-wrap:break-word;">
										<div  class="add-problem"  style="float:left;">	
											<input type="text"  style="width: 68px; height: 18px;" name="problem.problem_id" placeholder="PID">(Problem ID. or Title)
				            			</div>
				            			<div style="float:right;font-size:11px;padding-top:1px;text-align:right;">				
	            							<input type="text" style="width: 228px;" name="problem.title" placeholder="Title display at contest." value="Problem <s:property value="index"/>">
	            						</div>	
									</td>
									<s:if test="contest.type==0"><input type="hidden" style="width: 50px;" name="problem.point" value="1"></s:if>
									<s:elseif test="contest.type==1"><td class="point"><input type="text" style="width: 50px;" name="problem.point" placeholder="ppts" value="1"></td></s:elseif>
									<td class="ratio">
										<input type="submit"  value="Add Problem">	
									</td>			
								  </s:form>		
				           		</tr>
				           		
							</table>
					    </div>	 	 
			</div>	
<script type="text/javascript">
$(document).ready(function() {
	$("a.re-judge").click(function() {
		if(confirm('WARNING! Do you really want to rejudge this problem?')){
			
		}else return false;
	}); 
});
</script> 
			
<script src="js/jquery-ui.min.js"></script>	
<script type="text/javascript">
      $(document).ready(function() {
		var cache = {},
			lastXhr;
		$( ".add-problem input" ).autocomplete({
		    delay: 300,	
		    width:100,
			minLength: 1,
			selectFirst: false,
			matchSubset:true,  
            matchContains: true,           
			source: function( request, response ) {				
				var term = request.term;		
				if ( term in cache ) {									
					response( $.map( cache[ term ], function( item ) {							
							return {
								label: item.problemId+"."+item.title,
								value: item.problemId
							}
					}));
					return;
				}
				lastXhr = $.getJSON( "jsonProblemset", {searchString:request.term} , function( data, status, xhr ) {
					cache[ term ] = data.problems;
					response( $.map( data.problems, function( item ) {							
							return {
								label: item.problemId+"."+item.title,
								value: item.problemId
							}
					}));	
					if ( xhr === lastXhr ) {
						response( $.map( data.problems, function( item ) {							
							return {
								label: item.problemId+"."+item.title,
								value: item.problemId
							}
						}));
					}
				});
			}
		});
      
   
 		
 		$(".contest-add-problem").click(function(){
 				$("tr:last").after("<tr><td>ID</td><td>Title</td><td></td></tr>");
 				return false;
 		});
 		

});
</script>
	   </div>    
	</div>
			<div class="clear"></div>
  		 </div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
