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
 				<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   			</div> 	
    	 <div class="content-with-sidebar  round0123">
	     	<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
		    <div class="content round_0123" >	    	
			<s:form id="addproblem" method="post" action="addproblem.action" theme="simple" namespace="admin">
						<div style="padding:6px;">
						 <div style="text-align:center;" ><span class="fielderror"><s:property value="tip"/></span></div>
						<center>Secial Judge
						<select id="spj"  style= "width:60px" name="problem.spj">
							<option value="0" >No</option>
							<option value="1" >Yes</option>
						</select>
						Contest Problem
						<select id="contest_id"  style= "width:60px" name="problem.contest_id">
							<option value="0" >No</option>
							<option value="1" selected="selected">Yes</option>
						</select>
						<br/>
						Time Limit(MS):<input  id="time_limit" name="problem.time_limit" style="width: 48px;"  value="<s:property value="problem.time_limit" default="1000"/>" />&nbsp;&nbsp;Memory Limit(KB):<input  id="memory_limit" name="problem.memory_limit" style="width: 48px;"  value="<s:property value="problem.memory_limit" default="65535"/>"/><br/>					
						</center>
						<h5>
						Title:
						</h5>
						<input  id="title" name="problem.title" style="width: 100%;"  value="<s:property value="problem.title"/>"/>
						<h5>
							Description:
						</h5>
						<textarea class="ke-editor" id="ke-editor1" name="problem.description" rows="5" style="width: 100%" ><s:property value="problem.description"/></textarea>
						<h5>
							Input:
						</h5>
							<textarea class="ke-editor" id="ke-editor2" name="problem.input" rows="5" style="width: 100%" ><s:property value="problem.input"/></textarea>
						<h5>
							Output:
						</h5>
							<textarea class="ke-editor" id="ke-editor3" name="problem.output" rows="5" style="width: 100%" ><s:property value="problem.output"/></textarea>
						<h5>
							Sample Input:
						</h5>
							<textarea class="" id="" name="problem.sample_input" rows="5" style="width: 100%" ><s:property value="problem.sample_input"/></textarea>
						<h5>
							Sample Output:
						</h5>
							<textarea class="" id="" name="problem.sample_output" rows="5" style="width: 100%" ><s:property value="problem.sample_output"/></textarea>
						<h5>
							Hint:
						</h5>
							<textarea class="ke-editor" id="ke-editor6" name="problem.hint" rows="5" style="width: 100%" ><s:property value="problem.hint"/></textarea>
						<h5>
							Source:
						</h5>
							<input class="" id="source" name="problem.source" style="width: 100%;"  value="<s:property value="problem.source"/>"/>
						<h5>
							Author:
						</h5>
							<input  id="author" name="problem.author" style="width: 100%;"  value="<s:property value="problem.author"/>"/>
						<h5>
							Tag:
						</h5>

							<div>
								<div class="tags-autocomplete-select">
									<input type="hidden" id="submit-tags" class="problem-tag" name="tagList" value="<s:property value="tagList"/>"/>
									<i class="icon"></i>
									<input type="text" id="input-tags" autocomplete="off" class="input-tags"/>
									<div class="tags-autocomplete-select-menu"></div>
									<script type='text/javascript'>
										$(document).ready(function(){
											var cache = {};
											function showSelectTags(tags) {
												$(".tags-autocomplete-select-menu").html("");
												$(".tags-autocomplete-select-menu").fadeIn();
												var opt = "";
												$.each(tags, function(i, event) {
													/* 过滤已经插入的tag */
													var tagList = $('#submit-tags').val().split(",");
													if (tagList.indexOf(tags[i]) == -1) {
														opt += "<div class=\"tags-autocomplete-select-item\" data-value=\""+ tags[i] +"\">" + tags[i] +"</div>";
													}
												});
												$(".tags-autocomplete-select-menu").html(opt);
											}
											function searchTags(word) {
												if ( word in cache ) {
													showSelectTags(cache[ word ]);
												} else {
													$.getJSON("ajaxTags",{q: word},function(json) {
														if (json.success != true) {
															cache[ word ] = json.tags;
															showSelectTags(json.tags);
														}
													});
												}
											}
											function insertShowTags(tags) {
												$.each(tags, function(i, event) {
													if (tags[i].length != 0) {
														var opt = "<a class=\"label-item\">" + tags[i] + "<i class=\"icon-delete\"></i></a>";
														$("#input-tags").before(opt);
													}
												});
											}
											function initShowTags() {
												var tags = $('#submit-tags').val().split(",");
												insertShowTags(tags);
											}
											initShowTags();

											$("#input-tags").focus(function(){
												searchTags($(this).val().replace(/(^\s*)|(\s*$)/g, ""))
											});
											$("#input-tags").blur(function(){
												$(".tags-autocomplete-select-menu").fadeOut();
											});
											$("#input-tags").bind('input propertychange',function(e){
												searchTags($(this).val().replace(/(^\s*)|(\s*$)/g, ""))
											})
											$(document).on("click",".tags-autocomplete-select-item",function() {
												/* 插入新的tag */
												var insertTag = $(this).attr("data-value");
												var tags = [];
												tags.push(insertTag);
												insertShowTags(tags);

												/* 清空输入框内容 */
												$("#input-tags").val("");

												/* 插入tag到隐藏的input框 */
												updateSubmitTags();
											});
											$(document).on("click",".icon-delete",function() {
												$(this).parent().remove();
												updateSubmitTags()
											});

											function updateSubmitTags() {
												var tagsList = "";
												$("a.label-item").each(function(){
													console.log($(this).text());
													if (tagsList.length == 0) {
														tagsList = $(this).text();
													} else {
														tagsList += "," + $(this).text();
													}
												});
												$('#submit-tags').val(tagsList);
											}
										});
									</script>
								</div>
							</div>

	                        <br/>
	                        
							 <div style="text-align: center;margin-top: 12px;">			    		
				    			<input id="add" type="Submit" value="Add Problem"/>
				    		</div>	
	                    </div>		
					</div>
				    </s:form>

<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>
<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var cache = {},
	lastXhr;
	$("a.add-tags-row").click(function() {
		var currentLi = $(this).parent().parent();
		var li = $("<li style='list-style-type:none;'></li>");
		var count = $("div.add-tags input").size();
		if(count<5){
			 var input1 = $("<input  style=\"width: 7em;\" name=\"tag" + ++count + "\"/>");
			 input1.appendTo(li);
			$("<span>&nbsp;</span>").appendTo(li);
			li.insertBefore(currentLi);
			for(;count<5;){
			  var input2 = $("<input  style=\"width: 7em;\" name=\"tag" + ++count + "\"/>");
			  input2.appendTo(li);
			 $("<span>&nbsp;</span>").appendTo(li);
			 li.insertBefore(currentLi);
		  }
		  input1.focus();
		}else{
			alert("You can add at most 5 tags.");
		}

		$( "input" ,li).autocomplete({
			delay: 300,
			width:100,
			minLength: 1,
			selectFirst: false,
			matchSubset:true,
			matchContains: true,
			source: function( request, response ) {
				var term = request.term;
				if ( term in cache ) {
					response( cache[ term ] );
					return;
				}

				lastXhr = $.getJSON( "ajaxTags", {q:request.term} , function( data, status, xhr ) {
					cache[ term ] = data.tags;
					if ( xhr === lastXhr ) {
						response( data.tags );
					}
				});
			}
		});
		return false;
	});


	$( ".add-tags input" ).autocomplete({
		delay: 300,
		width:100,
		minLength: 1,
		selectFirst: false,
		matchSubset:true,
		matchContains: true,
		source: function( request, response ) {
			var term = request.term;
			if ( term in cache ) {
				response( cache[ term ] );
				return;
			}

			lastXhr = $.getJSON( "ajaxTags", {q:request.term} , function( data, status, xhr ) {
				cache[ term ] = data.tags;
				if ( xhr === lastXhr ) {
					response( data.tags );
				}
			});
		}
	});
});
</script>
	
			<div style="margin-right: 12px;text-decoration: none;">
					<div class="left"></div>
					<div class="right">
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
