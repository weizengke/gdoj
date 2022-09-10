<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		prettyPrint();
	});
</script>
<!-- Pop div -->
<div class="pop-div" id="pop-div" >
</div>
<div class="pop-inner-div" id="pop-inner-div">
	<p class="pop-div-note"></p>
	<p class="pop-div-content"></p>
	<div class="pop-div-source"></div>
	<div class="pop-div-judgelog"></div>
</div>
<!--End Pop div -->

<!-- Pop div -->
<div class="pop-standing-div" id="pop-standing-div" >
</div>
<div class="pop-standing-inner-div" id="pop-standing-inner-div">
	<p class="pop-standing-div-note"></p>
	<p class="pop-standing-div-content"></p>
	<div class="pop-standing-div-source"></div>
</div>
<!--End Pop div -->

<script type="text/javascript" src="js/status.js"></script>
<script language="JavaScript">
	$(document).ready(function() {
		OnlineJudge.statusReflesh();
	})
</script>