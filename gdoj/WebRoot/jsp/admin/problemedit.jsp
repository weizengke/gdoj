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
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
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
		 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
		   	</div>
    	 	<div class="content-with-sidebar  round0123">
			<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    	<div class="content round_0123" style="">		    
			    	<s:form id="problemUpdate" method="post" action="problemUpdate.action" theme="simple">
					<div style="">
					<div style="text-align:center;" ><span class="fielderror"><s:property value="tip"/></span></div>
					<center>
					
					Problem ID.<input  id="problem_id" name="problem.problem_id" style="width: 48px;"  value="<s:property value="problem.problem_id"/>"/>
					Special Judge 
					<select id="spj"  style= "width:60px" name="problem.spj">
						<option value="0" <s:if test="problem.spj==0">selected="selected"</s:if>>No</option>
						<option value="1" <s:if test="problem.spj==1">selected="selected"</s:if>>Yes</option>
					</select>
					Hide Problem
					<select id="contest_id"  style= "width:60px" name="problem.contest_id">
						<option value="0" <s:if test="problem.contest_id==0">selected="selected"</s:if>>No</option>
						<option value="1" <s:if test="problem.contest_id==1">selected="selected"</s:if> >Yes</option>
					</select>
					<br/>Time Limit(MS):<input  id="time_limit" name="problem.time_limit" style="width: 48px;"  value="<s:property value="problem.time_limit"/>"/>&nbsp;&nbsp;Memory Limit(KB):<input  id="memory_limit" name="problem.memory_limit" style="width: 48px;"  value="<s:property value="problem.memory_limit"/>"/><br/>

					OJ Name.<input  id="oj_name" name="problem.oj_name" style="width: 48px;"  value="<s:property value="problem.oj_name"/>"/>
					OJ_PID.<input  id="oj_pid" name="problem.oj_pid" style="width: 48px;"  value="<s:property value="problem.oj_pid"/>"/>
					Virtual Judge 
					<select id="isvirtual"  style= "width:60px" name="problem.isvirtual">
						<option value="0" <s:if test="problem.isvirtual==0">selected="selected"</s:if>>No</option>
						<option value="1" <s:if test="problem.isvirtual==1">selected="selected"</s:if>>Yes</option>
					</select>
					<br>
					</center>
					<h5>
					Title:
					</h5>
					<input  id="title" name="problem.title" style="width: 100%;"  value="<s:property value="problem.title"/>"/>
					<h5>
						Description:
					</h5>
					<textarea class="" id="ke-editor1" name="problem.description" rows="5" style="width: 100%" ><s:property value="problem.description"/></textarea>
					<h5>
						Input:
					</h5>
						<textarea class="" id="ke-editor2" name="problem.input" rows="5" style="width: 100%" ><s:property value="problem.input"/></textarea>
					<h5>
						Output:
					</h5>
						<textarea class="" id="ke-editor3" name="problem.output" rows="5" style="width: 100%" ><s:property value="problem.output"/></textarea>
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
						<textarea class="" id="ke-editor6" name="problem.hint" rows="5" style="width: 100%" ><s:property value="problem.hint"/></textarea>
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
				    	<input id="add" class="register-box-submit" type="Submit" value="Save Problem"/>
					</div>				
				</div>
			    </s:form>
<script type='text/javascript' src='js/ke/kindeditor-min.js' charset='utf-8'></script>
<style>
.ke-icon-code {
	background-image: url(img/code.gif);
	background-position: 0px 0px;
	width: 16px;
	height: 16px;
}
.ke-icon-quote {
	background-image: url(img/quote.gif);
	background-position: 0px 0px;
	width: 16px;
	height: 16px;
}
</style>
<script type='text/javascript'>
<!--
$(document).ready(function(){
KE.lang['code'] = "插入程序代码或脚本";
KE.plugin['code'] = {
	click : function(id) {
		KE.util.selection(id);
		var dialog = new KE.dialog({
			id : id,
			cmd : 'code',
			file : 'code/insert_code.html',
			width : 530,
			height : 300,
			title : KE.lang['code'],
			yesButton : KE.lang['yes'],
			noButton : KE.lang['no']
		});
		dialog.show();
	},
	check : function(id) {
		var dialogDoc = KE.util.getIframeDoc(KE.g[id].dialog);
		var lang = KE.$('ic_lang', dialogDoc).value;
		var source = KE.$('ic_source', dialogDoc).value;
		if(lang == ''){
			alert('编程语言必须选择');
			return false;
		}
		if(source == ''){
			alert('请输入程序代码或者脚本');
			return false;
		}
		return true;
	},
	insert : function(id, lang,source) {
		var html = '<pre class="brush:' + lang + '; toolbar: true; auto-links: false;">';
		html += html_encode(source);
		html += '</pre><p> </p>';	
		KE.util.insertHtml(id, html);
		KE.layout.hide(id);
		KE.util.focus(id);
	},
	exec : function(id) {
		KE.util.select(id);
		var iframeDoc = KE.g[id].iframeDoc;
		var dialogDoc = KE.util.getIframeDoc(KE.g[id].dialog);
		if (!this.check(id)) return false;
		var lang = KE.$('ic_lang', dialogDoc).value;
		var source = KE.$('ic_source', dialogDoc).value;
		this.insert(id, lang, source);
	}

};


KE.lang['quote'] = "引用某段文字";
KE.plugin['quote'] = {
	click : function(id) {
		/*
		KE.util.selection(id);
		val html = KE.selectedHtml(id);
		alert(html);
		insert(id, html);
		*/
		KE.util.selection(id);
		var dialog = new KE.dialog({
			id : id,
			cmd : 'quote',
			file : 'quote/insert_quote.html',
			width : 530,
			height : 300,
			title : KE.lang['quote'],
			yesButton : KE.lang['yes'],
			noButton : KE.lang['no']
		});
		dialog.show();
	},
	check : function(id) {
		var dialogDoc = KE.util.getIframeDoc(KE.g[id].dialog);
		var source = KE.$('ic_source', dialogDoc).value;
		
		if(source == ''){
			alert('请输入要引用的文字内容');
			return false;
		}
		
		return true;
	},
	exec : function(id) {
		KE.util.select(id);
		var iframeDoc = KE.g[id].iframeDoc;
		var dialogDoc = KE.util.getIframeDoc(KE.g[id].dialog);
		if (!this.check(id)) return false;
		var source = KE.$('ic_source', dialogDoc).value;
		this.insert(id, source);
	},
	insert : function(id, source) {
		var html = '<blockquote>';
		html += html_encode(source);
		html += '</blockquote><br/>';
		KE.util.insertHtml(id, html);
		KE.layout.hide(id);
		KE.util.focus(id);
	}
};
});



//-->

</script>

<script type='text/javascript'>
<!--
$(document).ready(function(){
	KE.show({
		id : 'ke-editor1',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
	KE.show({
		id : 'ke-editor2',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
	KE.show({
		id : 'ke-editor3',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
	KE.show({
		id : 'ke-editor4',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
	KE.show({
		id : 'ke-editor5',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
	KE.show({
		id : 'ke-editor6',
		allowUpload : true,
		syncType : 'auto',
		cssPath : 'css/ke-oj.css',	
		items : [
				 'bold', 'italic', 'underline', 'strikethrough','subscript','superscript', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'quote', '|','source' ,'about'
				 ]
	});
});

//-->

</script>
				<div style="margin-right: 12px;text-decoration: none;">
						<div class="left"></div>
						<div class="right"></div>
				</div>
		   </div>
		 </div>
			<div class="clear"></div>
  		 </div>
     <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
