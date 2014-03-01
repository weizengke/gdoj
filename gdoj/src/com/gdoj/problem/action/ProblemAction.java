package com.gdoj.problem.action;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Problem problem;
	private Integer problemId=1000;	
	private ProblemService problemService;
	private TagsviewService tagsviewService;
	private TagsService tagsService;
	private String tag1;
	private String tag2;
	private String tag3;
	private String tag4;
	private String tag5;
	private List<String> tags;
	private Integer tagsCount=0;
	

	public Integer getTagsCount() {
		return tagsCount;
	}
	public void setTagsCount(Integer tagsCount) {
		this.tagsCount = tagsCount;
	}
	public String problemAdd()throws Exception {
		try {
			
			String username = new String();
			username = (String)ActionContext.getContext().getSession().get("session_username");
			if(username==null){
				return "login";
			}
			
			if(problem.getTitle()==null||problem.getTitle().trim().equals("")){
				ActionContext.getContext().put("tip", "Title shouldn't be empty.");
				return "input";
			}
			
			problem.setCreate_date(new Date());
			problemService.save(problem);
			
			tags = new ArrayList<String>();
			if(tag1!=null&&!"".equals(tag1.trim())){
				tags.add(tag1);					
			}
			if(tag2!=null&&!"".equals(tag2.trim())){
				tags.add(tag2);
			}
			if(tag3!=null&&!"".equals(tag3.trim())){
				tags.add(tag3);	
			}
			if(tag4!=null&&!"".equals(tag4.trim())){
				tags.add(tag4);
			}			
			if(tag5!=null&&!"".equals(tag5.trim())){
				tags.add(tag5);
			}
			tagsviewService.removeProblemsTag(problem.getProblem_id());
			
			String tagString = new String();
			
			for(String t_:tags){
				Tags tag_ = new Tags();
				tag_ = tagsService.queryTag(t_);
				
				tagString+=t_+" ";
				
				if(tag_==null){
					//no such tag	
					tag_ = new Tags();
					tag_.setCreate_user(username);					 
					tag_.setIndate(new Date());
					tag_.setName(t_);
					tagsService.save(tag_);
				}
				Tagsview tagsview_ = new Tagsview();
				tagsview_.setTag_id(tag_.getTag_id());
				tagsview_.setProblem_id(problem.getProblem_id());
				tagsviewService.save(tagsview_);
			}
			problem.setTag(tagString);
			problemService.save(problem);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}

		return SUCCESS;
	}
	public String problemBeforeModify()throws Exception {
		try {
			String username = new String();
			username = (String)ActionContext.getContext().getSession().get("session_username");
			if(username==null){
				return "login";
			}
	
			problem = problemService.queryProblem(problemId);
	
			try {
				List<Tagsview> tagsview_ = new ArrayList<Tagsview>();
				tagsview_ = tagsviewService.queryByProblems(problemId);
				if(tagsview_!=null){
					tags = new ArrayList<String>();
					for (Tagsview t : tagsview_) {
						String tString_ = new String();
						tString_= tagsService.queryTag(t.getTag_id()).getName();
						tags.add(tString_);
						//System.out.println(tagsService.queryTag(t.getTag_id()).getName());
					}
					 tagsCount = tags.size();
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Problem "+problemId+"'s tags is invalid");
			}
	
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String problemModify()throws Exception {
		try {
			String username = new String();
			username = (String)ActionContext.getContext().getSession().get("session_username");
			if(username==null){
				return "login";
			}
			if(problem.getTitle()==null||problem.getTitle().trim().equals("")){
				ActionContext.getContext().put("tip", "Title shouldn't be empty.");
				return "input";
			}
			
			Problem problem_ =new Problem();
			problem_ = problemService.queryProblem(problem.getProblem_id());
			if(problem_==null){
				return ERROR;
			}
			problem_.setTitle(problem.getTitle());
			problem_.setDescription(problem.getDescription());
			problem_.setInput(problem.getInput());
			problem_.setOutput(problem.getOutput());
			problem_.setSample_input(problem.getSample_input());
			problem_.setSample_output(problem.getSample_output());
			problem_.setSpj(problem.getSpj());
			problem_.setContest_id(problem.getContest_id());
			problem_.setTime_limit(problem.getTime_limit());
			problem_.setMemory_limit(problem.getMemory_limit());
			problem_.setHint(problem.getHint());
			problem_.setSource(problem.getSource());
			problem_.setAuthor(problem.getAuthor());
			problem_.setTag(problem.getTag());
			
			problem_.setOj_name(problem.getOj_name());
			problem_.setOj_pid(problem.getOj_pid());
			problem_.setIsvirtual(problem.getIsvirtual());
			
			tags = new ArrayList<String>();
			if(tag1!=null&&!"".equals(tag1.trim())){
				tags.add(tag1);					
			}
			if(tag2!=null&&!"".equals(tag2.trim())){
				tags.add(tag2);
			}
			if(tag3!=null&&!"".equals(tag3.trim())){
				tags.add(tag3);	
			}
			if(tag4!=null&&!"".equals(tag4.trim())){
				tags.add(tag4);
			}			
			if(tag5!=null&&!"".equals(tag5.trim())){
				tags.add(tag5);
			}
			problemId = problem.getProblem_id();
			
			
			//Ó¦¸Ã×ö¾µÏñ
			tagsviewService.removeProblemsTag(problemId);
			
			String tagString = new String();
			
			for(String t_:tags){
				Tags tag_ = new Tags();
				tag_ = tagsService.queryTag(t_);
				
				tagString+=t_+" ";
				
				if(tag_==null){
					//no such tag	
					tag_ = new Tags();
					tag_.setCreate_user(username);					 
					tag_.setIndate(new Date());
					tag_.setName(t_);
					tagsService.save(tag_);
				}
			
					Tagsview tagsview_ = new Tagsview();
					tagsview_.setTag_id(tag_.getTag_id());
					tagsview_.setProblem_id(problemId);
					tagsviewService.save(tagsview_);
			}
			problem_.setTag(tagString);
			problemService.save(problem_);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	

	public TagsviewService getTagsviewService() {
		return tagsviewService;
	}
	public void setTagsviewService(TagsviewService tagsviewService) {
		this.tagsviewService = tagsviewService;
	}
	public TagsService getTagsService() {
		return tagsService;
	}
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	
	
	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public Integer getProblemId() {
		return problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	
}
