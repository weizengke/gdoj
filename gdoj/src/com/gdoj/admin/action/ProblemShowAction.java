package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemShowAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Problem problem;
	private Integer problemId=1000;	
	private ProblemService problemService;
	private TagsService tagsService ;
	private TagsviewService tagsviewService ;
	private List<String> tagsList;

	public String problemShow()throws Exception {
		try {
			problem = problemService.queryProblem(problemId);
		
			if(null==problem){
				ActionContext.getContext().put("tip", "No such problem.");
				return ERROR;
			}

			List<Tagsview> tagsviewsList_ = new ArrayList<Tagsview>();
			tagsList = new ArrayList<String>();
			tagsviewsList_ = tagsviewService.queryByProblems(problemId);
			if(tagsviewsList_!=null){
				for (Tagsview t_ : tagsviewsList_) {
					tagsList.add(tagsService.queryTag(
							t_.getTag_id()).getName());
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		
		
		return SUCCESS;
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


	public TagsService getTagsService() {
		return tagsService;
	}

	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}

	public TagsviewService getTagsviewService() {
		return tagsviewService;
	}

	public void setTagsviewService(TagsviewService tagsviewService) {
		this.tagsviewService = tagsviewService;
	}

	public List<String> getTagsList() {
		return tagsList;
	}

	public void setTagsList(List<String> tagsList) {
		this.tagsList = tagsList;
	}

}
