<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-darkgray/tip-darkgray.css" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/poshytip/jquery.poshytip.js"></script>

<div id="site-header">
	<div class="headerNav ">
		<ul class="hleft">
			<li class="logo2">
				<span style="font-size: 19px;"><a href=""><b>Online Judge</b></a></span>
			</li>
			<li>
				<a href="news"><s:text name="news" /></a>
			</li>
			<li>
				<a href="topic"><s:text name="topic" /></a>
			</li>
			<li class="t_c_problemset">
				<a href="problemset"><s:text name="problemset" /><span class="caret"></span></a>
				<ul class="t_c1_box t_c_problemset__box" style="display: none;">
					<li>
						<a href="problemset"><s:text name="problems" /></a><br />
					</li>
					<li>
						<a href="problemset/status"><s:text name="status" /></a><br />
					</li>
					<li>
						<a href="problemset/standings"><s:text name="standings" /></a>
					</li>
				</ul>
			</li>
			<li class="t_c_contests">
				<a href="contests"><s:text name="contests" /><span class="caret"></span></a>
				<ul class="t_c1_box t_c_contests_box" style="display: none;">
					<li>
						<a href="contests"><s:text name="contests" /></a><br />
					</li>
					<li>
						<a href="contest/recent"><s:text name="recent-contest" /></a>
					</li>
				</ul>
			</li>
			<li class="t_c_faq">
				<a href="topic/9"><s:text name="faq" /></a>
			</li>
			<li class="sweibo">
				<div class="searchTool">
					<form method="get" action="search" name="headSearchForm" id="headSearchForm">
						<input class="txtSearch" id="headq" name="word" type="text" value="<s:property value="word"/>"
							placeholder="<s:text name="search"/>..." x-webkit-speech />
						<div class="btnSearch">
							<a href="javascript:document:headSearchForm.submit();"><span class="lbl"></span></a>
						</div>
					</form>
				</div>
			</li>
		</ul>
		<ul class="hright">
			<s:if test="#session.session_username==null">
				<li>
					<a href="enter" class="enter"><s:text name="login" /></a>
				</li>
				<li>
					<a href="registration" class="register"><s:text name="register" /></a>
				</li>
			</s:if>
			<s:else>
				<li class="t_cprofile">
					<a href="profile/<s:property value="#session.session_username"/>"><s:property
							value="#session.session_username" /><span class="caret"></span></a>
					<ul class="t_c2_box t_cprofile_box" style="display: none;">
						<li>
							<a href="profile/<s:property value="#session.session_username"/>"><s:text name="account" /></a>
						</li>
						<li>
							<a href="settings"><s:text name="settings" /></a>
						</li>
					</ul>
				</li>
				<li class="t_c_mail">
					<a href="mails"><s:text name="mails" /></a>
					<ul class="t_c3_box t_c_mail_box" style="display: none;">
						<li>
							<a href="mails"><span title="new mails" class="new-mail-count">(0)</span></a>
						</li>
					</ul>
				</li>
				<li>
					<a href="logout" class="logout"><s:text name="logout" /></a>
				</li>
			</s:else>
			<li class="locale">
				<a href="#" class="locale-zh" title="Chinese"><img src="img/flag/cn.png" /></a>
				<a href="#" class="locale-en" title="English"><img src="img/flag/gb.png" /></a>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
 $(function(){
	 $("a.enter").click(function() {
	 		setUrlSession();
			window.location = "enter";
			 return false;
	}); 
	 $("a.logout").click(function() {
	 		setUrlSession();
			window.location = "logout";
			 return false;
	}); 
	$("a.locale-en").click(function() {
		 $.post(
                "locale.action",
                {lang: "en"},
                function(data) {    
                   if (data.success != true) {
                    alert(data["success"]);
                    return;
                  }	
                  window.location.reload();
                },
                "json"
            );
            return false;
	});
	$("a.locale-zh").click(function() {
		 $.post(
                "locale.action",
                {lang: "zh"},
                function(data) {    
                   if (data.success != true) {
                    alert(data["success"]);
                    return;
                  }	
                  window.location.reload();
                },
                "json"
            );
            return false;
	});
});
</script>
<script type="text/javascript">
$(function(){
	$(".t_c_problemset").mouseover(function(){$(".t_c_problemset__box").show();});
	$(".t_c_problemset").mouseout(function(){$(".t_c_problemset__box").hide();});
	$(".t_c_contests").mouseover(function(){$(".t_c_contests_box").show();$});
    $(".t_c_contests").mouseout(function(){$(".t_c_contests_box").hide();});
});
</script>
<s:if test="#session.session_username==null">   
</s:if> 
<s:else>	
<script type="text/javascript">
$(document).ready(function() {
		$.post(
                "new-mail-count",              
                function(json) {    
                   if (json.success != true) {                  
                    return;
                  }	                 
	              $(".new-mail-count").html("("+json.nCount+")");
	              if(json.nCount>0){
	              	$(".t_c_mail_box").show();
	              }	          	 									
                },
                "json"
          );

	    var count = 0;
        window.setInterval(function() {
            if (count < 10) {
                count++;
                $(document).ready(function() {
					$.post(
			                "ping",              
			                function(json) {    
			                   if (json.success != true) {                  
			                    return;
			                  }	             	 									
			                },
			                "json"
			          );
				}); 
				
				var millis = new Date().getTime()
				OnlineJudge.setCookie("lastOnlineTimeUpdaterInvocation", millis);
            }        
        }, 60000);
});
</script>
<script type="text/javascript">
$(function(){
	$(".t_cprofile").mouseover(function(){$(".t_cprofile_box").show();});
	$(".t_cprofile").mouseout(function(){$(".t_cprofile_box").hide();});
});
</script>
</s:else>