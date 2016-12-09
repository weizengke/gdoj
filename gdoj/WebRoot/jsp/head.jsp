<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>js/poshytip/tip-darkgray/tip-darkgray.css" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/poshytip/jquery.poshytip.js"></script>

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

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-32530365-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<div id="site-header">
	<div class="headerNav ">
	<script type="text/javascript">
$(document).ready(function(){
//$(".t_c1").mouseover(function(){$(".t_c1_box").show();$(".t_c1").addClass("on");});
//$(".t_c1").mouseout(function(){$(".t_c1_box").hide();$(".t_c1").removeClass("on");});

});
</script>
		<ul class="hleft">
			<li class="logo2"><span style="font-size:19px;"><a href="" ><b>Online Judge</b></a></span></li>
			<!--  <li class="t_conlinejudge"> <a href="home" ><s:text name="home"/></a></li>	-->
			<li><a href="news"><s:text name="news"/></a></li>		  
			<li><a href="topic"><s:text name="topic"/></a></li>			
		<script type="text/javascript">
		$(function(){
			$(".t_c_problemset").mouseover(function(){$(".t_c_problemset__box").show();});
			$(".t_c_problemset").mouseout(function(){$(".t_c_problemset__box").hide();});
			$(".t_c_contests").mouseover(function(){$(".t_c_contests_box").show();$});
           $(".t_c_contests").mouseout(function(){$(".t_c_contests_box").hide();});
		});
		</script>
			
			<li class="t_c_problemset"><a href="problemset"><s:text name="problemset"/><img src="img/t_c_bg.gif"/></a>
				<ul class="t_c1_box t_c_problemset__box" style="display:none;">
					<li><a href="problemset"><s:text name="problems"/></a><br/></li>
					<li><a href="problemset/status"><s:text name="status"/></a><br/></li>
					<li> <a href="problemset/standings"><s:text name="standings"/></a></li>
				</ul>
			</li>
            <li class="t_c_contests"><a href="contests" ><s:text name="contests"/><img src="img/t_c_bg.gif"/></a>
           		 <ul class="t_c1_box t_c_contests_box" style="display:none;">
					<li><a href="contests"><s:text name="contests"/></a><br/></li>
					<li><a href="contest/recent"><s:text name="recent-contest"/></a></li>
				 </ul> 
            </li>
            <li class="t_c_search"><a href="search" ><s:text name="search"/></a></li>
            <li class="t_c_faq"><a href="topic/9"><s:text name="faq"/></a></li>        
<!--            <li><a href="problemset/standings"><s:text name="standings"/></a></li>-->
 <!-- 			<li class="sweibo">
			    <div class="searchTool">
		          <form method="get" action="#" name="headSearchForm" id="headSearchForm" onsubmit="return headDoSearch();">
		            <input id="headSearchType" name="searchType" type="hidden" value="userSearch">
		            <div class="selSearch">
		              <div class="nowSearch" id="headSlected" onclick="if(document.getElementById('headSel').style.display=='none'){document.getElementById('headSel').style.display='block';}else {document.getElementById('headSel').style.display='none';};return false;" onmouseout="drop_mouseout('head');">用户</div>
		              <div class="btnSel"><a href="#" onclick="if(document.getElementById('headSel').style.display=='none'){document.getElementById('headSel').style.display='block';}else {document.getElementById('headSel').style.display='none';};return false;" onmouseout="drop_mouseout('head');"></a></div>
		              <div class="clear"></div>
		              <ul class="selOption" id="headSel" style="display:none;">
		                <li><a href="#" onclick="return search_show('head','userSearch',this)" onmouseover="drop_mouseover('head');" onmouseout="drop_mouseout('head');">用户</a></li>
		                <li><a href="#" onclick="return search_show('head','tagSearch',this)" onmouseover="drop_mouseover('head');" onmouseout="drop_mouseout('head');">话题</a></li>
						<li><a href="#" onclick="return search_show('head','topicSearch',this)" onmouseover="drop_mouseover('head');" onmouseout="drop_mouseout('head');">微博</a></li>
							<li>
								<a href="#" onclick="return search_show('head','voteSearch',this)" onmouseover="drop_mouseover('head');" onmouseout="drop_mouseout('head');">投票</a>					</li>	
		              </ul>
		            </div>
		            <input class="txtSearch" id="headq" name="headSearchValue" type="text" x-webkit-speech/>
		            <div class="btnSearch"> <a href="#" onclick="javascript:return headDoSearch();"><span class="lbl"></span></a></div>
		          </form>
		        </div>
			  	</li>   
 	 -->		  	  
		</ul>

		<ul class="hright">
		     
		         <s:if test="#session.session_username==null">    	  
				  
				  <li><a href="enter" class="enter"><s:text name="login"/></a></li>
				  <li><a href="registration" class="register"><s:text name="register"/></a> </li>
				  </s:if><s:else>		
				 <script type="text/javascript">
					$(function(){
						$(".t_cprofile").mouseover(function(){$(".t_cprofile_box").show();});
						$(".t_cprofile").mouseout(function(){$(".t_cprofile_box").hide();});
					//	$(".t_c2").mouseover(function(){$(".t_c2_box").show();$(".t_c2").addClass("on");});
			       //    $(".t_c2").mouseout(function(){$(".t_c2_box").hide();$(".t_c2").removeClass("on");}); <img src='img/mail_new.gif'/>
					});
					</script>
				  <li class="t_cprofile" > <a href="profile/<s:property value="#session.session_username"/>"><s:property value="#session.session_username"/><img src="img/t_c_bg.gif"/></a>
				  	<ul class="t_c2_box t_cprofile_box" style="display:none;">
				  		<li><a href="profile/<s:property value="#session.session_username"/>"><s:text name="account"/></a></li>
				  		<li><a href="settings"><s:text name="settings"/></a></li>				  		
				  	</ul>
				  </li>	
				  <li class="t_c_mail"><a href="mails" ><s:text name="mails"/></a>
				  <ul class="t_c3_box t_c_mail_box" style="display:none;">					
					 <li><a href="mails"><span title="new mails" class="new-mail-count" >(0)</span></a></li>
				 </ul> 
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
          /*
	 var count = 0;
        function getDelay() {
            var delay = 0;
            var last = OnlineJudge.getCookie("lastOnlineTimeUpdaterInvocation");
            if (last && last != null) {
                var period = count < 20 ? 180 * 1000 : 360 * 1000;
                delay = period - (new Date().getTime() - last);
                if (delay < 0)
                    delay = 0;
            }
            //alert(last+" "+delay+" "+count);
            return delay;
        }
        window.setInterval(function() {
            if (getDelay() <= 0 && count < 120) {
                count++;
                OnlineJudge.ping("onlineUsers");  
            }

        }, 5000);
			*/
});
</script>
				  <li><a href="logout" class="logout"><s:text name="logout"/></a></li> 
				  </s:else>
				<li class="locale">
					<a href="#" class="locale-zh" title="Chinese"><img src="img/flag/cn.png" /></a><a href="#" class="locale-en" title="English"><img src="img/flag/gb.png" /></a>
				</li>	
		</ul>
	</div>
</div>


