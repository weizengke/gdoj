<#list topusers as e>
<#assign x=e_index>
<tr>
<td class="left-item <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>">
<#if (x==0)><img class="rank-icon" src="img/gold.png">
<#else>
	<#if (x==1)><img class="rank-icon" src="img/silver.png">
	<#else>
		<#if (x==2)><img class="rank-icon" src="img/copper.png">
		<#else>
		${e_index+1}
		</#if>
	</#if>
</#if>
</td>
<td class="user <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>">
<span  class="user" ><a href="profile/${e.username}" title="${e.username}" class="user-rate-${e.rate} user-tip" user="${e.username}">
<#if e.nickname?exists>
<#if e.nickname?length=0>${e.username}
<#else>${e.nickname}</#if>
<#else>${e.username}</#if>
</a></span>
</td>
<td class=" <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>">
${e.rating?c}
</td>
</tr>
</#list>

