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
    <title>New News</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
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
	   <jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    <div class="topic">	
	     	<div>	
				<div class="comment round_0123 mail-edit-box mail-edit-box-pro" >
				  <form action="" method="post">	     																								
			  			<input  type="hidden" name="reply" value="0">							
						<div style="text-align:left;margin-bottom: 6px;">						
						Title:
						<input class="message-title" id="message-title" name="title1" maxlength="100">							
						<textarea class="message-content ke-editor" id="news-content" name="content" rows="20" ></textarea>
						orderNum:
						<input  id="news-top" name="orderNum1" maxlength="20" value="0">	
						Defunct:
						<select id="defunct"  style= "width:60px" name="defunct1">
							<option value="N" selected="selected">No</option>
							<option value="Y" >Yes</option>
						</select>
						</div>							
						<div style="text-align:center;" ><span class="fielderror"></span></div>
						<div style="text-align: center;margin-top: 12px;">
						<input class="button_submit" type="submit" value="<s:text name="topic.btn_post"/>" >
						</div>
					</form>     
	    		</div> 	
	    	</div>
	    </div>
	</div>
			<div class="clear"></div>

<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>
<script type="text/javascript">
$(document).ready(function() {
		var mailReplyFormSubmitListener = function() {
		var id = $(this).attr("id");    
     	var title = $(this).find("input[name=title1]").val();
        var content = $(this).find("textarea[name=content]").val();    
        var orderNum = $(this).find("input[name=orderNum1]").val();
        var defunct = $(this).find("select[name=defunct1]").val();
       
        postNewMailReply = function() {
            $.post(
                "postnews.do",
                {title: title, content: content, orderNum:orderNum ,defunct:defunct,type:"new"},
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
     </div>
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
