package com.gdoj.oauth.dao;

import java.util.List;

import com.gdoj.oauth.vo.OAuth;

public interface OAuthDAO {
	public void save(OAuth oauth);
	public void delete(OAuth oauth);
	public List<OAuth> query(String sql);
	public List<OAuth> queryByUser(String username);
	public OAuth queryOAuthByUser(String provider, String username);
	public OAuth queryOAuthByLoginName(String provider, String login);
}
