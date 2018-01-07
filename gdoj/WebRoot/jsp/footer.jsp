<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <div id="footer">
    Copyright &copy; 2011-2018 <a href="http://debugforces.com" style="text-decoration: none;" target="_blank">weizengke</a>. All Rights Reserved.<br>
	The Programming Contest Web 1.2 platform & Judge Kernel V100R001C00B060 version.
</div>
<script type="text/javascript">
$(document).ready(function() {	
     OnlineJudge.saveUrl();     
     scrolltotop.offset(100,120);
	 scrolltotop.init();
	 
	$(function(){	
		$(".user-tip").poshytip({	
			className: 'tip-yellowsimple',		
			alignTo: 'target',		
			alignX: 'right',
			alignY: 'bottom',
			offsetX: 5,
			offsetY: -25,			
			content: function(updateCallback) {
				$.post("userInfo.action", { username:$(this).attr('user')} ,function(data){
				updateCallback(data);	
				});
				return "Loading...";		
			}
		});	
	});	
});
</script>