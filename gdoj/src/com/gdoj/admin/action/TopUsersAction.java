package com.gdoj.admin.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.bean.TagsBean;
import com.gdoj.bean.TopUsersBean;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.quartz.SchedulerContext;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.HibernateSessionFactory;
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.freemarker.MyFreeMarker;

public class TopUsersAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	

	public String MakeTopUsers()throws Exception {
		
		try {
			List<User> users = new ArrayList<User>();
			users = TopUsersBean.getTopUsers();
			Map map = new HashMap();
			map.put("topusers", users);
			map.put("date", new Date());
			String root = ServletActionContext.getRequest().getRealPath("/WEB-INF");
			MyFreeMarker.generator(root, "topusers.ftl", "topusers.html",
					"topusers", map);
			
			
			/*top tags */
			{
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();
				String sql =new String();
			    sql = "select t.name,count(*) from Tagsview tv,Tags t where tv.tag_id = t.tag_id group by tv.tag_id order by count(*) desc;";				
			    SQLQuery query = (SQLQuery) session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			    List list = query.list();  
			    
			    List<TagsBean> tagslist = new ArrayList<TagsBean>();
			    
			    for (int i = 0; i < list.size(); i++){
			    	Map m = (Map)list.get(i);
			    	
			    	TagsBean tb = new TagsBean();
			    	tb.setTagName(m.get("name").toString());
			    	tb.setCount(Integer.valueOf(m.get("count(*)").toString()));
			    	tagslist.add(tb);
			    	//System.out.println("Tag:"+ tb.getTagName() + ", count: "+ tb.getCount());
			    }
			    
				session.getTransaction().commit();
				HibernateSessionFactory.closeSession();	
				
				Map maptags = new HashMap();
				maptags.put("toptags", tagslist);
				String rootTags = ServletActionContext.getRequest().getRealPath("/WEB-INF");
				MyFreeMarker.generator(rootTags, "toptags.ftl", "toptags.html", "toptags", maptags);
			}
			/*
			 * OJ Contests 
			 * */
			
	        try { 
	            URL url = new URL(Config.getValue("OTHEROJ")); 
	            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream())); 
	            String line; 
	            String content = new String();
	            
	            while ((line = reader.readLine()) != null) { 
	                // ... 
	            	//System.out.println(line);
	            	content += line;
	            } 
	            reader.close(); 
	          
	            String path = ServletActionContext.getRequest()
				.getSession().getServletContext().getRealPath("/");
	            File f = new File(path + "otheroj.json");
	            
	            StreamHandler.write(f,content);
	 
	        } catch (MalformedURLException e) { 
	            // ... 
	        	
	        } catch (IOException e) { 
	            // ... 
	        }
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
        return SUCCESS;
	}
   
}
