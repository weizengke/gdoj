package com.util;

import com.sun.image.codec.jpeg.*; 
import java.awt.image.BufferedImage; 
import java.io.*; 
import javax.imageio.*; 
import com.sun.image.codec.jpeg.JPEGImageEncoder; 

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class CompressImage 
{ 
/** 
* 
* @param oldPath:��Ҫѹ�����ļ���������·������������ 
* @param newDir�����ļ��ı���·������������ 
* @param newMainName�����ļ������ļ��� 
* @param maxBorder�����ļ��ĳ��ȺͿ��������ıߵĳ��ȣ���������С�����һ����,����Ҫ���� 
* ��ͼ����ı���64���أ�����ǳ��ȱȿ�ȴ���ô�����ɵĳ�����64������Ⱦ���ԭʼ�Ŀ�ȵĵȱ�����С�ĳߴ硣 
*/ 
	
	public static void Generate(String oldPath,String newDir,String newMainName,int maxBorder) { 
		File souFile=new File(oldPath); 
	// String a=souFile.getAbsolutePath(); 
	// int a1=1; 
		try { 
			String newPath; 
			if (newDir.equals("")) 
				newPath = newMainName; 
			else 
				newPath =newDir + "\\" + newMainName; 
			FileOutputStream desFile = new FileOutputStream(new File(newPath)); 
			BufferedImage souImage = ImageIO.read(souFile); 
			int oldWidth = souImage.getWidth(); 
			int oldHeight = souImage.getHeight(); 
			int newWidth, newHeight; 
			if (oldWidth > oldHeight) { 
				newWidth = maxBorder; 
				newHeight = (int) (newWidth * oldHeight / 
				oldWidth); 
			} 
			else { 
				newHeight = maxBorder; 
				newWidth = (int) (oldWidth * newHeight / 
				oldHeight); 
			} 
			BufferedImage desImage = new BufferedImage( newWidth, newHeight,1); 
										desImage.getGraphics().drawImage(souImage,0,0,newWidth,newHeight, 
										null); 
			JPEGImageEncoder jpegEncode = JPEGCodec.createJPEGEncoder(desFile); 
			jpegEncode.encode(desImage); 
			desFile.close(); 
		} 
		catch (ImageFormatException ex) { 
			ex.printStackTrace(); 
		} 
		catch (IOException ex) { 
			ex.printStackTrace(); 
		} 
		catch (Exception e) 
		{ 
			e.printStackTrace(); 
		} 
	} 

	public static void main(String[] args)
    {
		Generate("D:\\Tomcat5\\webapps\\gdoj\\image\\userphoto\\ACSolo\\ACSolo.jpg","D:\\Tomcat5\\webapps\\gdoj\\image\\userphoto\\ACSolo",
				"AC_s",80);
    }
}