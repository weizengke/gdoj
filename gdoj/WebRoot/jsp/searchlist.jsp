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
    <title><s:text name="search"/> <s:property value="word"/></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>	
  	<script type="text/javascript">
$(document).ready(function() {
	 $("#s_type u").bind("click",function(){
	 	$("#t").attr("value",$(this).attr("rel")),
	 	$("#s_type u.curr").removeClass("curr"),
	 	$(this).addClass("curr")
	 	}
	 )
  }
);
	</script>

  </head>

  <body>  
  	<jsp:include   page="/jsp/head.jsp"></jsp:include> 
  	<div id="body">
		
		 <div id="search_main">		 
			   <p id="s_type">
			    <u rel="all" <s:if test="type==\"all\"">class="curr"</s:if><s:elseif test="type==null">class="curr"</s:elseif>><s:text name="all"/></u>
			    <u rel="user" <s:if test="type==\"user\"">class="curr"</s:if>><s:text name="user"/></u>
			    <u rel="problem" <s:if test="type==\"problem\"">class="curr"</s:if>><s:text name="problem"/></u>
			    <u rel="topic" <s:if test="type==\"topic\"">class="curr"</s:if>><s:text name="topic"/></u>
			   
			   </p>
			  <form action="search" method="get">
			    <p>
			      <input name="word" id="q" value="<s:property value="word"/>" maxlength="100" placeholder="Input keyword to search" />
			      <input type="submit" id="sm" value="<s:text name="search"/>" />
			    </p>
<!--			    <p><span class="fielderror"><s:fielderror ><s:param>word</s:param></s:fielderror></span></p>			   -->
			    <input type="hidden" value="<s:property value="type"/>" id="t" name="type" /> 
			  </form>
<!-- 		  <div id="hot_word">
			    <h3><s:text name="search.hot"/></h3>
			    <p>
			          <a style="font-size: 2.85341906317594em; padding: 10px 5px;" href="search?word=蓝桥杯">蓝桥杯</a>
			          <a style="font-size: 1.18600584606848em; padding: 10px 5px;" href="search?word=BFS">BFS</a>
			          <a style="font-size: 2.56199266968736em; padding: 10px 5px;" href="search?word=DFS">DFS</a>
			          <a style="font-size: 2.01885347027966em; padding: 10px 5px;" href="search?word=C%2B%2B">C++</a>
			          <a style="font-size: 1.237016215005em; padding: 10px 5px;" href="search?word=java">java</a>
			          <a style="font-size: 2.76587364077976em; padding: 10px 5px;" href="search?word=OJ">OJ</a>
			          <a style="font-size: 1.12926335370855em; padding: 10px 5px;" href="search?word=ACM">ACM</a>
			          <a style="font-size: 2.03834251586714em; padding: 10px 5px;" href="search?word=大数">大数</a>
			          <a style="font-size: 1.53834251586714em; padding: 10px 5px;" href="search?word=big number">Big Number</a>
			          <a style="font-size: 1.21114683502658em; padding: 10px 5px;" href="search?word=MFC">MFC</a>
			          <a style="font-size: 1.68459280846329em; padding: 10px 5px;" href="search?word=MySQL">MySQL</a>
			          <a style="font-size: 1.0em; padding: 10px 5px;" href="search?word=ACSolo">ACSolo</a>
			          <a style="font-size: 1.65494809187829em; padding: 10px 5px;" href="search?word=SQL">SQL</a>
			          <a style="font-size: 1.48563885162019em; padding: 10px 5px;" href="search?word=Online Judge">Online Judge</a>
			          <a style="font-size: 1.55937239010046em; padding: 10px 5px;" href="search?word=vc">vc</a>
			    </p>
  			</div> -->	
	   </div>				
	       
      <div id="content" style="width: 780px;margin: 0 auto;"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >  
	     	
     	</div>	
     	<div>
     		<s:if test="word!=null">
	     		<s:if test="size==0"><s:text name="search.noresult"/></s:if>	     		
	     	</s:if>
	    </div>
     	<s:if test="userList.size!=0">	
     	<!-- Users -->
     	 <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="users"/> (<s:property value="userList.size"/>)</div>
				<div class="right"></div>
			</div> 		
			<br/>   
			<div class="innertable ">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>
				<table class="standings">
					 <tr class="header" style="">  
		               	 <th  class="rank left-item">#</th>
		               	 <th  class="coder">
			               	 <div style="float:left;">
			               	 <s:text name="author"/>
			               	 </div>
		               		 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            			<s:property value="nickname"/>
	            			</div>
		               	 </th>
		               	 <th  class="school"><s:text name="school"/></th>
		                 <th  class="solved" > <s:text name="solved"/></th>
		                 <th  class="rating"><s:text name="rating"/></th>
	                </tr>
	                <s:if test="userList.size==0">
	                 <tr><td class="left-item dark" colspan="15" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="userList" status="st">	
	            	<tr class="<s:if test="#st.odd">dark</s:if> <s:if test="#session.session_username==username">my</s:if>">
	            		<td class="rank left-item"><s:property value="#st.index+1"/></td>
	            		<td class="coder">
	            			<div style="float:left;">
	            			<b><a href="profile/<s:property value="username"/>"><s:property value="username"/></a></b>
	            			</div>
	            			<div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            			<s:property value="nickname"/>
	            			</div>
	            		</td>
	            		<td class="school"><s:property value="school"/></td>
	            		<td class="solved">
	            		<a href="problemset/status/with/<s:property value="username"/>/page/1" >
	            		<s:property value="solved"/>
	            		</a>
	            		</td>
	            		<td class="rating"><s:property value="rating"/></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>				  	 
	   </div>   
	   <br/>
       </s:if>
       <s:if test="problemList.size!=0">
     	
     	<!-- Problem -->
	    <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="problem"/> (<s:property value="problemList.size"/>)</div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="problem">
					 <tr class="header">
					   <th class="id left-item">#</th>
					   <th class="problem"><s:text name="problem"/></th>
					   <th class="solved"><s:text name="solved"/></th>
					   <th class="ratio"></th>
	                </tr>
	                <s:if test="problemList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="problemList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="id left-item "><s:property value="#st.index+1"/></td>
	            		<td class="problem">
	            			<div style="float:left;">
	            			<a href="problemset/problem/<s:property value="problem_id"/>" ><s:property value="problem_id"/>.<s:property value="title"/></a>
	            			</div>
	            			 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            				<s:property value="tag"/>
	            			</div>
	            		</td>
	            		<td class="solved">
	            		<a href="problemset/status/problem/<s:property value="problem_id"/>/page/1" >
	            		<s:property value="solved" default="0"/>
	            		</a>
	            		</td>
	            		<td class="ratio <s:if test="problemStatusList[#st.index]==1">problem-ac</s:if><s:elseif test="problemStatusList[#st.index]==2">problem-failed</s:elseif>" ><a title="submit your code?" href="problemset/submit/<s:property value="problem_id"/>" style="color: grey;"><s:text name="submit"/></a></td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>
	     <br/>
	   </s:if>
	       
	   <s:if test="messageList.size!=0">	 
	   <!-- Topic -->
  	   <div class="datatable">	
	    	<div class="lt">&nbsp;</div>
	        <div class="rt">&nbsp;</div>
	        <div class="lb">&nbsp;</div>
	        <div class="rb">&nbsp;</div>
	    	<div style="padding: 4px 0 0 6px;position: relative;">
				<div class="left"><s:text name="topic.topics"/> (<s:property value="messageList.size"/>)</div>
				<div class="right"></div>
			</div> 		
			<br/>
			<div class="innertable" style="position: relative;margin:0.3em 3px 0 3px;">
				<div class="ilt">&nbsp;</div>
           		<div class="irt">&nbsp;</div>	
				<table class="topics">
					 <tr class="header">					 
					   <th class="id left-item">#</th>
					   <th class="title"><s:text name="topic.title"/></th>					 				 
					   <th class="coder"><s:text name="topic.author"/></th>	
					   <th class="date"><s:text name="topic.date"/></th>
	                </tr>
	                <s:if test="messageList.size==0">
	                 <tr><td class="left-item dark" colspan="5" style="text-align: left;">There is no records.</td></tr>
	                </s:if>
					<s:iterator value="messageList" status="st">	
	            	<tr <s:if test="#st.odd">class="dark"</s:if>>
	            		<td class="id left-item "><s:property value="#st.index+1"/></td>
	            		<td class="title" >
	            			<div style="float:left;">
	            			<a href="topic/<s:property value="message_id"/>" ><s:property value="title"/></a>
	            			</div>
	            			 <div style="float:right;font-size:11px;padding-top:1px;text-align:right;color: grey;">
	            			
	            			</div>
	            		</td>            		
	            	    <td class="author">
	            	   	 <b><a href="profile/<s:property value="create_user"/>"><s:property value="create_user"/></a></b>
	            	    </td>				   
					   <td class="date">
					   		<s:date name="in_date" nice="false" format="yyyy-MM-dd HH:mm:ss"/>
					   </td>
	            	</tr>	
	           		</s:iterator>   
				</table>
		    </div>	 	 
	   </div>    
	  </s:if>
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
