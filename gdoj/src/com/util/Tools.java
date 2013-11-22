package com.util;

import info.monitorenter.cpdetector.io.CodepageDetectorProxy;
import info.monitorenter.cpdetector.io.JChardetFacade;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.io.IOUtils;

import com.Ostermiller.util.CSVParser;

/**
 * 
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
public class Tools {
	
	/**
	 * htm
	 * @param str
	 * @return
	 */
	public static String toHTMLChar(String str) {  
		if (str == null) {
			return "";
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < str.length(); i++){
			char c = str.charAt(i);
			if (c == '&'){
				sb.append("&#38;");
			} else if (c == '"'){
				sb.append("&#34;");
			} else if (c == '\''){
				sb.append("&#39;");
			} else if (c == '<'){
				sb.append("&lt;");
			} else if (c == '>'){
				sb.append("&gt;");
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}
	
	/**
	 * html
	 * @param str
	 * @return
	 */
	public static String toPlainChar(String str) {  
		if (str == null) {
			return "";
		}
		return str.replaceAll("&#38;", "&").replaceAll("&#34;", "\"").replaceAll("&#39;", "'").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
	}
	
	/**
	 * 
	 * @return
	 */
	public static String dropScript(String html) {
		return html == null ? null : html.replaceAll("(?i)(?<=(\\b|java))script\\b", "ï½“cript");
	}

	/**
	 * 
	 * @param method http
	 * @param proposedCharset harset
	 * @return
	 * @throws IOException
	 */
	public static String getHtml(HttpMethodBase method, String proposedCharset) throws IOException {
		byte[] contentInByte = IOUtils.toByteArray(method.getResponseBodyAsStream());
		Charset charset = null;
		try {
			charset = Charset.forName(proposedCharset);
		} catch (Exception e) {}
		if (charset == null) {
			Header header = method.getResponseHeader("Content-Type");
			if (header != null) {
				Matcher matcher = Pattern.compile("(?i)charset=([-_\\w]+)").matcher(header.getValue());
				if (matcher.find()) {
					try {
						charset = Charset.forName(matcher.group(1));
					} catch (Exception e) {}
				}
			}
		}
		if (charset == null) {
			String tmpHtml = new String(contentInByte, "UTF-8");
			Matcher matcher = Pattern.compile("(?i)charset=([-_\\w]+)").matcher(tmpHtml);
			if (matcher.find()) {
				try {
					charset = Charset.forName(matcher.group(1));
				} catch (Exception e) {}
			}
		}
		if (charset == null) {
			charset = Charset.forName("UTF-8");
		}
		System.out.println(charset.name());
		return new String(contentInByte, charset);
	}
	
	/**
	 *®¹
	 * @param xls
	 * @return
	 * @throws IndexOutOfBoundsException
	 * @throws BiffException
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static String[][] splitCellsFromExcel(File xls) throws IndexOutOfBoundsException, BiffException, FileNotFoundException, IOException {
		Sheet rs = Workbook.getWorkbook(new FileInputStream(xls)).getSheet(0);
		ArrayList<String[]> tmpContent = new ArrayList<String[]>();
		for (int i = 0; i < rs.getRows(); i++) {
			List row = new ArrayList<String>(); 
			for (int j = 0; j < rs.getColumns(); j++) {
				row.add(rs.getCell(j, i).getContents().trim());
			}
			tmpContent.add((String[]) row.toArray(new String[0]));
		}
		return tmpContent.toArray(new String[0][]);
	}

	/**
	 *®¹
	 * @param csv
	 * @return
	 * @throws IOException
	 */
	public static String[][] splitCellsFromCsv(File csv) throws IOException {
		//
		CodepageDetectorProxy detector = CodepageDetectorProxy.getInstance();  
		detector.add(JChardetFacade.getInstance());  
		Charset charset = Charset.forName("GB2312");
		InputStream inputStream = new BufferedInputStream(new FileInputStream(csv));
		int length = 100000;
		while (length > 5) {
			try {
				charset = detector.detectCodepage(inputStream, length);
				break;
			} catch (Exception ex) {
				ex.printStackTrace();
				length = length * 2 / 3;
			}
		}
		System.out.println(charset.name());
		CSVParser shredder = new CSVParser(new InputStreamReader(inputStream, charset));
		return shredder.getAllValues();
	}
	
	/**
	 * 
	 * @param text
	 * @param reg
	 * @param i
	 * @return
	 */
	public static String regFind(String text, String reg, int i){
		Matcher m = Pattern.compile(reg, Pattern.CASE_INSENSITIVE).matcher(text);
		return m.find() ? m.group(i) : "";
	}

	/**
	 *
	 * @param text
	 * @param reg
	 * @param i
	 * @return
	 */
	public static String regFind(String text, String reg){
		return regFind(text, reg, 1);
	}
	
	/**
	 *
	 * @param text
	 * @param reg
	 * @param i
	 * @return
	 */
	public static String regFindCaseSensitive(String text, String reg, int i){
		Matcher m = Pattern.compile(reg).matcher(text);
		return m.find() ? m.group(i) : "";
	}

	/**
	 * 
	 * @param text
	 * @param reg
	 * @param i
	 * @return
	 */
	public static String regFindCaseSensitive(String text, String reg){
		return regFindCaseSensitive(text, reg, 1);
	}
	
	/**
	
	 */
	public static String toDBC(String input) {
		char c[] = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			if (c[i] == '\u3000') {
				c[i] = ' ';
			} else if (c[i] > '\uFF00' && c[i] < '\uFF5F') {
				c[i] = (char) (c[i] - 65248);
			}
		}
		return new String(c);
	}
	
	/**
	
	 * @return
	 */
	public static String transPeriod(Long length, boolean hasDay){
		long d = length / 86400000;
		long h = (hasDay ? length % 86400000 : length) / 3600000;
		long m = length % 3600000 / 60000;
		long s = length % 60000 / 1000;
		return (hasDay && d > 0 ? (d + "Ìì") : "") + h + ":" + (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;    
	}
	
	/**
	 * 
	 * @param srcLang
	 * @return
	 */
	public static String findClass4SHJS(String srcLang) {
		srcLang = " " + srcLang.toLowerCase() + " ";
		if (srcLang.contains("c++") || srcLang.contains("cpp") || srcLang.contains("g++")){
			return "sh_cpp";
		} else if (srcLang.contains(" c ") || srcLang.contains("gcc")){
			return "sh_c";
		} else if (srcLang.contains("c#")){
			return "sh_csharp";
		} else if (srcLang.contains("java ")){
			return "sh_java";
		} else if (srcLang.contains("pascal") || srcLang.contains("fpc")){
			return "sh_pascal";
		} else if (srcLang.contains("tcl")){
			return "sh_tcl";
		} else if (srcLang.contains("scala")){
			return "sh_scala";
		} else if (srcLang.contains("perl")){
			return "sh_perl";
		} else if (srcLang.contains("python")){
			return "sh_python";
		} else if (srcLang.contains("ruby")){
			return "sh_ruby";
		} else if (srcLang.contains("php")){
			return "sh_php";
		} else if (srcLang.contains("prolog")){
			return "sh_prolog";
		} else if (srcLang.contains("javascript")){
			return "sh_javascript";
		} else {
			return "sh_c";
		}
	}
	
	 public static void  excuteCommand(String command)
	    {
	    
	        Runtime r = Runtime.getRuntime();
	        Process p;
	            try {

	                p = r.exec(command);
	                BufferedReader br = new BufferedReader(new InputStreamReader(p
	                        .getInputStream()));
	                String inline;
	                while ((inline = br.readLine()) != null) {
	                    System.out.println(inline);
	                    
	                }
	                br.close();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }

	    }

	    public static void main(String[] args) throws IOException {
	    	String content = "d:\n cd oj\n call judge-all.exe";
	    	StreamHandler.write("c://tmp.bat", content);
		/*	String[] cmd={"c://tmp.bat","1"};  
			try {			
				Runtime.getRuntime().exec(cmd);	
			} catch (IOException e) {	
				e.printStackTrace();
			}
			*/
	    	
	    	excuteCommand("c://tmp.bat");
		    //setValue("OJ_PATH","D\:\\OJ\\");
	    }
}
