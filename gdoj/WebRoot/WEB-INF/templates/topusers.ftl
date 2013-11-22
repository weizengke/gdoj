<#list topusers as e>
<#assign x=e_index>
<tr>
<td class="left-item <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>">${e_index+1}</td>
<td class="user <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>"><span  class="user" ><a href="profile/${e.username}" title="${e.username}" class="user-tip" user="${e.username}">
<#if e.nickname?exists>
<#if e.nickname?length=0>${e.username}
<#else>${e.nickname}</#if>
<#else>${e.username}</#if>
</a></span></td>
<td class=" <#if (x%2=0)>dark</#if> <#if e_has_next><#else>bottom</#if>">${e.solved?c}</td>
</tr>
</#list>

