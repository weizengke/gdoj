package com.gdoj.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.gdoj.test.thread.myThread;

public class JudgeListener implements ServletContextListener  {
	
	private myThread gcc = new myThread();
	
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("Thread. Close..");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try {
			gcc.setDaemon(true);
			gcc.start();

			System.out.println("----Judge Core Has Been Initialized----");
			
		} catch (Exception e) {
			System.out.println("----Start Judge Core Error----");
		}
	}

}
