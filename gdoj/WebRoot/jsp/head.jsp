<%@ page language="java" import="java.util.*,com.gdoj.bean.OJUtil" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-darkgray/tip-darkgray.css" type="text/css" />
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
		}
		else{
			int ret = OJUtil.doLogin(username, password);		
		}		
	}
}
%> 

<div id="site-header">
	<div class="headerNav ">
		<div class="ui menu ">
		<ul class="hleft">
			<li class="logo2">
				<span style="font-size: 19px;"><a href=""><b>Online Judge</b></a></span>
			</li>
			<li class="nav_menu">
				<a href="news" class="item"><s:text name="news" /></a>
			</li>
			<li class="nav_menu">
				<a href="topic" class="item"><s:text name="topic" /></a>
			</li>
			<li class="t_c_problemset nav_menu">
				<a href="problemset" class="item"><s:text name="problemset" /><span class="caret"></span></a>
				<ul class="t_c_box t_c1_box t_c_problemset__box" style="display: none;">
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
			<li class="t_c_contests nav_menu">
				<a href="contests" class="item"><s:text name="contests" /><span class="caret"></span></a>
				<ul class="t_c_box t_c1_box t_c_contests_box" style="display: none;">
					<li>
						<a href="contests"><s:text name="contests" /></a><br />
					</li>
					<li>
						<a href="contest/recent"><s:text name="recent-contest" /></a>
					</li>
				</ul>
			</li>
			<li class="t_c_faq nav_menu">
				<a href="topic/9" class="item"><s:text name="faq" /></a>
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
				<li class="nav_menu">
					<a href="enter" class="enter item"><s:text name="login" /></a>
				</li>
				<li class="nav_menu">
					<a href="registration" class="register item"><s:text name="register" /></a>
				</li>
			</s:if>
			<s:else>
				<li class="t_c_mail rightmenu nav_menu">
					<a href="mails" class="item"><img id="mails_nav" class="mail" src="img/mail.png" onmouseover="this.src='img/mail_on.png'" onmouseout="this.src='img/mail.png'" /></a>
					<ul class="t_c_box t_c2_box t_c_mail_box" style="display: none;">
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
				<li class="t_cprofile rightmenu nav_menu">
					<a href="profile/<s:property value="#session.session_username"/>" class="item">
					<s:property value="#session.session_username" /><span class="caret"></span></a>
					<ul class="t_c_box t_c3_box t_cprofile_box" style="display: none;">
						<li>
							<a href="profile/<s:property value="#session.session_username"/>"><s:text name="profile" /></a>
						</li>
						<li>
							<a href="settings"><s:text name="settings" /></a>
						</li>
						<li>
							<a href="logout"><s:text name="logout" /></a>
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
	$(".t_c_contests").mouseover(function(){$(".t_c_contests_box").show();});
    $(".t_c_contests").mouseout(function(){$(".t_c_contests_box").hide();});
    //$(".t_c_tools").mouseover(function(){$(".t_ctools_box").show();});
    //$(".t_c_tools").mouseout(function(){$(".t_ctools_box").hide();});
});
</script>
<s:if test="#session.session_username==null">   
</s:if> 
<s:else>	
<script type="text/javascript">
function updateMails(seconds, count){
	/* 一分钟查一次 */
	if (0 == seconds%60){
		$.post(
		    "new-mail-count",              
		    function(json) {    
		        if (json.success == true) {   
		        	count = json.nCount;   
		        	$(".new-mail-count").html("("+count+")");         
		        }	
		    },
	    	"json"
		);
		
		seconds = 1;
	}
	
    if (count>0){
        /* 每秒交替闪烁 */
        if (0 == seconds%2){
   			$("#mails_nav").attr('src', 'img/mail_unread.png');
	   	}
	   	else{
	   		$("#mails_nav").attr('src', 'img/mail.png');
	   	}
    }
	
	setTimeout(function(){updateMails(seconds + 1, count);}, 1000);
}
$(document).ready(function() {
	updateMails(0);
})

</script>
<script type="text/javascript">
$(document).ready(function() {
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
	$(".t_c_mail").mouseover(function(){$(".t_c_mail_box").show();});
	$(".t_c_mail").mouseout(function(){$(".t_c_mail_box").hide();});
});
</script>
</s:else>

<div class="fixed-notice-messages">
</div>
