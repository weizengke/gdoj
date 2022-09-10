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
   			 <div  class="content-with-sidebar round0123"  >
	   <jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
	    <div class="topic">	
	     	<div>	
				  <div class="comment round_0123 mail-edit-box mail-edit-box-pro" >
				  <form action="" method="post">	     																								
			  			<input type="hidden" name="newsId" value="<s:property value="news.news_id"/>" >						
						<div style="text-align:left;margin-bottom: 6px;">
							Title:
							<input class="message-title" id="message-title" name="title1" maxlength="100" value="<s:property value="news.title"/>">
							
							<textarea class="message-content ke-editor" id="news-content" name="content" rows="20" ><s:property value="news.content"/></textarea>
							orderNum:
							<input  id="news-top" name="orderNum1"  value="<s:property value="news.orderNum"/>">	
							Defunct:
							<select id="defunct"  style= "width:60px" name="defunct1">
								<option value="N" <s:if test="news.defunct==\"N\"">selected="selected"</s:if>>No</option>
								<option value="Y" <s:if test="news.defunct==\"Y\"">selected="selected"</s:if>>Yes</option>
							</select>
							<div style="text-align:center;" ><span class="fielderror"></span></div>
							<div style="text-align: center;margin-top: 12px;">
								<input class="button_submit" type="submit" value="<s:text name="topic.btn_post"/>" >
							</div>
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
    </div>
      <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
   </div>
  </body>
</html>
