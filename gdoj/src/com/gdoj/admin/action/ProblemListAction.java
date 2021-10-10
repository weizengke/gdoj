package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Problem> problemList;
	private List<Integer> pageList;
	private Integer page=1;
	private String order;
	private Integer pageSize=100;
	private Integer intRowCount=0;
	private String ojName;

	private Map<Integer,List<String>> tagsList;
	private TagsService tagsService ;
	private TagsviewService tagsviewService ;

	public Map<Integer, List<String>> getTagsList() {
		return tagsList;
	}

	public void setTagsList(Map<Integer, List<String>> tagsList) {
		this.tagsList = tagsList;
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

	public String getOjName() {
		return ojName;
	}

	public void setOjName(String ojName) {
		this.ojName = ojName;
	}
	private ProblemService problemService;

	

	public String problemSet()throws Exception {
		try {
			if (pageSize > 100) {
				pageSize = 100;
			}	
			
			intRowCount = problemService.countProblems("admin",ojName);
			
			
			Integer pageCount = ((intRowCount + pageSize - 1) / pageSize);//�������ҳ��
			
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			problemList = problemService.queryProblems(from, pageSize, order,ojName,"admin");
			
			List<Integer> volume = new ArrayList<Integer>();
			for (Integer i = 1; i <= pageCount; i++) {
				volume.add(i);
			}
			pageList = volume;

			//tags
			tagsList = new HashMap<Integer, List<String>>();
			for(Problem p:problemList){
				List<Tagsview> tagsviewsList_ = new ArrayList<Tagsview>();
				List<String> tagsNameList_ = new ArrayList<String>();
				try {
					tagsviewsList_ = tagsviewService.queryByProblems(p.getProblem_id());
					for (Tagsview t_ : tagsviewsList_) {
						tagsNameList_.add(tagsService.queryTag(t_.getTag_id()).getName());
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				tagsList.put(p.getProblem_id(), tagsNameList_);
			}
			//end tags

		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		
		
		return SUCCESS;
	}
	
	
	
	public Integer getIntRowCount() {
		return intRowCount;
	}
	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List<Problem> getProblemList() {
		return problemList;
	}

	public void setProblemList(List<Problem> problemList) {
		this.problemList = problemList;
	}

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	
	
	
}
