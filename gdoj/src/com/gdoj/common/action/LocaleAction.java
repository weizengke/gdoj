package com.gdoj.common.action;

import java.util.Locale;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LocaleAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3552864426020089250L;

		private String lang;  
		private boolean success;
		
		
	    public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public String getLang() {  
	        return lang;  
	    }   
	    public void setLang(String lang) {  
	        this.lang = lang;  
	    }        
	    @Override  
	    public String execute() throws Exception {  
	        try {
		        Locale currentLocale = Locale.getDefault();  
		        //1、根据页面请求，创建下同的Locale对象  
		        if("en".equals(getLang().trim())) {  
		            currentLocale = new Locale("en","US");  
		        }else if("zh".equals(getLang().trim())) {  
		            currentLocale = new Locale("zh","CN");  
		        } else{
		        	success=false;
					 return SUCCESS;
		        }
		        /* 
		         * 2、设置Action中的Locale 
		         *    前台页面的Locale和后台session中的Locale范围是不一样的 
		         *    a)只改页面Locale当前页面信息会改变但提交后Locale又会改回到默认的 
		         *    b)改变了后台Locale，当前线程中的页面Locale并不会改变，但会随下一次提交 
		         *      Action一同改变，所以可能要刷新页面两次，第一次只变后台Locale，第二次 
		         *      前台和后台同时改变 
		         *       
		         *    为避免上述情况，需要前台和后台的Locale一起改变 
		         */  
		       // System.out.println("Locales:"+lang);
		        ActionContext.getContext().setLocale(currentLocale);  
		        ServletActionContext.getRequest().getSession().setAttribute(  
		                "WW_TRANS_I18N_LOCALE", currentLocale);  
		        
		       
		        
			} catch (Exception e) {
				// TODO: handle exception
				success=false;
				 return SUCCESS;
			}
			success=true;
	        return SUCCESS;  
	    }      
}
