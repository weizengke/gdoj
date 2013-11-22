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
    <title>Mail <s:property value="mail.title"/></title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
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
	<div id="ads-box" class="round_0123" style=" margin: 12px auto;display: none;">
		<div style="padding: 0 10px;min-height: 80px;background-color: #EEE0E5;">
			Here is the ADS.
		</div>
	</div>

	<div id="sidebar"> 	    
 	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 

   	</div> 
    <div id="content" class="content-with-sidebar round0123"  >     
	   <div id="nav-content" >
     	<a href="mails"><s:text name="mails.recv"/></a>
     	<a href="mails/send"><s:text name="mails.send"/></a> 
         	<a href="mails/new"><s:text name="mails.new"/></a>    	
     	</div>
	    <div class="topic">
			<div class="title">
			   	<p><s:property value="mail.title"/></p>
			</div>
		    <div class="info">		       
			 	<b>Received From <b><a href="profile/<s:property value="mail.from_user"/>"><s:property value="mail.from_user"/></a></b> at <s:date name="mail.create_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></b>
			</div>
			<div class="content">   
		       	<blockquote>
		      	<p><s:property value="mail.content" escape="false"/></p>		      				   
		        </blockquote>
		     </div>
		     <!-- Reply -->
	     	<div>
		    	   <b>Reply:</b> 	
				  <div class="round_0123 highlight reply-edit-box reply-edit-box-pro" style="position: relative;padding: 6px;">
				  <form action="" method="post">	     												
							<input  type="hidden" name="sendto" value="<s:property value="mail.from_user"/>">
							<input  type="hidden" name="reply" value="<s:property value="mail.mail_id"/>">
							<div style="text-align:left;margin-bottom: 6px;">
							Title:
							<input class="message-title" id="message-title" name="title1" maxlength="100" value="Re:<s:property value="mail.title"/>">							
							<textarea class="message-content" id="mail-content" name="content" rows="10" ></textarea>	
							</div>
							<div style="text-align:center;" ><span class="fielderror"></span></div>
							<div style="text-align: center;margin-top: 12px;">
							<input class="" type="Submit" value="Post">
							<input class="" type="reset" value="Reset" >
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
		id : 'mail-content',
		resizeMode : 1,
		shadowMode : false,
		allowPreviewEmoticons : false,
		allowUpload : true,
		syncType : 'auto',
		urlType : 'domain',
		cssPath : 'css/ke-oj.css',
	
		items : [ 'bold', 'italic', 'underline', 'strikethrough', 'removeformat','|','textcolor', 'bgcolor',  
				 'title', 'fontname', 'fontsize',  '|', 
				 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 
				 'link', 'unlink', 'emoticons','code', 'image', 'flash', 'quote', '|','selectall','source' ,'about'
				 ]
	});
});

//-->

</script>
		
	
<script type="text/javascript">
$(document).ready(function() {  

		var mailReplyFormSubmitListener = function() {
	
		var id = $(this).attr("id");
		var sendto = $(this).find("input[name=sendto]").val();
        var reply =	$(this).find("input[name=reply]").val();     
     	var title = $(this).find("input[name=title1]").val();
        var content = $(this).find("textarea[name=content]").val();    
 		$('input[type=submit]', this).attr('disabled', 'disabled');	
        postNewMailReply = function() {
            $.post(
                "postmail",
                {toUser:sendto, reply:reply, title: title, content: content},
                function(data) {    
                   if (data.success != true) {
                    
                    $(".fielderror").html(data["error"]);
                    return;
                  }	
                   $('input[type=submit]', this).attr('disabled', 'disabled');
                   window.location.href="mails/send"; 
                },
                "json"
            );
        };
        postNewMailReply();
        return false;
    	}
		
		var init = function() {
			
			 var e = $(".reply-edit-box");   
	         $(".reply-edit-box").find("form").submit(mailReplyFormSubmitListener);         
		}
		init();
   
});
</script>   
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
