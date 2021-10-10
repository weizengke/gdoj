package com.gdoj.admin.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.gdoj.bean.TestFileBean;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.StreamHandler;

public class TestFileListAction extends ActionSupport{
	private Integer problemId;
	private List<TestFileBean> testFiles;
	
	public void setTestFiles(List<TestFileBean> testFiles) {
		this.testFiles = testFiles;
	}
	public List<TestFileBean> getTestFiles() {
		return testFiles;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public String execute() {
		try {		
			testFiles = new ArrayList<TestFileBean>();
			
			Integer index = new Integer(1);
			String basePath = Config.getValue("OJ_DATA_PATH") + problemId.toString();
			String[] list = new File(basePath).list();

			Integer total = list.length;
			for(index = 0; index < total; index++){
				if (!list[index].endsWith(".in")) {
					continue;
				}
				
				TestFileBean testFile = new TestFileBean();
				testFile.setProblemId(problemId);
				
				String inFileName = list[index];
				String outFileName = inFileName.split("\\.")[0] + ".out";
				//System.out.println(inFileName + " "+ outFileName);
				String ipath = Config.getValue("OJ_DATA_PATH") + problemId.toString() + "\\" + inFileName;
				String opath = Config.getValue("OJ_DATA_PATH") + problemId.toString() + "\\" + outFileName;
				File iFile = new File(ipath);			
				if (iFile.exists()) {
					testFile.setInFileName(inFileName);
					testFile.setInputString(StreamHandler.readEx(iFile).replaceAll("<", "&lt;")
							  .replaceAll(">", "&gt;")
							  .replaceAll("\n", "<br>")
							  .replaceAll(" ", "&nbsp;"));
				}
				
				File oFile = new File(opath);			
				if (oFile.exists()) {
					testFile.setOutFileName(outFileName);
					testFile.setOutputString(StreamHandler.readEx(oFile).replaceAll("<", "&lt;")
							  .replaceAll(">", "&gt;")
							  .replaceAll("\n", "<br>")
							  .replaceAll(" ", "&nbsp;"));
				}
				
				testFiles.add(testFile);
			}

		}catch(Exception e) {
			return SUCCESS;
		}
		return SUCCESS;
	}
}
