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
    <title><s:text name="topic"/> - <s:property value="messagebean.title"/> - Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="<s:property value="messagebean.title"/> - <s:property value="messagebean.content_abstract"/>">
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
				
				<a href="topic/new" title=<s:text name="topic.new"/> ><s:text name="topic.new"/></a>
	     	</div>
		    <div class="topic">
				<div class="title"><h3><s:property value="messagebean.title"/></h3></div>
	<div class="topic_manage">		       
	<span class="link_author" style="color:grey;"><a href="profile/<s:property value="messagebean.author"/>" class="rated-user user-rate-<s:property value="messagebean.user.rate" default="0"/> user-tip" user="<s:property value="messagebean.author"/>"><s:property value="messagebean.author"/></a>  &nbsp;<s:text name="post"/><span  title="<s:date name="messagebean.in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>"><s:property value="messagebean.friendly_Date"/></span>			 	
	</span>
	
	<span class="link_view" title="<s:text name="topic.views"/>"><s:property value="messagebean.views"/> <s:text name="topic.views"/></span>
	<span class="link_comments" title="<s:text name="topic.reply"/>"><s:text name="topic.reply"/>(<s:property value="messagebean.comments"/>)</span>
	<span class="link_edit">
	<s:if test="#session.session_username==messagebean.author"><a href="topic/edit/<s:property value="messagebean.messageId"/>"><s:text name="topic.edit"/></a></s:if>
	</span>		
				</div>
				<div class="content">   
			       	<blockquote>
			      	<p><s:property value="messagebean.content" escapeHtml="false"/></p>
			        </blockquote>
			     </div>
			     
	<div class="topic-tools-box roundbox">
	<span class="tags">
	<s:iterator  value="tagsList" status="tagsst" >
	  <a href="search?word=<s:property />&type=topic" rel="tag" ><s:property /></a>
	</s:iterator>
	</span>
	
	<span class="topic-shareto"></span> 
	<!-- JiaThis Button BEGIN 
	<span id="ckepop" class="topic-share">	
		<a class="jiathis_button_qzone"></a>
		<a class="jiathis_button_tsina"></a>
		<a class="jiathis_button_tqq"></a>
		<a class="jiathis_button_renren"></a>
		<a class="jiathis_button_kaixin001"></a>
		<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
		<a class="jiathis_counter_style"></a>
	</span>
	<script type="text/javascript" src="http://v2.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
	 JiaThis Button END -->
		
		<span class="topic-vote">	
			<a href="#" class="topic-vote-up-<s:property value="messagebean.messageId"/>"><img style="vertical-align:middle;position:relative;top:-0.2em;" src="img/vote/voteup.png" alt="Vote: I like it" title="Vote: I like it"/></a>
			<s:if test="messagebean.votes>0">
			<span style="color:green;font-weight:bold;">
			+<s:property value="messagebean.votes"/>
			</span>
			</s:if><s:else>
			<span style="color:gray;font-weight:bold;">
			<s:property value="messagebean.votes"/>
			</span>
			</s:else>
			<a href="#" class="topic-vote-down-<s:property value="messagebean.messageId"/>"><img style="vertical-align:middle;position:relative;top:-0.2em;" src="img/vote/votedown.png" alt="Vote: I do not like it" title="Vote: I do not like it"/></a>
			
			
			<script type="text/javascript">
			        $(document).ready(function() {
			    $(".topic-vote-up-<s:property value="messagebean.messageId"/>").click(function() {
			        $.post("vote", {messageId: <s:property value="messagebean.messageId"/>, vote: +1}, function(data) {
			             if (data.success != true) {
			                alert(data["error"]);
			            }else{
			            	alert("Vote success.");
			            }
			        }, "json");
			        return false;
			    });
			    $(".topic-vote-down-<s:property value="messagebean.messageId"/>").click(function() {
			        $.post("vote", {messageId: <s:property value="messagebean.messageId"/>, vote: -1}, function(data) {
			             if (data.success != true) {
			                alert(data["error"]);
			            }else{
			            	alert("Vote success.");
			            }
			        }, "json");
			        return false;
			    });
			        });
			</script>	
		</span>
	</div>		     
	<br/>
	
			 <!-- Follow By -->
	 <s:if test="commentsList.size>0">
	 		  <div class=" roundbox">
						<div class="comments rtable">
							<ul id="ul-comments" style="">	
						 	  <s:iterator value="commentsList" status="st">				
								<s:if test="#st.index>0"><div style="height:1px;margin-bottom:10px;padding-bottom:10px;border-bottom:1px dashed #ddd;"></div></s:if>			 					
						 			<li >
						 				<s:if test="nodeID[#st.index]!=''">
							 				<div id=mc_<s:property value="message_id"/> class="comment" >
							 				
							 				<span style="float:left; width:40px;"><a href="profile/<s:property value="author"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="author"/>"><img style="width:32px;height:32px;margin:3px 0 0 5px;" src="<s:if test="avatar==\"Y\"">upload/userphoto/<s:property value="author"/>/</s:if><s:else>img/</s:else>photo.png"/></a></span>
							 				<div style="margin-left:50px;">
								 				<a href="profile/<s:property value="author"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="author"/>" name="rpl_<s:property value="messageId"/>"><s:property value="author" /></a> <span style="color:grey"><s:text name="post"/> <s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/></span> 
											<s:if test="#session.session_username!=null">
											<s:if test="#session.session_username!=author">
												<a href="javascript:ReplyInline(<s:property value="messageId"/>,<s:property value="rootId"/>)">回复此评论</a>
								 			</s:if>	
								 			</s:if>	
	<span commentid="<s:property value="messageId"/>" style="float:right;">
	<a href="#" class="vote-for-comment" voteDirection="1" dd="x"><img style="position:relative;top:3px;opacity:0.55;" src="img/vote/comment-voteup.png" alt="Vote: I like it" title="Vote: I like it"/></a>
	&nbsp;
	<s:if test="votes>0">
	<span style="color:green;font-weight:bold;">
	+<s:property value="votes"/>
	</span>
	</s:if><s:else>
	<span style="color:gray;font-weight:bold;">
	<s:property value="votes"/>
	</span>
	</s:else>
	&nbsp;
	<a href="#" class="vote-for-comment" voteDirection="-1" dd="y"><img style="position:relative;top:2px;opacity:0.55;" src="img/vote/comment-votedown.png" alt="Vote: I do not like it" title="Vote: I do not like it"/></a>
	</span>							 				
								 					 <p><s:property value="content" escapeHtml="false"/></p>
								 					 <div id="inline_reply_of_<s:property value='messageId'/>_<s:property value='rootId'/>" class='inline_reply'></div>
								 			</div>
											</div>
							 			<ul id=u<s:property value="nodeID[#st.index]"/>>
						 			</s:if><s:else>
							 			<div id=mc_<s:property value="messageId"/> class="comment">
							 			<span style="float:left; width:40px;"><a href="profile/<s:property value="author"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="author"/>"><img style="width:32px;height:32px;margin:3px 0 0 5px;" src="<s:if test="avatar==\"Y\"">upload/userphoto/<s:property value="author"/>/</s:if><s:else>img/</s:else>photo.png"/></a></span>
							 				<div style="margin-left:50px;">
								 				<a href="profile/<s:property value="author"/>" class="rated-user user-rate-<s:property value="user.rate" default="0"/> user-tip" user="<s:property value="author"/>" name="rpl_<s:property value="messageId"/>"><s:property value="author"/></a>
								 				 <span style="color:grey"> <s:text name="post"/> 
								 				   <span  title="<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>">
								 				    <s:property value="friendly_Date"/>
								 				   </span> 
								 				 </span>    
								 			<s:if test="#session.session_username!=null">
											<s:if test="#session.session_username!=author">
												<a href="javascript:ReplyInline(<s:property value="messageId"/>,<s:property value="rootId"/>)"><s:text name="reply_comment"/></a>
								 			</s:if>	
								 			</s:if>	
								 				<span commentid="<s:property value="messageId"/>" style="float:right;">
	<a href="#" class="vote-for-comment" voteDirection="1" dd="x"><img style="position:relative;top:3px;opacity:0.55;" src="img/vote/comment-voteup.png" alt="Vote: I like it" title="Vote: I like it"/></a>
	&nbsp;
	<s:if test="votes>0">
	<span style="color:green;font-weight:bold;">
	+<s:property value="votes"/>
	</span>
	</s:if><s:else>
	<span style="color:gray;font-weight:bold;">
	<s:property value="votes"/>
	</span>
	</s:else>
	&nbsp;
	<a href="#" class="vote-for-comment" voteDirection="-1" dd="y"><img style="position:relative;top:2px;opacity:0.55;" src="img/vote/comment-votedown.png" alt="Vote: I do not like it" title="Vote: I do not like it"/></a>
	</span>
								 				 <p><s:property value="content" escapeHtml="false"/></p>
								 				 <div id="inline_reply_of_<s:property value='messageId'/>_<s:property value='rootId'/>" class='inline_reply'></div>
											</div>
										</div>
						 			</s:else>
						 		<s:property value="prevUL[#st.index]" escapeHtml="false"/>
						 	</s:iterator>
							</ul>					
					 </div>
			      
			    </div> 
	<br/></s:if>	     	
		     <!-- Reply -->
		     	<div>
		     		  <b><s:text name="topic.your_reply"/>:</b> 	
			    	  <s:if test="#session.session_username!=null">  
					  <div class="comment reply-edit-box reply-edit-box-pro" style="position: relative;padding: 6px;">
					  <form action="" method="post">	     
							<s:token />
								<input  type="hidden" name="moduleId" value="0" >
								<input  type="hidden" name="parentId" value=<s:property value="messagebean.messageId"/>>
								<input  type="hidden" name="rootId"  value=<s:property value="messagebean.rootId" />>
								<div style="text-align:left;margin-bottom: 6px;">						
								<textarea class="message-content ke-editor"  id="reply-content" name="content" rows="10" ></textarea>
								</div>							
								<div style="text-align: left;">
								<input class="button_submit" type="submit" value="<s:text name="topic.btn_reply"/>">
								<input class="button_submit" type="reset" value="<s:text name="topic.btn_reset"/>" >
								<span class="fielderror"></span>
								</div>
						</form>     
		    		</div> 	
		    		<div id='inline_reply_editor' style='display: none;'>	    		
		    		<div class="comment inline-reply-edit-box" style="position: relative;padding: 6px;">
					  <form action="" method="post">	     
							<s:token />
								<input id="inline_moduleId" type="hidden" name="moduleId" value="0" >
								<input id="inline_parentId" type="hidden" name="parentId" value="0">
								<input id="inline_rootId" type="hidden" name="rootId"  value="0">
								<div style="text-align:left;">						
								<textarea class="message-content"  id="inline-reply-content" name="content" rows="10" onkeydown="if(event.ctrlKey&&event.keyCode==13){$('#form_inline_comment').submit();}"></textarea>
								</div>
								
								<div style="text-align: left;">
								<input class="button_submit" type="submit" value="<s:text name="topic.btn_reply"/>" id="btn_comment">
								<input class="button_submit" type="button" value="<s:text name="topic.btn_cancel"/>" id='btn_close_inline_reply'>
								<span class="inline-fielderror"></span>
								</div>
						</form>     
		    		</div>
		    		</div>
		    		</s:if>	 <s:else>
			    	<span class="reply"><a href="javascript:void(0)" class="<s:property value="message.message_id"/> <s:property value="message.parent_id"/> <s:property value="message.root_id"/>">Reply it before Login</a></span>
		    		</s:else>
		    	</div>	
		    </div>
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include  page="/jsp/footer.jsp" ></jsp:include>

<s:if test="#session.session_username!=null">
<script type='text/javascript' src='js/kindeditor/kindeditor-all.js' charset='utf-8'></script>
<script type='text/javascript' src='js/editor.js'></script>

<script type="text/javascript">
function ReplyInline(messageId,rootId){	
		$('.inline_reply').empty();		
		var div_id = '#inline_reply_of_'+messageId+'_'+rootId;
		$('#inline_parentId').val(messageId);
		$('#inline_rootId').val(rootId);
		$(div_id).html($('#inline_reply_editor').html());
		$('#txt_focus').focus();
		$('#btn_close_inline_reply').click(function(){
			$(div_id).empty();
		});
		
		var commentInlineReplyFormSubmitListener = function() {

		var id = $(this).attr("id");
        var moduleId =	$(this).find("input[name=moduleId]").val();
        var parentId =	$(this).find("input[name=parentId]").val();
        var rootId =  $(this).find("input[name=rootId]").val();
        var content = $(this).find("textarea[name=content]").val();  

        postNewCommentReply = function() {
            $.post(
                "postmessage",
                {type:"new",moduleId: moduleId, parentId: parentId, rootId: rootId, content: content},
                function(data) {    
                   if (data.success != true) {
                    $(".inline-fielderror").html(data["error"]);
                    $('#inline-reply-content').focus();	
                    return;
                  }	
                  
                  $('input[type=submit]', this).attr('disabled', 'disabled');
   				  location.reload();
                },
                "json"
            );
        };
        postNewCommentReply();
        return false;
    	}
		
		var init = function() {
	         var e = $(".inline-reply-edit-box");   
	         $(".inline-reply-edit-box").find("form").submit(commentInlineReplyFormSubmitListener);     
		}
		init();
	}

$(document).ready(function() {  				
		
		var commentReplyFormSubmitListener = function() {
			
		var id = $(this).attr("id");
        var moduleId =	$(this).find("input[name=moduleId]").val();
        var parentId =	$(this).find("input[name=parentId]").val();
        var rootId =  $(this).find("input[name=rootId]").val();
        var content = $(this).find("textarea[name=content]").val();  

        postNewCommentReply = function() {
            $.post(
                "postmessage",
                {type:"new",moduleId: moduleId, parentId: parentId, rootId: rootId, content: content},
                function(data) {    
                   if (data.success != true) {
                    $(".fielderror").html(data["error"]);
                     $("#reply-content").focus();	
                    return;
                  }	
                  
                  $('input[type=submit]', this).attr('disabled', 'disabled');
                  $('#btn_comment').attr('disabled', 'disabled');
                  location.reload();
                },
                "json"
            );
        };
        postNewCommentReply();
        return false;
    	}
		
		var init = function() {
		 	
			 var e = $(".reply-edit-box");   
	         $(".reply-edit-box").find("form").submit(commentReplyFormSubmitListener);     
		}
		init();
   
});
</script> 
</s:if>
<s:else>
<script type="text/javascript">	
$(document).ready(function() {
	 $(".reply a").click(function() {
	 		setUrlSession();
			window.location = "enter";
			 return false;
	}); 
});
</script>
</s:else>

<script type="text/javascript">	
$(document).ready(function() {
	 $(".vote-for-comment").click(function() {
        var messageId = $(this).parent().attr("commentid");
        var direction = $(this).attr("voteDirection");
        $.post("vote", {messageId: messageId, vote: direction}, function(data) {
            if (data.success != true) {
                alert(data["error"]);
            }else{
            	alert("Vote success.");
            }
        }, "json");
        return false;

    });
});
</script>
   </div>
  </body>
</html>
