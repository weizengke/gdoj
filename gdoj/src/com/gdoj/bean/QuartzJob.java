package com.gdoj.bean;

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

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.gdoj.tags.service.TagsService;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.Config;
import com.util.HibernateSessionFactory;
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.freemarker.MyFreeMarker;

public class QuartzJob {
	
	@SuppressWarnings({ "deprecation", "null" })
	public void work()  
    {  
	    
	    try {
	    	/*top 10 user */
	    	String root =  Thread.currentThread().getContextClassLoader().getResource("/").getPath();	    	
	    	root = root.replaceAll("/classes/", "");
			List<User> users = new ArrayList<User>();
			Integer topNum = 10;
			try {
				topNum = Integer.valueOf(Config.getValue("WEB_TOP_USER_NUM")).intValue();
				if (topNum < 10) {
					topNum = 10;
				} else if (topNum > 100) {
					topNum = 100;
				}
			}catch(Exception e) {
				topNum = 10;
			}
			UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
			users = userService.getStandings(0, topNum, "rating");
			Map map = new HashMap();
			map.put("topusers", users);
			map.put("date", new Date());
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
			 * 
			 * Other OJ contests
			 * 
			 * */
			/*
			root = root.replaceAll("WEB-INF", "");
			
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
	          
	            //String path = ServletActionContext.getRequest()
				//.getSession().getServletContext().getRealPath("/");
	            File f = new File(root + "otheroj.json");
	            
	            StreamHandler.write(f,content);
	            
	            //System.out.println(new Date()+":"+" Generate recent contest.");
	            
	        } catch (MalformedURLException e) { 
	            // ... 
	        	System.out.println("get other oj contest error, MalformedURLException.");  
	        } catch (IOException e) { 
	            // ... 
	        	System.out.println("get other oj contest error, IOException.");  
	        }
			*/
		} catch (Exception e) {
			// TODO: handle exception 
		}
    }  
}
