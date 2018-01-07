package com.gdoj.bean;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.MyApplicationContextUtil;
import com.util.OnlineUsers;

public class QuartzOnlineUsersJob {
	
	public void work()  
    {  
	    try {

	    	
	    	UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
			
			Map<String, OnlineUserBean> mou = new HashMap<String, OnlineUserBean>();
			mou = OnlineUsers.getOnlineUsers();
			
			//System.out.println(new Date()+":"+" Generate OnlineUsers. size="+mou.size());
			
			Set set = mou.keySet();
	        Iterator it=set.iterator();
	        while(it.hasNext()){
	           String username = (String) it.next();
	           User u = new User();
	           
	           //System.out.println(username);
	           if(username==null){
					it.remove();
	        	    continue;
	           }
	           
	           u = userService.queryUser(username);
	           if(u==null){
					it.remove();
	        	    continue;
	           }
				
				u.setLastaccesstime(mou.get(username).getLastAccessTime());
				userService.save(u);
				
				/* 离线的需要剔除 */
				if (mou.get(username).getStatusFlag() == 0){
					System.out.println("removeUser " + username + " , because of offline...");
					it.remove();
				}
				
				//System.out.println("Next...");
	       }

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("update online users error...");  
		}
    }  
}
