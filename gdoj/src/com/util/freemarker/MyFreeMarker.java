package com.util.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.components.URL;

import com.gdoj.bean.LatestTopicBean;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class MyFreeMarker {

	public static void generator(String templatesPath,String ftlName,String desName,String objName,Map objMap) throws IOException, TemplateException{		
		File file_ = new File(templatesPath+"\\templates");
		if(false==file_.exists()){
			System.out.println(templatesPath+"\\templates"+" is not existed");
			return;
		}
		
		Configuration cfg = new Configuration();
		cfg = new Configuration();
		try {
			cfg.setDirectoryForTemplateLoading(new File(templatesPath+"\\templates"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Template t = cfg.getTemplate(ftlName);
		
		//this.getClass().getClassLoader().getResource("/").getPath();
		
		Writer out = new OutputStreamWriter(new FileOutputStream(templatesPath+"\\templates\\"+desName), "GBK");
		t.process(objMap, out);
	}
	public static void main(String[] args) throws Exception {
		
		 System.out.println(Thread.currentThread().getContextClassLoader().getResource(""));   
		   
         System.out.println(MyFreeMarker.class.getClassLoader().getResource(""));   
   
         System.out.println(ClassLoader.getSystemResource(""));   
         System.out.println(MyFreeMarker.class.getResource(""));   
         System.out.println(MyFreeMarker.class.getResource("/")); 
         System.out.println(MyFreeMarker.class.getResourceAsStream("/")); 
        //Class文件所在路径 
         System.out.println(new File("/").getAbsolutePath());   
         System.out.println(System.getProperty("user.dir"));   
		
		List<LatestTopicBean> topi = new ArrayList<LatestTopicBean>();
		LatestTopicBean l = new LatestTopicBean();
		l.setUsername("Koko");
		l.setTopicId(11);
		l.setTitle("Hello");
		l.setDate(new Date());
		topi.add(l);
		LatestTopicBean l2 = new LatestTopicBean();
		l2.setUsername("Solo");
		l2.setTopicId(12);
		l2.setTitle("Hello world");
		l2.setDate(new Date());
		topi.add(l2);
		Map map = new HashMap();
		map.put("topics", topi);
		//String path = System.getProperty("user.dir");
		//generator("D:\\tomcat6\\webapps\\gdoj\\WEB-INF","latesttopic.ftl","latesttopic.html","topics",map);
		System.out.println("Successfull................");
	}
}
