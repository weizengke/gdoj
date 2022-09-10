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
    <title>New Mail</title>
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
				<a href="mails"><s:text name="mails.recv"/></a>
				<a href="mails/send"><s:text name="mails.send"/></a>
				<a class="current" href="mails/new"><s:text name="mails.new"/></a>
				</div>
			<div class="topic">
				<div>
					  <div class="comment round_0123 mail-edit-box mail-edit-box-pro" style="position: relative;padding: 6px;">
						  <form action="" method="post">
							  <input  type="hidden" name="reply" value="0">
								<div style="text-align:left;margin-bottom: 6px;">
									<div>
										<input class="send-to-user" name="sendto" placeholder="<s:text name="mails.input_username"/>" value="<s:property value="username"/>">
									</div>
									<div>
										<input class="message-title" id="message-title" placeholder="<s:text name="mails.input_title"/>" name="title1" maxlength="100">
									</div>
									<textarea class="message-content ke-editor" id="meal-content" name="content" rows="20" ></textarea>
								</div>
								<div style="margin-top: 12px;">
									<input class="button_submit" type="Submit" value="<s:text name="mails.btn_send"/>" >
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
<script src="js/jquery-ui.min.js"></script>	
	<script>
	$(function() {
		var cache = {},
			lastXhr;
		$( ".send-to-user" ).autocomplete({
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

				lastXhr = $.getJSON( "ajaxUsers", {q:request.term} , function( data, status, xhr ) {
					cache[ term ] = data.users;
					if ( xhr === lastXhr ) {
						response( data.users );
					}
				});
			}
		});
	});
</script>

<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>

<script type="text/javascript">
$(document).ready(function() {  
	var mailReplyFormSubmitListener = function() {
		var id = $(this).attr("id");
		var sendto = $(this).find("input[name=sendto]").val();
        var reply =	$(this).find("input[name=reply]").val();     
     	var title = $(this).find("input[name=title1]").val();
        var content = $(this).find("textarea[name=content]").val();
        postNewMailReply = function() {
            $.post(
                "postmail",
                {toUser:sendto, reply:reply, title: title, content: content},
                function(data) {    
                   if (data.success != true) {
                     $(".fielderror").html(data.error);
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
		 var e = $(".mail-edit-box");   
         $(".mail-edit-box").find("form").submit(mailReplyFormSubmitListener);         
	}
	init();
  
});
</script>  
   </div>
  </body>
</html>
