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
    <title>Edit Topic <s:property value="message.title"/></title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
	<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="js/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript">
	  $(document).ready(function() {
		  prettyPrint();
	  });
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
    	<div class="content-with-sidebar round0123"  >     
		    <div id="nav-content" >
	     		<a class="current" href="topic"><s:text name="topic"/></a>
				<a href="topic/new" ><s:text name="topic.new"/></a>  	
	     	</div>
		    <div class="topic">	
		     	<div>	
					  <div class="comment message-edit-box message-edit-box-pro" style="position: relative;padding: 6px;">
					  <form action="" method="post">	     																								
					  			<input type="hidden" name="messageId" value="<s:property value="message.message_id"/>" >						
								<div style="text-align:left;margin-bottom: 6px;">
								<input class="message-title" id="message-title" name="title1" maxlength="50" value="<s:property value="message.title"/>">
								
								<textarea class="message-content ke-editor" id="edit-topic-content" name="content" rows="20" ><s:property value="message.content"/></textarea>
					
								
			<!--  					<div class="add-tags" style="text-align:left;">
							<div style="float: left;width:420px;border-right:4px solid #B9B9B9;padding-right:1em;">
	                        <ul style="text-align: left;">     
	                               <li>
		                               <s:if test="tagCount==0"><input  name="tag" style="width: 7em;"  value=""/></s:if>         
		                               <s:iterator value="tagsList" status="st"> 
												<input  name="tag" style="width: 7em;"  value="<s:property />"/>									
										</s:iterator> 
									</li>                              
		                            <li style="text-align:right;">
		                                <small><a class="add-tags-row" href="javascript:void(0)">Add tag</a></small>
		                            </li>
	                         </ul>
	                         </div>
	                         <div style=";text-align: left;margin-left:1em;vertical-align:top;font-size:smaller;">
	                         	<span style="">Enter a letter,we may suggest some tags.At most 5 tags is allowed. Use English. All tags will be converted to lower case. Tag examples: "dfs", "gcj".
	                         	</span>
	                         </div>	
	                    	</div>	-->	
								<div style="text-align:center;"></div>
									<div style="margin-top: 12px;">
									<input class="button_submit" type="Submit" value="<s:text name="topic.btn_post"/>">
									<span class="fielderror"></span>
								</div>
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
        if(count++<5){
        	 var input1 = $("<input  style=\"width: 7em;\" name=\"tag" + "\"/>");     
       		 input1.appendTo(li);
        	$("<span>&nbsp;</span>").appendTo(li);
        	li.insertBefore(currentLi);
        	for(;count<5;){
        	  var input2 = $("<input  style=\"width: 7em;\" name=\"tag" +  "\"/>");     
       		  input2.appendTo(li);
        	 $("<span>&nbsp;</span>").appendTo(li);
        	 li.insertBefore(currentLi);
        	 count++;
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
      
   		
    	//$('input[type=submit]', this).attr('disabled', 'disabled');

        var id = $(this).attr("id");
        var messageId =	$(this).find("input[name=messageId]").val();
     	var title = $(this).find("input[name=title1]").val();    	
        var content = $(this).find("textarea[name=content]").val();   
        
        postNewCommentReply = function() {
            $.post(
                "postmessage",
                {type:"edit",messageId: messageId,title: title, content: content},
                function(data) {    
                   if (data.success != true) {
                    //alert(data["error"]);
                    $(".fielderror").html(data.error);
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
