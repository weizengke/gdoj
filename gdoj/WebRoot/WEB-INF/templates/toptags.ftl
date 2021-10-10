<#list toptags as e> 
<a href="search?word=${e.tagName}&type=all" rel="tag" >
<span class="tag-name">${e.tagName}</span>
<span class="tag-count">${e.count}</span>
&nbsp;
</a>
</#list>	           	  			
