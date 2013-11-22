package com.gdoj.admin.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;

public class ReJudgeAction extends ActionSupport{

	private SolutionService solutionService;
	private Integer problemId;
	private Integer solutionId;
	private Integer contestId;
	
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	public Integer getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
	}
	public SolutionService getSolutionService() {
		return solutionService;
	}
	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	
	public String reJudge()throws Exception {
		
		try {
			
			String condition_ = new String();
			if(problemId!=null){
				condition_ = "s.problem_id="+ problemId;
				if(contestId!=null){
					condition_ += " and s.contest_id="+ contestId;
				}
			}else if(contestId!=null){
				condition_ = "s.contest_id="+ contestId;
			}
			else if(solutionId!=null){
				condition_ = "s.solution_id="+ solutionId;
			}
			List<Solution> solution_ = new ArrayList<Solution>();
			String sql = "from Solution s where "+condition_ +" order by s.solution_id ASC";
			solution_ = solutionService.querySolutions(0, -1, sql);
			if(solution_ ==null){
				System.out.println("no solution to be ReJudge");
				return ERROR;
			}
			
			List<Integer> language_ = new ArrayList<Integer>();
			try {
				File f = new File(Config.getValue("OJ_LANG_PATH"));
				DocumentBuilderFactory factory = DocumentBuilderFactory
						.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(f);
				NodeList nl = doc.getElementsByTagName("VALUE");
				for (int i = 0; i < nl.getLength(); i++) {
					//language[i+1]=doc.getElementsByTagName("LANG").item(i).getFirstChild().getNodeValue();
					language_.add(Integer.parseInt(doc.getElementsByTagName("ID").item(i)
							.getFirstChild().getNodeValue()));
				}
				
			} catch (Exception e) {
				return SUCCESS;
			}
			
			for (Solution i : solution_) {
				boolean found = false;
				for(Integer lang:language_){
					if(lang.equals(i.getLanguage())){
						found = true;
						break;
					}
				}
				if(found==false){
					continue;
				}
				
				i.setVerdict(1);
				i.setTestcase(0);
				i.setTime(0);
				i.setMemory(0);
				solutionService.save(i);
				String[] cmd = { Config.getValue("OJ_PATH") + "Client.exe",
						Integer.toString(i.getSolution_id()),
						Integer.toString(i.getLanguage()),
						Config.getValue("OJ_INI_PATH") };
				
				try {
					Runtime.getRuntime().exec(cmd);
				} catch (IOException e) {
					e.printStackTrace();
				}
				Thread.sleep(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
}
