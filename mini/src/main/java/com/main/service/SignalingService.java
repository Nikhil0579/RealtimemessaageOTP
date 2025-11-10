package com.main.service;

import com.main.model.SignalMessage;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
public class SignalingService {
    private final SimpMessagingTemplate messagingTemplate;

    public SignalingService(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    public void sendSignal(SignalMessage message) {
        messagingTemplate.convertAndSendToUser(message.getTo(), "/queue/messages", message);
    }
}
