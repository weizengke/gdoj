
package com.util;


import java.util.Date;
import java.util.Properties;
import java.util.Vector;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;


/*用JAVA程序发邮件
 *1. 下载，jaf-1_1-fr.zip和javamail-1_4.zip  解压缩会生成：activation.jar和mail.jar
 *在www.zhoujianboy.ys168.com或者www.sun.com可以下载
 *2. 打开Jcreator->Configure->Options->JDK Profiles->在右边选择JDK，然后->edit
 *->Add->Add Archive..->分别添加：activation.jar和mail.jar二个包。
 *3. 现在你可以正常使用javax.activation和javax.mail了。
 * Title: 使用javamail发送邮件
 * Description: 演示如何使用javamail包发送电子邮件。这个实例可发送多附件
 */
public class MailUtil
{
    
    String to = ""; // 收件人

    String from = ""; // 发件人
    
    String host = ""; // smtp主机
    
    String username = "";
    
    String password = "";
    
    String filename = ""; // 附件文件名
    
    String subject = ""; // 邮件主题
    
    String content = ""; // 邮件正文
    
    Vector file = new Vector(); // 附件文件集合
    
    /**
     * <br/>
     * 方法说明：默认构造器 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */

	public MailUtil() {
		// TODO Auto-generated constructor stub
	}

	/**
     * <br/>
     * 方法说明：设置邮件服务器地址 <br/>
     * 输入参数：String host 邮件服务器地址名称 <br/>
     * 返回类型：
     */
    public void setHost(String host)
    {
        this.host = host;
    }
    
    /**
     * <br/>
     * 方法说明：设置登录服务器校验密码 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setPassWord(String pwd)
    {
        this.password = pwd;
    }
    
    /**
     * <br/>
     * 方法说明：设置登录服务器校验用户 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setUserName(String usn)
    {
        this.username = usn;
    }
    
    /**
     * <br/>
     * 方法说明：设置邮件发送目的邮箱 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setTo(String to)
    {
        this.to = to;
    }
    
    /**
     * <br/>
     * 方法说明：设置邮件发送源邮箱 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setFrom(String from)
    {
        this.from = from;
    }
    
    /**
     * <br/>
     * 方法说明：设置邮件主题 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setSubject(String subject)
    {
        this.subject = subject;
    }
    
    /**
     * <br/>
     * 方法说明：设置邮件内容 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void setContent(String content)
    {
        this.content = content;
    }
    
    /**
     * <br/>
     * 方法说明：把主题转换为中文 <br/>
     * 输入参数：String strText <br/>
     * 返回类型：
     */
    public String transferChinese(String strText)
    {
        try
        {
            strText = MimeUtility.encodeText(new String(strText.getBytes(),
                    "GB2312"), "GB2312", "B");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return strText;
    }
    
    /**
     * <br/>
     * 方法说明：往附件组合中添加附件 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
    public void attachfile(String fname)
    {
        file.addElement(fname);
    }
    
    /**
     * <br/>
     * 方法说明：发送邮件 <br/>
     * 输入参数： <br/>
     * 返回类型：boolean 成功为true，反之为false
     */
    public boolean sendMail()
    {
        
// 构造mail session
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props,
                new Authenticator()
        {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try
        {
// 构造MimeMessage 并设定基本的值
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
           // System.out.println(from);
            
            InternetAddress[] address = { new InternetAddress(to) };
            msg.setRecipients(Message.RecipientType.TO, address);
            subject = transferChinese(subject);
            msg.setSubject(subject);
            
// 构造Multipart
            Multipart mp = new MimeMultipart();
            
// 向Multipart添加正文
            MimeBodyPart mbpContent = new MimeBodyPart();
            mbpContent.setText(content);
// 向MimeMessage添加（Multipart代表正文）
            mp.addBodyPart(mbpContent);
            
// 向Multipart添加附件
/*
 * Enumeration efile = file.elements(); while
 * (efile.hasMoreElements()) {
 *
 * MimeBodyPart mbpFile = new MimeBodyPart(); filename =
 * efile.nextElement().toString(); FileDataSource fds = new
 * FileDataSource(filename); mbpFile.setDataHandler(new
 * DataHandler(fds)); mbpFile.setFileName(fds.getName());
 * //向MimeMessage添加（Multipart代表附件） mp.addBodyPart(mbpFile); }
 *
 * file.removeAllElements();
 */
// 向Multipart添加MimeMessage
            msg.setContent(mp);
            msg.setSentDate(new Date());
// 发送邮件
            Transport.send(msg);
            
        }
        catch (MessagingException mex)
        {
            mex.printStackTrace();
            Exception ex = null;
            if ((ex = mex.getNextException()) != null)
            {
                ex.printStackTrace();
            }
            return false;
        }
        return true;
    }
    
    /**
     * <br/>
     * 方法说明：主方法，用于测试 <br/>
     * 输入参数： <br/>
     * 返回类型：
     */
   public static void main(String[] args)
    {
        MailUtil sendmail = new MailUtil();
        sendmail.setHost("smtp.qq.com");            //发邮件服务器
        sendmail.setUserName("269574524");         //用户名
        sendmail.setPassWord("password");           //密码
        sendmail.setTo("269574524@qq.com");            //发送到:sky_zd@126.com
        sendmail.setFrom("269574524@qq.com");     //发送邮箱
        
        sendmail.setSubject("密码取回");             //标题
        String content_ = new String();
	    content_ = "<a href='acm.guetonline.com'>Online Judge</a>\n Username:";
	     
        sendmail.setContent(content_);          //邮件内容
        sendmail.sendMail();
    }
} // end
