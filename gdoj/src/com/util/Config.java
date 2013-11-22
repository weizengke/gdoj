/**
 * 
 */
package com.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

public class Config {

	private final static Logger log = Logger.getLogger(Config.class);
	private static final String PATH = "/config.properties";
	private static Properties properties = null;
	
	public static String getValue(String key) {
		/**
		 * get value matches the key.
		 */
		load();
		
		return properties.getProperty(key);
	}
	
	public static boolean setValue(String key,String value) throws IOException {
		/**
		 * set value matches the key.
		 */
		 String root =  Thread.currentThread().getContextClassLoader().getResource("").toString();
	    	root = root.replaceAll("file:/", "").replaceAll("%20", " ");
		 load();
		 OutputStream fos = new FileOutputStream(root+PATH);
		 properties.setProperty(key,value);
		 properties.store(fos,"");
         fos.close(); //------------------------------------important
		return true;
	}
	
	private static void load() {
		properties = new Properties();
		
		try {
			 String root =  Thread.currentThread().getContextClassLoader().getResource("").toString();
		    	root = root.replaceAll("file:/", "").replaceAll("%20", " ");
			InputStream is = new FileInputStream(root+PATH);			
			properties.load(is);
			is.close();// ¹Ø±ÕÁ÷ 
		} catch (Exception e) {
			e.printStackTrace();
			log.error("can not load config.properties");
		}
	}
	
    public static void main(String[] args) throws IOException {
    	
    	System.out.println(getValue("OPENSOURCE"));
	    //setValue("OJ_PATH","D\:\\OJ\\");
    }
}
