package com.main.service;

import com.vonage.client.VonageClient;
import com.vonage.client.sms.MessageStatus;
import com.vonage.client.sms.SmsSubmissionResponse;
import com.vonage.client.sms.messages.TextMessage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class OtpService {

    @Value("${vonage.api.key}")
    private String apiKey;

    @Value("${vonage.api.secret}")
    private String apiSecret;

    @Value("${vonage.sms.from}")
    private String fromName;

    public String sendOtp(String phoneNumber, String otp) {
        try {
            VonageClient client = VonageClient.builder()
                    .apiKey(apiKey)
                    .apiSecret(apiSecret)
                    .build();

            TextMessage message = new TextMessage(fromName,
                    phoneNumber,
                    "Your OTP code is: " + otp);

            SmsSubmissionResponse response = client.getSmsClient().submitMessage(message);

            if (response.getMessages().get(0).getStatus() == MessageStatus.OK) {
                return "OTP sent successfully!";
            } else {
                return "Failed to send OTP: " + response.getMessages().get(0).getErrorText();
            }
        } catch (Exception e) {
            return "Error sending OTP: " + e.getMessage();
        }
    }
}
