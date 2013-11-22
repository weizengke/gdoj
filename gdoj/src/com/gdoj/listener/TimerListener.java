package com.gdoj.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gdoj.test.thread.myThread;
import com.gdoj.thread.TimerThread;
import com.util.MyApplicationContextUtil;

public class TimerListener implements ServletContextListener  {
	
	private TimerThread timerThead = new TimerThread();
	
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("TimerThead. Close..");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try {
			//MyApplicationContextUtil.getContext().get;
			timerThead.setDaemon(true);
			timerThead.start();
			System.out.println("----TimerThead Has Been Initialized----");
			
		} catch (Exception e) {
			System.out.println("----Start TimerThead Error----");
		}
	}

}
