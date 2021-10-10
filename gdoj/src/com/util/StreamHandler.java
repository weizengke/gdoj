/**
 * 
 */
package com.util;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;



import com.util.Config;


public class StreamHandler {

	private final static Logger log = Logger.getLogger(StreamHandler.class);
	
	public static void write(OutputStream os, String content) {
		/**
		 * for Runner.
		 */
		try {
			PrintWriter out = new PrintWriter(new BufferedOutputStream(os));
			out.write(content);
			out.close();
		} catch (Exception e) {
			//log.warn("---- write to outputStream catches a IOException, outputStream not available ----");
		}
	}
	public static String readEx(String fileName) {
		/**
		 * read file by fileName, return a String pattern of file's context, or null if throw a IOException.
		 */
		try {
			BufferedReader in = new BufferedReader(new FileReader(fileName));
			StringBuffer sb = new StringBuffer();
			String line = new String();
			while ( (line = in.readLine()) != null ) {
				sb.append(line);
				sb.append("\n");
			}
			in.close();
			return sb.toString();
		} catch (IOException ioe) {
			//log.warn("---- read file by fileName catches a IOException, file not found ----");
			return null;
		}
	}
	public static String read(String fileName) {
		/**
		 * read file by fileName, return a String pattern of file's context, or null if throw a IOException.
		 */
		try {
			BufferedReader in = new BufferedReader(new FileReader(fileName));
			StringBuffer sb = new StringBuffer();
			String line = new String();
			while ( (line = in.readLine()) != null ) {
				sb.append(line.trim());
				sb.append("\n");
			}
			in.close();
			return sb.toString();
		} catch (IOException ioe) {
			//log.warn("---- read file by fileName catches a IOException, file not found ----");
			return null;
		}
	}

	public static String readEx(File file) {
		/**
		 * read file by file, return a String pattern of file's context, or null if throw a IOException.
		 */
		try {
			BufferedReader in = new BufferedReader(new FileReader(file));
			StringBuffer sb = new StringBuffer();
			String line = new String();
			while ( (line = in.readLine()) != null ) {
				sb.append(line);
				sb.append("\n");
			}
			in.close();
			return sb.toString();
		} catch (IOException ioe) {
			//log.warn("---- read file by file catches a IOException, file not found ----");
			return null;
		}
	}
	public static String read(File file) {
		/**
		 * read file by file, return a String pattern of file's context, or null if throw a IOException.
		 */
		try {
			BufferedReader in = new BufferedReader(new FileReader(file));
			StringBuffer sb = new StringBuffer();
			String line = new String();
			while ( (line = in.readLine()) != null ) {
				sb.append(line.trim());
				sb.append("\n");
			}
			in.close();
			return sb.toString();
		} catch (IOException ioe) {
			//log.warn("---- read file by file catches a IOException, file not found ----");
			return null;
		}
	}
	
	public static boolean write(String fileName, String content) {
		/**
		 * write content info file by fileName, return true if success, or false if throw a IOException.
		 */
		try {
			PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(fileName)));
			out.write(content);
			out.close();
			return true;
		} catch (IOException ioe) {
			log.warn("---- write file by fileName catches a IOException ----");
			ioe.printStackTrace();
			return false;
		}
	}
	
	public static boolean write(File file, String content) {
		/**
		 * write content info file by file, return true if success, or false if throw a IOException.
		 */
		try {
			PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(file)));
			out.write(content);
			out.close();
			return true;
		} catch (IOException ioe) {
			log.warn("---- write file by file catches a IOException ----");
			ioe.printStackTrace();
			return false;
		}
	}
	
	
	public static List<File> getFileList(String pathName){
		File file = new File(pathName);
		//log.info("---- load " + file.getAbsolutePath() + " ----");
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			List<File> filelist =new ArrayList<File>();
			for(int i = 0; i < files.length; i++) {
				if(files[i].isFile()){
					filelist.add(files[i]);
				}
			}
			return filelist;
		}
		return null;
	}
	public static List<File> getDirList(String pathName){
		File file = new File(pathName);
		//log.info("---- load " + file.getAbsolutePath() + " ----");
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			List<File> filelist =new ArrayList<File>();
			for(int i = 0; i < files.length; i++) {
				if(!files[i].isFile()){
					filelist.add(files[i]);
				}
			}
			return filelist;
		}
		return null;
	}
	
	/***********************  inputs and outputs files getters ************************/
	public static List<File> getInputFiles(Integer problemId) {
		/**
		 * return a File[] of input-testcase's files by problem's id.
		 */
		File file = new File(Config.getValue("OJ_DATA_PATH") + problemId.toString());
		
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			List<File> filelist =new ArrayList<File>();
			for(int i = 0; i < files.length; i++) {	
				String fileExt=files[i].getName().substring(files[i].getName().lastIndexOf(".")+1,files[i].getName().length());    
				//System.out.println(files[i].getName().lastIndexOf(".")+" "+fileExt+" "+ files[i].getName().length());
				if(fileExt.equals("in")){
					//System.out.println(files[i].getName());
					filelist.add(files[i]);
				}
			}
			return filelist;
		}
		return null;
	}
	
	public static List<String> getInputFilesName(Integer problemId) {
		/**
		 * return a String[] of input-testcase's filesname by problem's id.
		 */
		File file = new File(Config.getValue("OJ_DATA_PATH") + problemId.toString());
	
		//log.info("---- load " + file.getAbsolutePath() + " ----");
		if (file.isDirectory()){		
			File[] files = file.listFiles();
			List<String> filelist =new ArrayList<String>();
			for(int i = 0; i < files.length; i++) {	
				if(files[i].isFile()){
					String fileExt=files[i].getName().substring(files[i].getName().lastIndexOf(".")+1,files[i].getName().length());    
					//System.out.println(files[i].getName().lastIndexOf(".")+" "+fileExt+" "+ files[i].getName().length());
					if(fileExt.equals("in")){
						//System.out.println(files[i].getName());
						filelist.add(files[i].getName());
					}	
				}
			}
			return filelist;
		}
		return null;
	}
	
	public static List<File> getOutputFiles(Integer problemId) {
		/**
		 * return a File[] of output-testcase's files by problem's id.
		 */
		File file = new File(Config.getValue("OJ_DATA_PATH") + problemId.toString());
		//log.info("---- load " + file.getAbsolutePath() + " ----");
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			List<File> filelist =new ArrayList<File>();
			for(int i = 0; i < files.length; i++) {	
				String fileExt=files[i].getName().substring(files[i].getName().lastIndexOf(".")+1,files[i].getName().length());    
				//System.out.println(files[i].getName().lastIndexOf(".")+" "+fileExt+" "+ files[i].getName().length());
				if(fileExt.equals("out")){
					filelist.add(files[i]);
				}
			}
			return filelist;
		}
		return null;
	}
	
	public static List<String> getOutputFilesName(Integer problemId) {
		/**
		 * return a String[] of output-testcase's filesname by problem's id.
		 */
		File file = new File(Config.getValue("OJ_DATA_PATH") + problemId.toString());
		//log.info("---- load " + file.getAbsolutePath() + " ----");
		if(file.isDirectory()){		
			File[] files = file.listFiles();
			List<String> filelist =new ArrayList<String>();
			for(int i = 0; i < files.length; i++) {	
				if(files[i].isFile()){					
					String fileExt=files[i].getName().substring(files[i].getName().lastIndexOf(".")+1,files[i].getName().length());    
					//System.out.println(files[i].getName().lastIndexOf(".")+" "+fileExt+" "+ files[i].getName().length());
					if(fileExt.equals("out")){
						//System.out.println(files[i].getName());
						filelist.add(files[i].getName());
					}	
				}
			}
			return filelist;
		}
		return null;
	}
	public static File[] getFilesList(String path) {
		/**
		 * return a File[] of input-testcase's files by problem's id.
		 */
		File file = new File(Config.getValue("OJ_PATH")+path);
		
		if (file.isDirectory()) 
			return file.listFiles();
		return null;
	}
	public static String[] getFilesNameList(String path) {
		/**
		 * return a File[] of input-testcase's files by problem's id.
		 */
		File file = new File(path);
	
		if (file.isDirectory()) 
			return file.list();
		return null;
	}
	public static void main(String[] args)
    {
		System.out.println("1001");
		getInputFiles(1001);
		
    }
}
