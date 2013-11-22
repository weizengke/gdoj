package com.gdoj.test.thread;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.SendFailedException;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gdoj.user.dao.UserDAO;
import com.gdoj.user.dao.UserDaoImpl;
import com.gdoj.user.service.UserService;
import com.gdoj.user.service.UserServiceImpl;
import com.gdoj.user.vo.User;
import com.util.CalcRating;
import com.util.DateUtil;
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.Tools;

public class Test {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		/*
		String html = "";
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod("http://acm.hdu.edu.cn/showproblem.php?pid=1000");
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
		try {
			int statusCode = httpClient.executeMethod(getMethod);
			if(statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + getMethod.getStatusLine());
			}
			html = Tools.getHtml(getMethod, null);
		} catch(Exception e) {
			getMethod.releaseConnection();
			throw new Exception();
		}

		System.out.println(html);
	*/
		
        try { 
            URL url = new URL("http://acm.hdu.edu.cn/showproblem.php?pid=1000"); 
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream())); 
            String line; 
            String content = new String();
            
            while ((line = reader.readLine()) != null) { 
                // ... 
            	//System.out.println(line);
            	content += line;
            } 
            reader.close(); 
          
            
            content =content.replaceAll("src=[^'\"]*?/images", "src=http://acm.hdu.edu.cn/data/images");
            content = content.replaceAll("src='[^'\"]*?/images", "src='http://acm.hdu.edu.cn/data/images");
            content = content.replaceAll("src=\"[^'\"]*?/images", "src=\"http://acm.hdu.edu.cn/data/images");
    		//System.out.println(tLine);
    		
    		System.out.println(Tools.regFind(content, "color:#1A5CC8'>([\\s\\S]*?)</h1>").trim());
    		System.out.println(Tools.regFind(content, "(\\d*) MS"));
    		System.out.println(Tools.regFind(content, "/(\\d*) K"));
    		System.out.println(Tools.regFind(content, "Problem Description</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		System.out.println(Tools.regFind(content, "Input</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		System.out.println(Tools.regFind(content, "Output</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
       		System.out.println(Tools.regFind(content, "Sample Input</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
      		System.out.println(Tools.regFind(content, "Sample Output</div>([\\s\\S]*?)(<br><[^<>]*?panel_title[^<>]*?>|<[^<>]*?><[^<>]*?><i>Hint)"));
    		/*
    		problem.setTimeLimit(Integer.parseInt(Tools.regFind(html, "(\\d*) MS")));
    		problem.setMemoryLimit(Integer.parseInt(Tools.regFind(html, "/(\\d*) K")));
    		description.setDescription(Tools.regFind(html, "Problem Description</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		description.setInput(Tools.regFind(html, "Input</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		description.setOutput(Tools.regFind(html, "Output</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		description.setSampleInput(Tools.regFind(html, "Sample Input</div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		description.setSampleOutput(Tools.regFind(html, "Sample Output</div>([\\s\\S]*?)(<br><[^<>]*?panel_title[^<>]*?>|<[^<>]*?><[^<>]*?><i>Hint)") + "</div></div>");
    		description.setHint(Tools.regFind(html, "<i>Hint</i></div>([\\s\\S]*?)<br><[^<>]*?panel_title[^<>]*?>"));
    		if (description.getHint().length() > 0){
    			description.setHint("<pre>" + description.getHint() + "</pre>");
    		}
    		
    		problem.setSource(Tools.regFind(html, "Source</div> <div class=panel_content>([\\s\\S]*?)<[^<>]*?panel_[^<>]*?>").replaceAll("<[\\s\\S]*?>", ""));
    		problem.setUrl("http://acm.hdu.edu.cn/showproblem.php?pid=" + problem.getOriginProb());
            */
            
           // String path = ServletActionContext.getRequest()
			//.getSession().getServletContext().getRealPath("/");
           // File f = new File(path + "otheroj.json");
            
            //StreamHandler.write(f,content);
 
        } catch (MalformedURLException e) { 
            // ... 
        	
        } catch (IOException e) { 
            // ... 
        }
		
/*
		List<Integer> contestTimes = new ArrayList<Integer>();
    	List<Integer> oldRating = new ArrayList<Integer>();
    	List<Integer> userRank = new ArrayList<Integer>();
    	List<Integer> grabs = new ArrayList<Integer>();
    	contestTimes.add(1);
    	contestTimes.add(1);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(1);
    	contestTimes.add(20);
    	contestTimes.add(1);
    	contestTimes.add(1);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	contestTimes.add(20);
    	contestTimes.add(0);
    	contestTimes.add(20);
    	
    	oldRating.add(2500);
    	oldRating.add(1500);
    	oldRating.add(2500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1660);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1700);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(2000);
    	oldRating.add(1660);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1700);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1500);
    	oldRating.add(1465);
    	oldRating.add(1500);
    	oldRating.add(3500);
    	
    	userRank.add(10);
    	userRank.add(5);
    	userRank.add(2);
    	userRank.add(4);
    	userRank.add(3);
    	userRank.add(6);
    	userRank.add(7);
    	userRank.add(8);
    	userRank.add(8);
    	userRank.add(1);
    	userRank.add(11);
    	userRank.add(12);
    	userRank.add(13);
    	userRank.add(14);
    	userRank.add(15);
    	userRank.add(16);
    	userRank.add(17);
    	userRank.add(18);
    	userRank.add(19);
    	userRank.add(20);
    	userRank.add(21);
    	userRank.add(22);
    	userRank.add(23);
    	userRank.add(24);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(25);
    	userRank.add(47);
    	userRank.add(25);
    	userRank.add(48);
  //  	List<Integer> oldRating_ = new ArrayList<Integer>();
  ////  	oldRating_  = CalcRating.initialize(contestTimes,oldRating);
  //  	for(int i=0;i<oldRating_.size();i++){
   // 		System.out.println(oldRating_.get(i));
  //  	}
    	
    	grabs = CalcRating.calc(contestTimes,oldRating,userRank);	
    	
    	for(int i=0;i<grabs.size();i++){
    		System.out.println(grabs.get(i));
    	}
		
		
		Date date =new Date();
		System.out.println(DateUtil.DateToString(date,"yyyy-MM-dd HH:mm:ss"));
		
		String str = new String();
		str="1989-10-1";
		System.out.println(DateUtil.StringToDate(str, "yyyy-MM-dd"));

		Pattern p = Pattern.compile("^[a-zA-Z0-9_.]{1,20}$");
		Matcher m = p.matcher("solo+");
		   if(m.matches()==false){
			   System.out.println("用户名输入错误!");
		  }else System.out.println("用户名输入正确!");
*/
	}

}
