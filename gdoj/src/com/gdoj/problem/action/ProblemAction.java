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
	private String tagList;

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

			tagsviewService.removeProblemsTag(problem.getProblem_id());

			String[] tagsString = tagList.split(",");
			for(String t_:tagsString){
				Tags tag_ = new Tags();
				tag_ = tagsService.queryTag(t_);

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
				tagList = new String();
				List<Tagsview> tagsview_ = new ArrayList<Tagsview>();
				tagsview_ = tagsviewService.queryByProblems(problemId);
				if(tagsview_!=null){
					for (Tagsview t : tagsview_) {
						String tString_ = new String();
						tString_= tagsService.queryTag(t.getTag_id()).getName();
						if (tagList.length() == 0) {
							tagList += tString_;
						} else {
							tagList += "," + tString_;
						}
					}
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
			problem_.setOj_name(problem.getOj_name());
			problem_.setOj_pid(problem.getOj_pid());
			problem_.setIsvirtual(problem.getIsvirtual());

			problemId = problem.getProblem_id();
			tagsviewService.removeProblemsTag(problemId);

			String[] tagsString = tagList.split(",");
			for(String t_:tagsString){
				Tags tag_ = new Tags();
				tag_ = tagsService.queryTag(t_);

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

	public String getTagList() {
		return tagList;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

}
