package com.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * �ϳ�Բͷ��
 */
public class RoundHeadImgUtil {
    /***
     *
     * @param srcFilePath ԴͼƬ�ļ�·��
     * @param circularImgSavePath �����ɵ�ͼƬ�ı���·������Ҫ���б�����ļ����ͺ�׺
     * @param targetSize �ļ��ı߳�����λ�����أ����յõ�����һ�������ε�ͼ������Ҫ��targetSize<=Դ�ļ�����С�߳�
     * @param cornerRadius Բ�ǰ뾶����λ�����ء����=targetSize��ô�õ�����Բ��ͼ
     * @return  �ļ��ı���·��
     * @throws IOException
     */
    public static String makeCircularImg(String srcFilePath, String circularImgSavePath,int targetSize, int cornerRadius) throws IOException {
        BufferedImage bufferedImage = ImageIO.read(new File(srcFilePath));
        BufferedImage circularBufferImage = roundImage(bufferedImage,targetSize,cornerRadius);
        ImageIO.write(circularBufferImage, "png", new File(circularImgSavePath));
        return circularImgSavePath;
    }
    private static BufferedImage roundImage(BufferedImage image, int targetSize, int cornerRadius) {
        BufferedImage outputImage = new BufferedImage(targetSize, targetSize, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = outputImage.createGraphics();
        g2.setComposite(AlphaComposite.Src);
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(Color.WHITE);
        g2.fill(new RoundRectangle2D.Float(0, 0, targetSize, targetSize, cornerRadius, cornerRadius));
        g2.setComposite(AlphaComposite.SrcAtop);
        g2.drawImage(image, 0, 0, null);
        g2.dispose();
        return outputImage;
    }
    /**
     * ����Բ��ͼ��
     * @param image
     * @param cornerRadius Բ�ǰ뾶
     * @return
     */
    public static BufferedImage makeRoundedCorner1(BufferedImage image, int cornerRadius) {
        int w = image.getWidth();
        int h = image.getHeight();
        BufferedImage output = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = output.createGraphics();
        g2.setComposite(AlphaComposite.Src);
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(Color.WHITE);
        g2.fill(new RoundRectangle2D.Float(0, 0, w, h, cornerRadius, cornerRadius));
        g2.setComposite(AlphaComposite.SrcAtop);
        g2.drawImage(image, 0, 0, null);
        g2.dispose();
        return output;
    }
    /**ͼƬԲ�Ǵ�������͸����
     * @param srcImageFile ԭͼƬ
     * @param result  �����ͼƬ
     * @param type   ͼƬ��ʽ
     * @param cornerRadius  720ΪԲ��
     */
    public  void makeRoundedCorner(File srcImageFile, File result, String type, int cornerRadius) {
        try {
            BufferedImage bi1 = ImageIO.read(srcImageFile);

            // ������Ҫ�Ƿ�ʹ�� BufferedImage.TYPE_INT_ARGB
            BufferedImage image = new BufferedImage(bi1.getWidth(), bi1.getHeight(),
                    BufferedImage.TYPE_INT_ARGB);

            Ellipse2D.Double shape = new Ellipse2D.Double(0, 0, bi1.getWidth(), bi1
                    .getHeight());

            Graphics2D g2 = image.createGraphics();
            image = g2.getDeviceConfiguration().createCompatibleImage(bi1.getWidth(), bi1.getHeight(), Transparency.TRANSLUCENT);
            g2 = image.createGraphics();
            g2.setComposite(AlphaComposite.Clear);
            g2.fill(new Rectangle(image.getWidth(), image.getHeight()));
            g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC, 1.0f));
            g2.setClip(shape);
            // ʹ�� setRenderingHint ���ÿ����
            g2 = image.createGraphics();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.fillRoundRect(0, 0,bi1.getWidth(), bi1.getHeight(), cornerRadius, cornerRadius);
            g2.setComposite(AlphaComposite.SrcIn);
            g2.drawImage(bi1, 0, 0, bi1.getWidth(), bi1.getHeight(), null);
            g2.dispose();
            ImageIO.write(image, type, result);
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    
	public static void main(String[] args)
    {
		BufferedImage image;
		try {
			image = ImageIO.read(new File("D:\\tomcat6\\webapps\\gdoj\\upload\\userphoto\\ACSolo\\photo.jpg"));
			BufferedImage rounded = RoundHeadImgUtil.makeRoundedCorner1(image, 720);
			ImageIO.write(rounded, "png", new File("D:\\tomcat6\\webapps\\gdoj\\upload\\userphoto\\ACSolo\\photo_avar.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}

