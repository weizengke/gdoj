package com.gdoj.common.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.stereotype.Controller;
import com.util.ImageUtils;

import com.opensymphony.xwork2.ActionSupport;

@Controller
public class ImageUploadAction extends ActionSupport{
	
	private static final long serialVersionUID = 6624518147834729694L;

	//图片对象
	private File imgFile;
	//图片宽度
	private String imgWidth;
	//图片高度
	private String imgHeight;
	//图片对齐方式
	private String align;
	//图片标题
	private String imgTitle;
	
	public String uploadImage() throws Exception{
		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
		
		//获得图片名字
		String imgName = wrapper.getFileNames("imgFile")[0];
		
		//获得图片后缀名
		String fileExt = imgName.substring(imgName.lastIndexOf(".")).toLowerCase();
		
		//重新生成图片名字
		String imgN = new Date().getTime() + fileExt;
		
		//图片在服务器上的绝对路径。编辑器并没有提供删除图片功能，此路径以后可以用于后台程序对图片的操作
		String serverPath = ServletActionContext.getRequest().getRealPath("/upload");
		//页面的引用地址
		String savePath = "/upload/";
		//实际应用中鉴于地址的可变性，此处的两个path可以动态生成或从配置文件读取
		
		kEUploadImage(ServletActionContext.getRequest(), ServletActionContext.getResponse(), imgFile, imgTitle, imgWidth, imgHeight, imgN, savePath, serverPath);
		
		return null;
	}
	
	void kEUploadImage(HttpServletRequest request, HttpServletResponse response, File imgFile, String imgTitle, String imgWidth, String imgHeight, String imgName, String savePath, String serverPath) 
			throws FileNotFoundException, IOException{
		
		//将图片写入服务器
		ImageUtils.uploadToServer(imgFile, serverPath, imgName);
		
		//页面回显
		String id = "content";
		String url = savePath + imgName;
		String border = "0";      
		String result ="<mce:script type=\"text/javaScript\">parent.KE.plugin[\"image\"].insert(\""   
		+ id      
		+ "\",\""     
		+ url      
		+ "\",\""     
		+ imgTitle      
		+ "\",\""   
		+ imgWidth      
		+ "\",\""  
		 + imgHeight    
		 + "\",\""  
		+ border + "\""    
		+")";
// --></mce:script>";      
		PrintWriter out = null; 
		out = encodehead(request, response);
		out.write(result);   
		out.close();
	}
	
	PrintWriter encodehead(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");   
			response.setContentType("text/html; charset=utf-8");   
			return response.getWriter();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}   
	}
	
	public File getImgFile() {
		return imgFile;
	}
	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	public String getImgWidth() {
		return imgWidth;
	}
	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}
	public String getImgHeight() {
		return imgHeight;
	}
	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getImgTitle() {
		return imgTitle;
	}
	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle;
	}
}