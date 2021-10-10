package com.util;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.gdoj.bean.OnlineUserBean;

public class OnlineUsers {

	private static Map<String, OnlineUserBean> map_online_users = Collections.synchronizedMap(new HashMap<String, OnlineUserBean>());
	
	/*
	 *   新增用户，若存在增更新lastAccessTime
	 */
	public static boolean onlineUser(String username) {
		if (username == null){
			return false;
		}
		
		System.out.println(new Date()+":"+username+" ping or online");
		
		if (true == map_online_users.containsKey(username)){
			/*
			 * 已存在
			 */
			OnlineUserBean ou = map_online_users.get(username);
			ou.setLastAccessTime(new Date());
			ou.setStatusFlag(1);
		}
		else{
			/*
			 * 新增
			 */
			OnlineUserBean ou = new OnlineUserBean();
			ou.setUsername(username);
			map_online_users.put(username, ou);
		}

		return false;
	}
	
	/*
	 * 置离线标志位
	 */
	public static boolean offlineUser(String username) {
		
		System.out.println(new Date()+":"+username+" offline"); 
		
		if (username == null){
			return false;
		}

		if (true == map_online_users.containsKey(username)){
			OnlineUserBean ou = map_online_users.get(username);
			ou.setLastAccessTime(new Date());
			ou.setStatusFlag(0);
		}
		
		return true; 
	}
	
	/*
	 * 从在线用户map中移除
	 */
	public static boolean removeUser(String username) {
		//System.out.println(new Date()+":"+username+" has been removed"); 
		
		if (username == null){
			return false;
		}
		
		if (null == map_online_users.remove(username)){
			return false;
		}

		return true; 
	}
	
	public static int userSize() {
		return map_online_users.size();
	}
	
	public static OnlineUserBean getUser(String username){
		return map_online_users.get(username);
	}
	
	public static Map<String, OnlineUserBean> getOnlineUsers() {
	/*	
       Set set =map_online_users.keySet();
       Iterator it=set.iterator();
       while(it.hasNext()){
          String s= (String) it.next();
          if (null == s)
          {
        	  it.remove();
        	  continue;
          }
          
          System.out.println(s + "  " + map_online_users.get(s).getLoginDate().toString() +
        		  "  " + map_online_users.get(s).getLastAccessTime().toString() +
        		  " " + map_online_users.get(s).getStatusFlag()
        		  );
          
       }
		*/
		return map_online_users;
	}
	
	public static void main(String[] args) throws IOException {
		onlineUser("ACSolo");
		getOnlineUsers();
		for(int i = 0 ;i< 100000;i++)
		{
			for(int j = 0 ;j< 10000;j++)
			{
				int a = 10;
			}
		}
		onlineUser("Jungle");
		for(int i = 0 ;i< 100000;i++)
		{
			for(int j = 0 ;j< 10000;j++)
			{
				int a = 10;
			}
		}
		getOnlineUsers();
		
		offlineUser("ACSolo");

		getOnlineUsers();
		
	}
	
}
