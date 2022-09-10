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
    	<div class="content-with-sidebar round0123"  >  
		    <div id="nav-content" >	
				<a href="topic"><s:text name="topic"/></a>
				<a class="current" href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
	     	</div>
	    	<div class="topic">	
	     		<div>	
				  <div class="comment round_0123 message-edit-box message-edit-box-pro" style="position: relative;padding: 6px;">
				    <form action="" method="post">	     																								
			  			<input type="hidden" name="moduleId" value="0" >
						<input type="hidden" name="parentId" value="0">
						<input type="hidden" name="rootId" value="0">							
						<div style="text-align:left;margin-bottom: 6px;">
							<input class="message-title" id="message-title" name="title1" placeholder="<s:text name="topic.input_title"/>" maxlength="254">
							<textarea class="message-content ke-editor" id="topic_content" name="content" rows="20" ></textarea>
						</div>
						<div style="margin-top: 12px;">
							<input class="button_submit" type="submit" value="<s:text name="topic.btn_post"/>" >
							<span class="fielderror"></span>
						</div>
					 </form>     
		    		</div> 	
		    	</div>
	    	</div>
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include  page="/jsp/footer.jsp" ></jsp:include>

<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>

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
    	//KindEditor.sync('topic_content');
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

	</div>
  </body>
</html>
