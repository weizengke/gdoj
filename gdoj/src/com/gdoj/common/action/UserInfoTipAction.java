package com.gdoj.common.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;
import com.util.Html2Text;

public class UserInfoTipAction extends ActionSupport{

	private MessageService messageService;
	private UserService userService;	
	private String username="";
	
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String userInfo() throws IOException{
		//System.out.println(username);
		ActionContext ctx = ActionContext.getContext();
        HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("utf-8"); 
	
		 PrintWriter out = response.getWriter();
		 
		 User user_ = new User();
		 user_ = userService.queryUser(username);
		 
		 String sql = "select count(m.message_id) from Message m where " +
		 		"m.defunct='N' and m.parent_id=0 and m.create_user='"+user_.getUsername()+"'";
		 
		 Integer nCountTopic = new Integer(0);
		 nCountTopic = messageService.count(sql);
		 
		 List<Message> messages_ = new ArrayList<Message>();
		 messages_ = messageService.queryLatestMessages(username, 0, 2);
		 String buf = "";
		 buf = "<div class='UserOutline'>";
		 buf+="<div class='u'>";
		 buf+="<a href='profile/"+ user_.getUsername() + "'>";
		 if(user_.getAvatar()!=null&&user_.getAvatar().equals("Y")){
				buf+="<img src='upload/userphoto/"+user_.getUsername()+"/photo_80.jpg' alt='"+user_.getUsername()+"'>";
			}else{
				buf+="<img src='img/photo_80.jpg' alt='"+user_.getUsername()+"'>";
			}		
		 buf+="</a>";
		 buf+="</div>";
		
		 buf+="<h1><a href='mails/new/"+ user_.getUsername() + "' title='Mail to "+ user_.getUsername() + "'>@"+user_.getUsername()+"</a></h1><span class='city'>";
		 if(user_.getSchool()!=null&&!user_.getSchool().trim().equals("")){
			
			 buf+= (user_.getSchool().length()>16)?user_.getSchool().subSequence(0, 15)+"...":user_.getSchool();
			}
		 buf+="</span>";
		 
buf+="<div id='UserMotto'>";
if(user_.getMotto()!=null&&!user_.getMotto().trim().equals("")){
	buf+= (user_.getMotto().length()>30)?user_.getMotto().subSequence(0, 30)+"...":user_.getMotto();
}
buf+="</div><br style='clear:both'>";
buf+="<div id='UserStat'>"+
	"<ul>"+
	"<li><em>"+userService.getUserRank(user_)+"</em>"+getText("rank")+"</li>"+
	"<li><a href='problemset/status/with/"+user_.getUsername()+"/page/1'><em>"+user_.getSolved()+"</em>"+getText("solved")+"</a></li>"+	
	"<li><a href='problemset/status/with/"+user_.getUsername()+"/page/1'><em>"+user_.getSubmit()+"</em>"+getText("submit")+"</a></li>"+
	"<li style='border-right:0;'><a href='#'><em>"+nCountTopic+"</em>"+getText("topic")+"</a></li>"+
	"</ul>"+
"</div>"+

"<div class='opts'>"+

"</div>"+
"<div id='Logs'>"+
	"<strong>"+getText("recent-action")+"£º</strong>"+
	"<div class='log'>";
		 if(messages_!=null){
			 if(messages_.size()==0){
				 buf+="<span style='color:grey'>"+getText("no-any-action")+"</span>";
			 }
			 for(Message m:messages_){
				 	String bufString = new String();
				 	bufString = Html2Text.RemoveHtml(((m.getContent().length()>500)?(m.getContent()).substring(0, 500):m.getContent()));
					String url = "";
					String img = "";
				 	if(m.getParent_id()>0){
				 		url="topic/"+m.getRoot_id()+"#rpl_"+m.getMessage_id();
				 		img = "<img src='img/comment-12.png' title='New comment(s)'>";
						
					}else{
						url="topic/"+m.getMessage_id();
						img = "<img src='img/x-update-12x12.png' title='New or modify topic'>";
					}
				 	buf+=img+"<a href='"+url+"'>"+m.getTitle()+"</a>"+" :<span style='color:grey'>"+((bufString.length()>100)?(bufString).substring(0, 100)+"...":bufString)+"</span></br>";
					
			 }	
		 }else{
			 buf+="<span style='color:grey'>"+getText("no-any-action")+"</span>";
		 }
		buf+="</div>"+
"</div>"+
"</div>";
		 
		 out.print(buf);
		 out.flush();
		 out.close();
		return null;
	}
}
