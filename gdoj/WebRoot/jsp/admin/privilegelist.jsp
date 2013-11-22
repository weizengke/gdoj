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
    <title>Welcome to GuiLin University of Electronic Technology Online Judge System</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
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
  	<div id="body">
		<div id="sidebar"> 	
            <div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Add Privilege</div>
	            </div>  
	            <div class="" style="margin: 6px;">
        			 <s:form id="addprivilege" method="post" action="addPrivilege.action" theme="simple" namespace="admin">
        				Username:
        				<input style="width:11em;" type="text" class="handleBox" name="privilege.username"/>
        				<br/>
        				Privilege Name: 
						<select id="rightstr"  style= "width:210px" name="privilege.rightstr">
							<option value="ADMIN" >Admin Of OJ</option>
							<option value="NOEDIT_ADMIN" >No Edit Privilege Of Admin</option>
						</select>
						<div style="text-align: center;margin: 12px;">	
							<input id="add-privilege" type="Submit" value="Add Privilege"/>
						</div>
        			</s:form>
	            </div>
	        </div>    
	
   	 </div> 
<script src="js/jquery-ui.min.js"></script>	
	<script>
	$(function() {
		var cache = {},
			lastXhr;
		$( ".handleBox" ).autocomplete({
		    delay: 300,	
		    width:100,
			minLength: 1,
			selectFirst: false,
			matchSubset:true,  
            matchContains: true,   
			source: function( request, response ) {				
				var term = request.term;		
				if ( term in cache ) {
					//alert(term);
					response( cache[ term ] );
					return;
				}

				lastXhr = $.getJSON( "ajaxUsers", {q:request.term} , function( data, status, xhr ) {
					//alert(data.users[0]);
					cache[ term ] = data.users;
					if ( xhr === lastXhr ) {
						response( data.users );
					}
				});
			}
		});

	});
</script>	
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     	<a href="admin">Admin</a>
     	  	  <a href="admin/news">News</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     	<a href="admin/privilege">Privilege</a>		    
     	</div>
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left">Privilege</div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="standings">
					 <tr class="header">
					   <th class="coder left-item" style="width: 168px;">Author</th>
					   <th class="motto" >Privilege</th>
					   <th class="rating" style="width: 100px;text-align: center;">*</th>
	                </tr>
	                <s:if test="privilegeList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="privilegeList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="coder left-item"><b><a href="profile/<s:property value="username"/>"><s:property value="username"/></a></b></td>
	            		<td class="motto">
	            				<s:property value="rightstr"/>
	            		</td>   		
	            		<td class="rating"><a href="admin/delPrivilege.action?privilegeId=<s:property value="id"/>">Delete</a></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    	  
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
