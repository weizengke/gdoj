package com.util;

import java.io.*;
import java.net.*;

public class OJSocket {
	
    public static void SendMsg2Judger(String ip, int port, int msgType, String cmdBuff) {  
		Socket socket;
		try {			
			/* Magic:0xabcddcba
			 * TLV:  type=0x0001; length=strlen(cmdBuff); value=cmdBuff
			 * TLV:  type=0x0002; length=strlen(test-json); value=test-json
			 * */
			String encode = Config.getValue("ENCODE");
			if (encode == null) {
				encode = "UTF-8";
			}
			System.out.println("encode: " + encode);
			String reqStr = String.format("%s%04x%08x%s", "abcddcba", msgType, cmdBuff.getBytes(encode).length, cmdBuff);	
			
			socket = new Socket(ip, port);
			OutputStream outPutStream = socket.getOutputStream();
			outPutStream.write(reqStr.getBytes());
			outPutStream.flush();
			
			System.out.println("SendMsg2Judger to ip:" + ip + " port:"+ port +" reqStr:"+reqStr+", ok.");
			
			socket.close();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			System.out.println("SendMsg2Judger to ip:" + ip + " port:"+ port +" cmdBuff:"+cmdBuff+" , but failed.");
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block			
			//e.printStackTrace();
			System.out.println("SendMsg2Judger to ip:" + ip + " port:"+ port +" cmdBuff:"+cmdBuff+" , but connect failed.");
		}

        return ;  
    }  
    
    public static void JudgeRequest(String ip, int port, Integer solutionId) {  			
		SendMsg2Judger(ip, port, 0x0001, "judge solution "+ solutionId);
        return ;  
    }  
	  
    public static void JudgeTestRequest(String ip, int port, String json) {  			
		SendMsg2Judger(ip, port, 0x0002, json);
        return ;  
    }  
    
	public static void main(String[] args) throws IOException {		
		JudgeRequest("127.0.0.1",5000,1);
	}
}
