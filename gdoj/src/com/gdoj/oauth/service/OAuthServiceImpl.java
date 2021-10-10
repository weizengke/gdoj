package com.gdoj.oauth.service;

import java.util.List;

import com.gdoj.oauth.dao.OAuthDAO;
import com.gdoj.oauth.vo.OAuth;

public class OAuthServiceImpl implements com.gdoj.oauth.service.OAuthService {
	private OAuthDAO oauthDao;

	public OAuthDAO getOauthDao() {
		return oauthDao;
	}

	public void setOauthDao(OAuthDAO oauthDao) {
		this.oauthDao = oauthDao;
	}

	public List<OAuth> query(String sql) {
		// TODO Auto-generated method stub
		return oauthDao.query(sql);
	}

	public List<OAuth> queryByUser(String username) {
		return oauthDao.queryByUser(username);
	}

	public OAuth queryOAuthByUser(String provider, String username) {
		return oauthDao.queryOAuthByUser(provider, username);
	}

	public OAuth queryOAuthByLoginName(String provider, String login) {
		return oauthDao.queryOAuthByLoginName(provider, login);
	}

	public void save(OAuth oauth) {
		// TODO Auto-generated method stub
		oauthDao.save(oauth);
	}
	public void delete(OAuth oauth) {
		// TODO Auto-generated method stub
		oauthDao.delete(oauth);
	}
}
