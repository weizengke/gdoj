package com.gdoj.problem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private Integer page=1;
	private String order;
	private Integer pageSize=100;
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	
	private ProblemService problemService;
	private List<Problem> problemList;
	private List<Integer> pageList;
	
	private SolutionService solutionService;
	private List<Integer> problemStatusList;

	
	private TagsService tagsService ;
	private TagsviewService tagsviewService ;
	private Map<Integer,List<String>> tagsList;
	
	private String ojName;
	
	public String getOjName() {
		return ojName;
	}

	public void setOjName(String ojName) {
		this.ojName = ojName;
	}

	public String problemSet()throws Exception {
		try {
			if (pageSize > 100) {
				pageSize = 100;
			}		
			intRowCount = problemService.countProblems("user", ojName);
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			
			problemList = problemService.queryProblems(from, pageSize, order, ojName, "user");
			
			//user solved?
			String username = (String)ActionContext.getContext().getSession().get("session_username");
			if(username!=null){
				String sql = new String();
				problemStatusList = new ArrayList<Integer>();	
				for(Problem p:problemList){
					sql="select count(s.solution_id) from Solution s where username='"+username+"' and s.problem_id="+p.getProblem_id() ;
					if(solutionService.countSolutions(sql)>0){
						//5 AC
						sql="select count(s.solution_id) from Solution s where username='"+username+"' and s.verdict=5  and s.problem_id="+p.getProblem_id() ;
						if(solutionService.countSolutions(sql)>0){
							problemStatusList.add(1);
						}else{
							problemStatusList.add(2); //WA Other
						}
					}else{
						problemStatusList.add(0);
					}					
				}	
			}
			//end user solved?
			
			//tags
			tagsList = new HashMap<Integer, List<String>>();
			for(Problem p:problemList){
				List<Tagsview> tagsviewsList_ = new ArrayList<Tagsview>();	
				List<String> tagsNameList_ = new ArrayList<String>();
				
				try {
					tagsviewsList_ = tagsviewService.queryByProblems(p.getProblem_id());
					for (Tagsview t_ : tagsviewsList_) {
						tagsNameList_.add(tagsService.queryTag(
								t_.getTag_id()).getName());
					}
				} catch (Exception e) {
					// TODO: handle exception
					//System.out.println("Problem List:"+p.getProblem_id()+" tag invalid.");
				}
				
				tagsList.put(p.getProblem_id(), tagsNameList_);
			}
			//end tags
			
			//page list
			List<Integer> volume = new ArrayList<Integer>();
			if(pageCount<7){
				for (Integer i = 1; i <= pageCount; i++) {
					volume.add(i);
				}
			}
			else
			{
				volume.add(1);
				if(page>4){
					volume.add(0); //省略号	
				}
				Integer start_i = new Integer(2);
				Integer end_i = new Integer(pageCount-1);
				if(page-2>2){
					start_i = page-2;
				}
				if(page+2<pageCount){
					end_i = page+2;
				}
				
				for(Integer i=start_i;i<= end_i;i++){
						volume.add(i);
				}	
				if(page<pageCount-3){ 		
					volume.add(0); //省略号
				}
				
				volume.add(pageCount);
			}	
			pageList = volume;
			//end page list
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}

		return SUCCESS;
	}
	
	
	public SolutionService getSolutionService() {
		return solutionService;
	}
	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}
	public List<Integer> getProblemStatusList() {
		return problemStatusList;
	}
	public void setProblemStatusList(List<Integer> problemStatusList) {
		this.problemStatusList = problemStatusList;
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

	public Map<Integer, List<String>> getTagsList() {
		return tagsList;
	}

	public void setTagsList(Map<Integer, List<String>> tagsList) {
		this.tagsList = tagsList;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	
	
}
