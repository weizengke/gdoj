package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;

public class SolutionListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	
	private ProblemService problemService;
	private ContestService contestService;
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ContestService getContestService() {
		return contestService;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}

	private List<Solution> solutionList;
	private Integer languageId;
	private Integer verdictId;
	private List<Integer> pageList;
	private Integer problemId;
	private String username;
	private Integer intRowCount=0;
	
	private Integer pageSize=50;
	private Integer page=1;

	private List<String> problemTitle;
	private Integer pageCount = 0;
	
	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public String queryStatusList() throws Exception{
		try {
			String sql_count = new String();
			String sql_query = new String();
			String sql_condition = new String();
				
			sql_count = "select count(s.solution_id) from Solution s";
			sql_query = "select s from Solution s";
			if (pageSize > 100) {
				pageSize = 100;
			}
			if (null != problemId) {				
				sql_condition += " s.problem_id=" + problemId;
			}
			if (null != username) {
				if(!"".equals(sql_condition)) sql_condition+= "  and";
				sql_condition += " s.username='" + username+"'";
			}
			if(!"".equals(sql_condition)) sql_condition = " where"+sql_condition;
			sql_condition +=" order by s.solution_id DESC";
			
			intRowCount = solutionService.countSolutions(sql_count + sql_condition);
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			solutionList = solutionService.querySolutions(from, pageSize,
					sql_query + sql_condition);
			
			List<String> problemTitle_ = new ArrayList<String>();
			
			if (null != solutionList) {
				for (Solution s : solutionList) {
					if (s.getLanguage_name() == null) {
						s.setLanguage_name(getText("language"+s.getLanguage()));
					} else {
						s.setLanguage_name(s.getLanguage_name());
					}
					Problem problem_ = problemService.queryProblem(s.getProblem_id());
					if(problem_==null){
						problemTitle_.add("problem missed");
					} else {
						problemTitle_.add(problem_.getTitle());
					}

					User user_ = new User();
					user_ = userService.queryUser(s.getUsername());
					if(user_ != null){
						s.setUser(user_);
					}
				}
			}
			problemTitle = problemTitle_;
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

	public List<Solution> getSolutionList() {
		return solutionList;
	}

	public void setSolutionList(List<Solution> solutionList) {
		this.solutionList = solutionList;
	}

	public Integer getLanguageId() {
		return languageId;
	}

	public void setLanguageId(Integer languageId) {
		this.languageId = languageId;
	}

	public Integer getVerdictId() {
		return verdictId;
	}

	public void setVerdictId(Integer verdictId) {
		this.verdictId = verdictId;
	}

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}

	public Integer getProblemId() {
		return problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	public List<String> getProblemTitle() {
		return problemTitle;
	}

	public void setProblemTitle(List<String> problemTitle) {
		this.problemTitle = problemTitle;
	}
}
