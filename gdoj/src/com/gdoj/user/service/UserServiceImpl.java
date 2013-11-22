package com.gdoj.user.service;

import java.util.List;
import com.gdoj.user.dao.UserDAO;
import com.gdoj.user.vo.User;

public class UserServiceImpl implements UserService {

	private UserDAO userDao;

	public UserDAO getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	public User checkLogin(String username,String password){
		
		return userDao.checkLogin(username, password);
	}
	public User queryUser(String username){
		return userDao.queryUser(username);
	}
	public List<User> queryUsers(Integer from,Integer pageSize){
		// TODO Auto-generated method stub
		return userDao.queryUsers(from,pageSize);
	}
	public List<String> queryAllUserName(String sql,String q,Integer pageSize){
		return userDao.queryAllUserName(sql, q,pageSize);
	}
	
	public void save(User user){
		userDao.save(user);
	}
	public boolean isUsernameExist(String username){
		return userDao.isUsernameExist(username);
	}
	public User getUserByEmail(String email){
		return userDao.getUserByEmail(email);
	}
	public Integer countUsers(){
		return userDao.countUsers();
	}
	public List<User> getStandings(Integer from,Integer pageSize,String order){
		return userDao.getStandings(from, pageSize, order);
	}
	public List<User> query(String sql,String word){
		return userDao.query(sql,word);
	}
	public int getUserRank(User user){
		return userDao.getUserRank(user);
	}
}
