<%@ page language="java" import="java.util.*,com.gdoj.bean.OJUtil" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-whitesimple/tip-whitesimple.css" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/poshytip/jquery.poshytip.js"></script>

<%
if (null == session.getAttribute("session_username")){
	Cookie[] cookies = request.getCookies();
	String username = "1";
	String password = "1";
	if(cookies != null && cookies.length > 0){
		for(Cookie cookie:cookies){
			String cookieName = cookie.getName();
			if("cookieOnlineJudgeUsername".equals(cookieName)){
				String val = cookie.getValue();
				username = val;				
			}
			if("cookieOnlineJudgePassword".equals(cookieName)){
				String val = cookie.getValue();
				password = val;				
			}
		}
		if ("1".equals(username) || "1".equals(password)){
		}else{
			int ret = OJUtil.doLogin(username, password);		
		}		
	}
}
%> 
<style>

</style>

<div id="header-navbar" class="navbar navbar-fixed-top">
	<div class="headerNav ">
		<div class="ui menu ">
		<ul class="hleft">
			<li class="logo2">
				<span style="font-size: 19px;">
					<a href="">
						<b><span></span>HappyOJ.com</b>
					</a>
				</span>
			</li>
			<!--
			<li class="nav_menu">
				<a href="news" class="item"><s:text name="news" /></a>
			</li>
			 -->
			<li class=" nav_menu">
				<a href="problemset" class="item"><s:text name="problems" /></a>
			</li>
			<li class=" nav_menu">
				<a href="problemset/status" class="item"><s:text name="status" /></a>
			</li>
			<li class=" nav_menu">
				<a href="problemset/standings" class="item"><s:text name="standings" /></a>
			</li>
			<li class="t_c_contests nav_menu">
				<a href="contests" class="item"><s:text name="contests" /></a>
			</li>
			<li class="nav_menu">
				<a href="topic" class="item"><s:text name="topic" /></a>
			</li>
			<li class="t_c_faq nav_menu">
				<a href="topic/9" class="item"><s:text name="faq" /></a>
			</li>

			<li class="searchbox">
				<div class="searchTool">
					<form method="get" action="search" name="headSearchForm" id="headSearchForm">
						<input class="txtSearch" id="headq" name="word" type="text" value="<s:property value="word"/>"
							placeholder="<s:text name="search"/>..." x-webkit-speech />
					</form>
				</div>
			</li>
		</ul>
		<ul class="hright">
			<s:if test="#session.session_username==null">
				<li class="nav_menu">
					<a href="enter" class="enter item"><s:text name="login" /></a>
				</li>
				<li class="nav_menu" style="margin:0 12px 16px 0;">
					<a href="registration" class="register item"><s:text name="register" /></a>
				</li>
			</s:if>
			<s:else>
				<li class="t_c_mail rightmenu nav_menu">
					<a href="mails" class="item"><img id="mails_nav" class="mail" src="img/mail.png" onmouseover="this.src='img/mail.png'" onmouseout="this.src='img/mail.png'" /></a>
					<ul class="t_c_box mail_box t_c_mail_box" style="display: none;">
						<li>
							<a href="mails"><s:text name="mails.recv"/><span title="new mails" class="new-mail-count">(0)</span></a>
						</li>
						<li>
							<a href="mails/send"><s:text name="mails.send"/></a>
						</li>
						<li>
							<a href="mails/new"><s:text name="mails.new"/></a>
						</li>
					</ul>
				</li>

				<li class="t_cprofile rightmenu nav_menu" style="margin:0;padding:0;">
					<a href="profile/<s:property value="#session.session_username"/>" class="item" style="margin:0;padding:3px 8px 0px 8px;">
						<img class="mail" style="width:34px;height:34px;margin:0;padding:0;" src="<s:if test="#session.session_avatar==\"Y\"">upload/userphoto/<s:property value="#session.session_username"/>/</s:if><s:else>img/</s:else>photo.png"" alt='<s:property value="#session.session_username"/>'>
						<span class="caret" style="margin:0 12px 16px 0;"></span>
					</a>
					<ul class="t_c_box profile_box t_cprofile_box" style="display: none;">
						<li>
							<a class="profile-item profile-home" href="profile/<s:property value="#session.session_username"/>"><s:text name="profile"/></a>
						</li>
						<li>
							<a class="profile-item profile-setting" href="settings"><s:text name="settings" /></a>
						</li>
						<li>
							<a class="profile-item profile-logout" href="logout"><s:text name="logout" /></a>
						</li>
					</ul>
				</li>
			</s:else>
		</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
 $(function(){
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
	$(".t_c_contests").mouseover(function(){$(".t_c_contests_box").show();});
    $(".t_c_contests").mouseout(function(){$(".t_c_contests_box").hide();});
});
</script>
<s:if test="#session.session_username==null">   
</s:if> 
<s:else>	
<script type="text/javascript">
$(function(){
	$(".t_cprofile").mouseover(function(){$(".t_cprofile_box").show();});
	$(".t_cprofile").mouseout(function(){$(".t_cprofile_box").hide();});
	$(".t_c_mail").mouseover(function(){$(".t_c_mail_box").show();});
	$(".t_c_mail").mouseout(function(){$(".t_c_mail_box").hide();});
});

$(document).ready(function() {
	OnlineJudge.updateMails(0);
	OnlineJudge.ping();
})
</script>
</s:else>