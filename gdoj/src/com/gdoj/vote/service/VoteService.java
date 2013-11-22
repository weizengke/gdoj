package com.gdoj.vote.service;

import com.gdoj.vote.vo.Vote;

public interface VoteService {
	public void save(Vote vote);
	public boolean isVoteBefore(String username,Integer messageId);
	public Integer getVotes(Integer messageId); 
}
