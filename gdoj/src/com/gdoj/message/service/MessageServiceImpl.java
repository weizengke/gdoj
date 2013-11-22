package com.gdoj.message.service;

import java.util.ArrayList;
import java.util.List;


import com.gdoj.message.dao.MessageDAO;
import com.gdoj.message.vo.Message;

public class MessageServiceImpl implements MessageService {
	
	private MessageDAO messageDao;
	private List<Message> messagess;
	
	
	public List<Message> getMessagess() {
		return messagess;
	}

	public void setMessagess(List<Message> messagess) {
		this.messagess = messagess;
	}

	public MessageDAO getMessageDao() {
		return messageDao;
	}
	
	public void setMessageDao(MessageDAO messageDao) {
		this.messageDao = messageDao;
	}
	
	public void saveMessage(Message message){
		this.messageDao.save(message);
	}
	
	public Message queryMessage(Integer messageId) {
		// TODO Auto-generated method stub
		
		return messageDao.queryMessage(messageId);
	}
	
	public List<Message> query(String sql) {
		// TODO Auto-generated method stub
		return messageDao.query(sql);
	}
	
	public List<Message> queryRootMessages(Integer pageNow,Integer pageSize){
		return messageDao.queryRootMessages(pageNow,pageSize);
	}
	
	public List<Message> queryMessagesByRootId(Integer rootId){
		return messageDao.queryMessagesByRootId(rootId);
	}
	
	public List<Message> queryChildMessages(Integer parentId){
		return messageDao.queryChildMessages(parentId);
	}
	
	public List<Message> queryLatestMessages(String username,Integer pageNow,Integer size){
		return messageDao.queryLatestMessages(username,pageNow,size);
	}
	public Integer count(String sql){
		return messageDao.count(sql);
	}
	public Integer countMessages(){
		return messageDao.countMessages();
	}
	public Integer countRootMessages(){
		return messageDao.countRootMessages();
	}
	public List<Message> query(String sql,String word){
		return messageDao.query(sql,word);
	}
	public Message getLatestReply(Integer messageId){
		return messageDao.getLatestReply(messageId);
	}
}
