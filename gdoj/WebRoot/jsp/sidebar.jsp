<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!-- web board -->
<jsp:include page="/WEB-INF/templates/sidebarex.html"></jsp:include>
<!-- top 10 -->
<div class="sidebox roundbox ">
	<div class="top-link">
		<div class="title-sidebox">
			<li style="position:relative;list-style-type:none; ">
			<b style="width:24px;height:24px;background:url(img/top_24.png) no-repeat;display:block;position:absolute;left:0px;top:3px;"></b>
			<span class="title"><s:text name="sidebar.topusers" /></span>
			</li>
		</div>
	</div>
	<div class="top10">
		<table class="rtable">
			<tbody>
				<tr>
					<th class="left-item" style="width: 28px;">
						#
					</th>
					<th class="user">
						<s:text name="author" />
					</th>
					<th class="" style="width: 48px;">
						=
					</th>
				</tr>
				<jsp:include page="/WEB-INF/templates/topusers.html"></jsp:include>
			</tbody>
		</table>
	</div>
	<div class="bottom-link">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="text-align: left;">
					</td>
					<td style="text-align: right;">
						<a href="problemset/standings"><s:text name="sidebar.more"/> &rarr;</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- top tags -->
 <div class="sidebox roundbox">
    <div class="top-link">
    	<div class="title-sidebox">
	     	<li style="position:relative;list-style-type:none; ">
				<b style="width:24px;height:24px;background:url(img/tags_24.png) no-repeat;display:block;position:absolute;left:0px;top:3px;"></b>
				<span class="title"><s:text name="sidebar.hottags"/></span>
			</li>
		</div>  
     </div>  
     <div class="tags tags-sidebar" style="">  
     		<jsp:include page="/WEB-INF/templates/toptags.html"></jsp:include>
      </div>	           
</div> 

<!-- top recentaction -->
<div class="sidebox roundbox ">
	<div class="top-link">
		<div class="title-sidebox">
			<li style="position:relative;list-style-type:none; ">
			<b style="width:24px;height:24px;background:url(img/topic_24.png) no-repeat;display:block;position:absolute;left:0px;top:3px;"></b>
			<span class="title"><s:text name="sidebar.hottopic" /></span>
			</li>
		</div>
	</div>
	<div class="latest_news" style="">
		<jsp:include page="/WEB-INF/templates/latesttopic.html"></jsp:include>
	</div>
	<div class="bottom-link">
		<table style="width: 100%">
			<tbody>
				<tr>
					<td style="text-align: left;">
					</td>
					<td style="text-align: right;">
						<a href="topic"><s:text name="sidebar.more"/> &rarr;</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
