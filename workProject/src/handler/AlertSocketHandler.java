package handler;

import java.io.IOException;
import java.util.*;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component(value="ws")
public class AlertSocketHandler extends TextWebSocketHandler{
	
	public Map<String, WebSocketSession> users;
	
	@PostConstruct		//초기화 어노테이션
	public void init(){
		users = new HashMap<String, WebSocketSession>();
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
	}
	
	
	//접속을 반응했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> attr = session.getAttributes();
		users.put((String)attr.get("login"), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getAttributes().get("login"));
	}
	
	
	public void sendMessage(String target, String message){
		if(users.containsKey(target)){
			try {
				users.get(target).sendMessage(new TextMessage(message));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
}
