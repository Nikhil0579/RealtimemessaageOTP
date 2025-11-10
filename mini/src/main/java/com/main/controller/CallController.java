package com.main.controller;

import com.main.model.SignalMessage;
import com.main.service.SignalingService;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CallController {

    private final SignalingService signalingService;

    public CallController(SignalingService signalingService) {
        this.signalingService = signalingService;
    }

    @GetMapping("/call")
    public String home() {
        return "call";
    }

    @MessageMapping("/send")
    public void handleSignal(@Payload SignalMessage message) {
        signalingService.sendSignal(message);
    }
}
