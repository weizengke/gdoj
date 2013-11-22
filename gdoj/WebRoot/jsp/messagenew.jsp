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
    <title>New Topic</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
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
 	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 

   	</div> 
    <div id="content" class="content-with-sidebar round0123"  >     
	    <div id="nav-content" >	
			<a href="topic"><s:text name="topic"/></a>
			
			<a class="current" href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
     	</div>
	    <div class="topic">	
	     	<div>	
				  <div class="comment round_0123 highlight message-edit-box message-edit-box-pro" style="position: relative;padding: 6px;">
				  <form action="" method="post">	     																								
				  			<input type="hidden" name="moduleId" value="0" >
							<input type="hidden" name="parentId" value="0">
							<input type="hidden" name="rootId" value="0">							
							<div style="text-align:left;margin-bottom: 6px;">
							Title:
							<input class="message-title" id="message-title" name="title1" maxlength="50">
							
							<textarea class="message-content" id="topic_content" name="content" rows="20" ></textarea>	
						<!--  	Tags:
							<div class="add-tags" style="text-align:left;">
								<div style="float: left;width:420px;border-right:4px solid #B9B9B9;padding-right:1em;">
		                        <ul style="text-align: left;">     
		                               <li>
			                               <input  name="tag" style="width: 7em;"  value=""/>     
			                               <input  name="tag" style="width: 7em;"  value=""/>     
			                               <input  name="tag" style="width: 7em;"  value=""/>     
										</li>                    
			                            <li style="text-align:right;">
			                                <small><a class="add-tags-row" href="javascript:void(0)">Add more tags</a></small>
			                            </li>
		                         </ul>
		                         </div>
		                         <div style=";text-align: left;margin-left:6px;vertical-align:top;font-size:smaller;">
		                         	<span style="">Enter a letter,we may suggest some tags.At most 5 tags is allowed. Use English. All tags will be converted to lower case. Tag examples: "dfs", "gcj".
		                         	</span>
		                         </div>	
		                    	</div>	-->
		                    	<div style="text-align:center;"><span class="fielderror"></span></div>
		                    	<div style="text-align: center;margin-top: 12px;">
								<input class="" type="submit" value="Post" >
								<input class="" type="reset" value="Reset" >
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
		id : 'topic_content',
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

	
<script src="js/jquery-ui.min.js"></script>	
 <script type="text/javascript">
$(document).ready(function() {
        
        var cache = {},
		lastXhr;
        
    $("a.add-tags-row").click(function() {
        var currentLi = $(this).parent().parent();
        var li = $("<li></li>");
        var count = $("div.add-tags input").size();        
        if(count<5){
        	 var input1 = $("<input  style=\"width: 7em;\" name=\"tag" +  "\"/>");     
       		 input1.appendTo(li);
        	$("<span>&nbsp;</span>").appendTo(li);
        	li.insertBefore(currentLi);
        	for(;count<5;){
        	  var input2 = $("<input  style=\"width: 7em;\" name=\"tag" +  "\"/>");     
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
	
<script type="text/javascript">
$(document).ready(function() {
		
    var commentReplyFormSubmitListener = function() {

    	//KE.sync('topic_content');    	
    	//$('input[type=submit]', this).attr('disabled', 'disabled');

        var id = $(this).attr("id");
        var moduleId =	$(this).find("input[name=moduleId]").val();
        var parentId =	$(this).find("input[name=parentId]").val();
        var rootId =  $(this).find("input[name=rootId]").val();
     	var title = $(this).find("input[name=title1]").val();    	
        var content = $(this).find("textarea[name=content]").val();    
/*
		if(title ==''){
			//alert(data["error"]);
			$(".fielderror").html("Title shouldn't be empty.");
			return ;
		}
		if(content ==''){
			//alert(data["error"]);
			$(".fielderror").html("Content shouldn't be empty.");
			return ;
		}*/
        postNewCommentReply = function() {
            $.post(
                "postmessage",
                {type:"new",moduleId: moduleId, parentId: parentId, rootId: rootId, title: title, content: content},
                function(data) {    
                   if (data.success != true) {
                    //alert(data["error"]);
                    $(".fielderror").html(data.error);
                    //$('input[type=submit]', this).removeAttr('disabled');
                    return;
                  }	
               	   $('input[type=submit]', this).attr('disabled', 'disabled');
                   window.location.href="topic/"+data.messageId;
                  
                },
                "json"
            );
        };
        postNewCommentReply();
        return false;
    }
		
		var init = function() {
		
			 var e = $(".message-edit-box");   
	         $(".message-edit-box").find("form").submit(commentReplyFormSubmitListener);         
		}
		init();
		
});
</script>  
	
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
