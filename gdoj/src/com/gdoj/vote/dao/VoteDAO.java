package com.gdoj.vote.dao;

import com.gdoj.vote.vo.Vote;

public interface VoteDAO {
	public void save(Vote vote);
	public boolean isVoteBefore(String username,Integer messageId);
	public Integer getVotes(Integer messageId); 
}
