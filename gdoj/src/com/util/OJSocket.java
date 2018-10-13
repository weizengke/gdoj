package com.util;

import java.io.*;
import java.net.*;

public class OJSocket {
    public static void SendMsg2Judger(String ip, int port, String cmdBuff) {  
		Socket socket;
		try {			
			/* Magic:0xabcddcba
			 * TLV:  type=0x0001; length=strlen(cmdBuff); value=cmdBuff
			 * */

			String reqStr = String.format("%s%s%04x%s", "abcddcba", "0001", cmdBuff.length(), cmdBuff);	
			
			socket = new Socket(ip, port);
			OutputStream outPutStream = socket.getOutputStream();
			outPutStream.write(reqStr.getBytes());
			outPutStream.flush();
			
			socket.close();
			
			System.out.print("SendMsg2Judger to ip:" + ip + " port:"+ port +" cmdBuff:"+reqStr+".\n");
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			System.out.print("SendMsg2Judger to ip:" + ip + " port:"+ port +" cmdBuff:"+cmdBuff+" , but failed.\n");
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block			
			//e.printStackTrace();
			System.out.print("SendMsg2Judger to ip:" + ip + " port:"+ port +" cmdBuff:"+cmdBuff+" , but connect failed.\n");
		}

        return ;  
    }  
    
    public static void JudgeRequest(String ip, int port, Integer solutionId) {  			
		SendMsg2Judger(ip, port, "judge solution "+ solutionId);
        return ;  
    }  
	  
	public static void main(String[] args) throws IOException {		
		JudgeRequest("127.0.0.1",5000,1);
	}
}
