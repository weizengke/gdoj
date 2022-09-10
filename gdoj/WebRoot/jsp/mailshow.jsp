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
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
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
						<p><s:property value="mail.content" escapeHtml="false"/></p>
						</blockquote>
					 </div>
					 <!-- Reply -->
					<div>
						   <b><s:text name="mails.your_reply"/>:</b>
						  <div class="round_0123 reply-edit-box reply-edit-box-pro" style="position: relative;padding: 6px;">
						  <form action="" method="post">
								<input type="hidden" name="sendto" value="<s:property value="mail.from_user"/>">
								<input type="hidden" name="reply" value="<s:property value="mail.mail_id"/>">
								<div style="text-align:left;margin-bottom: 6px;">
									<input class="message-title" id="message-title" name="title1" placeholder="<s:text name="mails.input_title"/>" value="Re:<s:property value="mail.title"/>">
									<textarea class="message-content ke-editor" id="mail-content" name="content" rows="10" ></textarea>
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
	</div>

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

  </body>
</html>
