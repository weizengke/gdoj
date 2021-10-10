package com.gdoj.bean;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class InputPrintThread extends Thread {
	private final InputStream inputStream;
    private final String sessionId;

    public InputPrintThread(String sessionId, InputStream inputStream) {
        this.sessionId = sessionId;
        this.inputStream = inputStream;
    }

    @Override
    public void run() {

        int num = 0;
        char[] bytes = new char[1024];
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);

        try {
            while (!interrupted() && (num = inputStreamReader.read(bytes)) != -1) {
                for (int i = 0; i < num; i++) {
                    char ab = bytes[i];
                    //System.out.print(ab);
                    WebSocketServer.sendInfo(sessionId, ab + "");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("Session " + sessionId + " Input print thread close..");
        WebSocketServer.close(sessionId);
    }
}
