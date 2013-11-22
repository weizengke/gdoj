package com.gdoj.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.zip.ZipFile;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.ZipToFile;

public class UploadFileAction  extends ActionSupport{
	private List<File> file;
	private Integer problemId;
	private List<String> fileFileName;
	
	
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public String execute() throws Exception {
		try {
			// TODO Auto-generated method stub
			// 设置文件上传到的目的地路径
			String root = Config.getValue("OJ_DATA_PATH")
					+ problemId.toString() + "\\";
			File file_ = new File(root);
			// 判断目标目录是否存在，不存在则创建
			if (false == file_.exists()) {
				file_.mkdirs();
				file_ = null;
			}
			for (int i = 0; i < file.size(); i++) {

				try {
					ZipFile zipFile = null;
					// 检查是否是zip文件
					zipFile = new ZipFile(file.get(i));
					zipFile.close();

					ZipToFile.unzip(file.get(i), root);

				} catch (Exception e) {
					// TODO: handle exception
					// 获得哪个文件输入流
					//System.out.println(fileFileName.get(i));
					InputStream is = new FileInputStream(file.get(i));

					// 获取目标目录，以及生成文件名字
					File destFile = new File(root, fileFileName.get(i));
					//	System.out.println("FileName:"+destFile.getName());
					OutputStream os = new FileOutputStream(destFile); // 创建文件流对象
					// 进行文件流写入
					byte[] buffer = new byte[300];
					int length = 0;
					while ((length = is.read(buffer)) > 0) {
						//System.out.println("buffer:"+buffer);
						os.write(buffer, 0, length);
					}
					os.flush();
					is.close();
					os.close();

				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return "success";
	}
}
