<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function langSelecter_onChanged()
{
document.getElementById("langForm").submit();
}
</script>

<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/>

<s:bean id="locales" name="com.util.Locales">
<s:param name="current"
  value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"/>
</s:bean>
<form action="<s:url/>" id="langForm"
     style="background-color:#bbbbbb; padding-top: 4px; padding-bottom: 4px;">
     <s:text name="language"/>
<s:select label="Language" list="#locales.locales" listKey="value" listValue="key"
        value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"
        name="request_locale" id="langSelecter"
        onchange="langSelecter_onChanged()" theme="simple"/>
</form>

