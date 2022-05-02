<ul>
<#list topics as e>  
<li>
<div>
<span class="user"><a title="${e.author}" href="profile/${e.author}" class="rated-user user-rate-${e.user.rate} user-tip" user="${e.author}">
${e.author}
</a></span>:   	
<span class="title">
<a title="${e.title} - ${e.in_date?string("yyyy-MM-dd HH:mm:ss")}" href="topic/<#if e.parentId != 0 >${e.rootId?c}#rpl_${e.messageId?c}"<#else>${e.messageId?c}"</#if>>${e.title}</a>
</span>
<#if e.parentId != 0 ><img src="img/comment-12.png" title="New comment(s)"><#else><img src="img/x-update-12x12.png" title="New or modify topic"></#if>
</div>
</li>
</#list>	           	  			
</ul>	      	 