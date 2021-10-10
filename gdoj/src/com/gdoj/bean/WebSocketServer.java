package com.gdoj.bean;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/ws/websocket/{sid}")
public class WebSocketServer {
    private String sid = "";
    private static Session session;
    private static TelnetComponent telnetComponent;
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();

    public WebSocketServer getWebSocketServerById(String sessionId) {
        for (WebSocketServer item : webSocketSet) {
            if (item.session.getId().equals(sessionId)) {
                return item;
            }
        }
        return null;
    }

    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(Session session, @PathParam("sid") String sid) {
        System.out.println("new session: "+session.getId());

        this.telnetComponent = new TelnetComponent(session.getId());
        this.sid = sid;
        this.session = session;
        webSocketSet.add(this);

        try {
            this.telnetComponent.openSession(sid,23);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        } catch (InterruptedException e) {
            e.printStackTrace();
            return;
        }

    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session, CloseReason reason) {
        WebSocketServer webSocket = getWebSocketServerById(session.getId());
        if (webSocket == null) {
            return;
        }
        webSocketSet.remove(webSocket);
        try {
            webSocket.telnetComponent.closeSession();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
	public void onMessage(String message, Session session) {
        //System.out.println("recv message from " + session.getId() + " "+ this.session.getId() + ":" + message);
        WebSocketServer webSocket = getWebSocketServerById(session.getId());
        if (webSocket == null) {
            return;
        }
        try {
            webSocket.telnetComponent.sendCommand(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	/**
	 *
	 * @param session
	 * @param error
	 */
    @OnError
    public void onError(Session session, Throwable error) {
    	System.out.println("发生错误");
    }

    /**
     * 发送自定义消息
     * */
    public static void sendInfo(String sessionId, String message) throws IOException {
        for (WebSocketServer item : webSocketSet) {
            System.out.println("sendinfo:" + sessionId + " "+ item.session.getId());
            try {
            	if(sessionId == null) {
                    item.session.getBasicRemote().sendText(message);
            	}else if(item.session.getId().equals(sessionId)){
                    item.session.getBasicRemote().sendText(message);
            		break;
            	}
            } catch (IOException e) {
                continue;
            }
        }
    }
    public static void close(String sessionId) {
        try {
            for (WebSocketServer item : webSocketSet) {
                if (item.session.getId() == sessionId) {
                    item.session.close();
                    webSocketSet.remove(item);
                }
            }
        } catch (IOException e) {
        }
    }

    public static TelnetComponent getTelnetComponent() {
        return telnetComponent;
    }

    public static void setTelnetComponent(TelnetComponent telnetComponent) {
        WebSocketServer.telnetComponent = telnetComponent;
    }

}

