package com.gdoj.bean;

import org.apache.commons.net.telnet.TelnetClient;

import javax.websocket.Session;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class TelnetComponent {
    private TelnetClient telnetClient = null;
    private InputStream inputStream;
    private OutputStream outputStream;
    private Thread outputThread;
    private String sessionId = "";

    public TelnetComponent(String sessionId) {
        this.sessionId = sessionId;
    }
    public void openSession(String ip, Integer port) throws IOException, InterruptedException {

        if (outputThread != null) {
            outputThread.interrupt();
        }

        telnetClient = new TelnetClient();
        telnetClient.connect(ip,port);

        inputStream = telnetClient.getInputStream();
        outputStream = telnetClient.getOutputStream();

        outputThread = new InputPrintThread(sessionId, inputStream);

        //守护线程
        outputThread.setDaemon(true);
        outputThread.start();
    }

    public String sendCommand(String send) throws IOException {
        if (null == telnetClient) {
            return "连接已关闭";
        }
        outputStream.write(send.getBytes());
        outputStream.flush();

        return "发送成功";
    }

    public void closeSession() throws IOException {
        if (telnetClient != null) {
            telnetClient.disconnect();
            outputThread.interrupt();
            telnetClient = null;
            System.out.println("telent connect close..");
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException {

        TelnetComponent telnetComponent = new TelnetComponent("11");

        telnetComponent.openSession("127.0.0.1",23);

        telnetComponent.sendCommand("system");

        //telnetComponent.closeSession();
    }    
}
