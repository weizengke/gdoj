<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
   <s:head theme="xhtml"/>  
     <sx:head parseContent="true"/>
     <sx:head extraLocales="en-us,nl-nl,de-de" />
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

  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
	<div id="sidebar"> 	      
 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div> 	

     <div id="content"  class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
  	<a href="admin">Admin</a>
   		<a href="admin/news">News</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     		<a href="admin/privilege">Privilege</a>		
     	</div>
	    <div class="content round_0123" style="background-color:#EEE0E5;padding:3px 3px 3px 3px;">	    	
			<div class="datatable round_0123" style="background-color:#FFF;word-wrap:break-word;">
			    <s:form id="contestUpdate" method="post" action="contestUpdate.action"  theme="simple">
			    	<input type="hidden" id="id" name="contest.contest_id" style="width: 100%;"  value="<s:property value="contest.contest_id"/>"/>
					<div style="padding:6px;">
					<div style="text-align:center;" ><span class="fielderror"><s:property value="tip"/></span></div>
					<h5>
					Title:
					</h5>
					<input  id="title" name="contest.title" style="width: 100%;"  value="<s:property value="contest.title"/>"/>
					<span class="fielderror"><s:fielderror ><s:param>title</s:param></s:fielderror></span>
					<h5>
						Description:
					</h5>
					<textarea class="" id="ke-editor" name="contest.description" rows="10" style="width: 100%" ><s:property value="contest.description"/></textarea>
					<br/>
					Contest Start Time:<input style="width: 100px" class="start-date" name="start_date" readonly="readonly" value=<s:property value="start_date"/>>
					<input style="width: 24px" class="shour" name="shour"  value=<s:property value="shour"/>>HH
					<input style="width: 24px" class="sminute" name="sminute"  value=<s:property value="sminute"/>>MM
					<span class="fielderror"><s:fielderror ><s:param>start_date</s:param></s:fielderror></span>
					<br/>
					Contest End Time&nbsp;&nbsp;:<input style="width: 100px" class="end-date" name="end_date" readonly="readonly" value=<s:property value="end_date"/>>
					<input style="width: 24px" class="ehour" name="ehour"  value=<s:property value="ehour"/>>HH
					<input style="width: 24px" class="eminute" name="eminute"  value=<s:property value="eminute"/>>MM
					<span class="fielderror"><s:fielderror ><s:param>end_date</s:param></s:fielderror></span>
					<br/>
					Start Register Time:<input style="width: 100px" class="start-reg-date" name="start_reg_date" readonly="readonly" value=<s:property value="start_reg_date"/>>
					<input style="width: 24px" class="shour_reg" name="shour_reg"  value=<s:property value="shour_reg"/>>HH
					<input style="width: 24px" class="sminute_reg" name="sminute_reg"  value=<s:property value="sminute_reg"/>>MM<span class="fielderror"><s:fielderror ><s:param>start_reg_date</s:param></s:fielderror></span>
					<br/>
					End Register Time&nbsp;&nbsp;:<input style="width: 100px" class="end-reg-date" name="end_reg_date" readonly="readonly" value=<s:property value="end_reg_date"/>>
					<input style="width: 24px" class="ehour_reg" name="ehour_reg"  value=<s:property value="ehour_reg"/>>HH
					<input style="width: 24px" class="eminute_reg" name="eminute_reg"  value=<s:property value="eminute_reg"/>>MM<span class="fielderror"><s:fielderror ><s:param>end_reg_date</s:param></s:fielderror></span>
					<h5>
					Contest Type: 	
					<select id="type"  style= "width:150px" name="contest.type">
						<option value="0" <s:if test="contest.type==0">selected="selected"</s:if>>ACM/ICPC</option>
						<option value="1" <s:if test="contest.type==1">selected="selected"</s:if>>Google Code Jam</option>
					</select>
					</h5>
					<h5>
					Password:
					</h5>
					<input  id="password" name="contest.password" style="width: 200px;"  value="<s:property value="contest.password"/>"/>
	
					</div>
			    	<div style="text-align: center;margin: 12px;">	
			    		<input id="add" type="Submit" value="Save Contest"/>
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
		id : 'ke-editor',
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
					    

	<script type="text/javascript">
$(document).ready(function() {
	$('input.start-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:0",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.end-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:0",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.start-reg-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:0",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
    $('input.end-reg-date').datepick({
    dateFormat: 'yy-mm-dd',  
    changeMonth: true,
	changeYear: true,
    yearRange: "-100:0",
    showOn: 'both',
    buttonImageOnly: true,
    buttonImage: 'img/dateIcon.gif'
    });
});
</script>				
			    </div>		
			<div style="margin-right: 12px;text-decoration: none;">
					<div class="left"></div>
					<div class="right">
					</div>
		  </div>       	  	 
	   </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
