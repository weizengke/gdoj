package com.gdoj.vote.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.user.vo.User;
import com.gdoj.vote.vo.Vote;

public class VoteDaoImpl extends HibernateDaoSupport implements VoteDAO {

	public Integer getVotes(Integer messageId) {
		// TODO Auto-generated method stub
		
		String sql = "select sum(v.vote) from Vote v where message_id="+messageId;
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;	
	}

	public boolean isVoteBefore(String username, Integer messageId) {
		// TODO Auto-generated method stub
		String sql = "from Vote as v where v.username='"+username+"' and message_id="+messageId;
		List<User> list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0){
			return true;
		}
		else{
			return false;
		}
	}

	public void save(Vote vote) {
		// TODO Auto-generated method stub
		getHibernateTemplate().saveOrUpdate(vote);
	}

}
