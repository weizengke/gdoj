<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <div id="footer">
	<div>
    Copyright &copy; 2011-2021 <a href="#" style="text-decoration: none;" target="_blank">weizengke</a>. All Rights Reserved.<br>
	The Programming Contest Web 1.7 platform & Judge Kernel v1.1.280 version.<br>
	<a href="admin" title="administrator">Admin</a>&nbsp;|
	<a href="#" class="locale-zh" title="Chinese">中文</a>&nbsp;|
	<a href="#" class="locale-en" title="English">English</a><br>
	</div>
	<div style="text-align:left;">
		<s:text name="sidebar.onlineusers" />(<span class="user-sum">0</span>)
	</div>
	<div class="sidebar-online-users" style="text-align:left;padding: 6px;"></div>

</div>
<script type="text/javascript" src="js/scrolltotop.js"></script>
<script type="text/javascript">
$(document).ready(function() {
     scrolltotop.offset(100,120);
	 scrolltotop.init();
     OnlineJudge.saveUrl();
	 OnlineJudge.onlineUsers();
	 OnlineJudge.userTip();
});
</script>