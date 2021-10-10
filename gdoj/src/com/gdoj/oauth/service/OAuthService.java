package com.gdoj.oauth.service;

import java.util.List;
import com.gdoj.oauth.vo.OAuth;

public interface OAuthService {
	public void save(OAuth oAuth);
	public void delete(OAuth oAuth);
	public List<OAuth> query(String sql);
	public List<OAuth> queryByUser(String username);
	public OAuth queryOAuthByUser(String provider, String username);
	public OAuth queryOAuthByLoginName(String provider, String login);
}
