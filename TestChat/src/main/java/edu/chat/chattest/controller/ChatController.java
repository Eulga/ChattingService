package edu.chat.chattest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.socket.WebSocketSession;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller("chatCotroller")
@Log
@Log4j
public class ChatController {
	public int anonymousNumber = 0;
	
	@GetMapping("/chat")
	public void chat(Model model) {
		anonymousNumber++;
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / AN : " + anonymousNumber);
		
		model.addAttribute("AnonymousNumber", anonymousNumber);
	}
}
