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
* @param oldPath:需要压缩的文件完整物理路径，包括名字 
* @param newDir：新文件的保存路径，不含名字 
* @param newMainName　新文件的主文件名 
* @param maxBorder　新文件的长度和宽度里面最长的边的长度，按比例缩小另外的一个边,比如要生成 
* 的图形最长的边是64像素，如果是长度比宽度大，那么，生成的长度是64，而宽度就是原始的宽度的等比例缩小的尺寸。 
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