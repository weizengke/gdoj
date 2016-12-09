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
    <title>Edit News <s:property value="news.title"/></title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
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
  <div id="body">	


	<div id="sidebar"> 	  
		<div class="sidebox roundbox">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>
	       		    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%">Tools Box</div>
	            </div>  
	            <div class="" style="margin: 6px;">    	
				     <b><a href="admin/newsnew">New News</a></b>				     	
	            </div>	              
	        </div>    
 		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
   	</div> 
   	
    <div id="content" class="content-with-sidebar round0123"  >     
	   <div id="nav-content" >
    <a href="admin">Admin</a>
   		<a href="admin/news">News</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     		<a href="admin/privilege">Privilege</a>		
     	</div>
	    <div class="topic">	
	     	<div>	
				  <div class="comment round_0123 highlight mail-edit-box mail-edit-box-pro" style="position: relative;padding: 6px;">
				  <form action="" method="post">	     																								
				  			<input type="hidden" name="newsId" value="<s:property value="news.news_id"/>" >						
							<div style="text-align:left;margin-bottom: 6px;">
							Title:
							<input class="message-title" id="message-title" name="title1" maxlength="100" value="<s:property value="news.title"/>">
							
							<textarea class="message-content" id="news-content" name="content" rows="20" ><s:property value="news.content"/></textarea>	
							orderNum:
							<input  id="news-top" name="orderNum1"  value="<s:property value="news.orderNum"/>">	
							Defunct:
							<select id="defunct"  style= "width:60px" name="defunct1">
								<option value="N" <s:if test="news.defunct==\"N\"">selected="selected"</s:if>>No</option>
								<option value="Y" <s:if test="news.defunct==\"Y\"">selected="selected"</s:if>>Yes</option>
							</select>
							<div style="text-align:center;" ><span class="fielderror"></span></div>
							<div style="text-align: center;margin-top: 12px;">
							<input  type="Submit" value="Post">
							<input  type="reset" value="Reset" >
							</div>
					</div>
						
					</form>     
	    		</div> 	
	    	</div>
	    </div>
	</div>  

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
		id : 'news-content',
		resizeMode : 1,
		shadowMode : false,
		allowPreviewEmoticons : false,
		allowUpload : true,
		syncType : 'auto',
		urlType : 'domain',
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
				
		
		var mailReplyFormSubmitListener = function() {
		
		
		var id = $(this).attr("id");    
		var newsId = $(this).find("input[name=newsId]").val();
     	var title = $(this).find("input[name=title1]").val();
        var content = $(this).find("textarea[name=content]").val();    
        var orderNum = $(this).find("input[name=orderNum1]").val();
          var defunct = $(this).find("select[name=defunct1]").val();
        postNewMailReply = function() {
            $.post(
                "postnews.do",
                {newsId:newsId, title: title, content: content, orderNum:orderNum ,defunct:defunct,type:"edit"},
                function(data) {    
                   if (data.success != true) {
                     $(".fielderror").html(data["error"]);
                    return;
                  }	
                     $('input[type=submit]', this).attr('disabled', 'disabled');
                  window.location.href="admin/news"; 
                },
                "json"
            );
        };
       
        postNewMailReply();
        return false;
    	}
		
		var init = function() {
			
			 var e = $(".mail-edit-box");   
	         $(".mail-edit-box").find("form").submit(mailReplyFormSubmitListener);         
		}
		init();
		
});
</script>  
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
