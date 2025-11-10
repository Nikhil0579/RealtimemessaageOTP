package com.main.model;

public class SignalMessage {
    private String type;
    private String from;
    private String to;
    private String data;

    public SignalMessage() {}

    public SignalMessage(String type, String from, String to, String data) {
        this.type = type;
        this.from = from;
        this.to = to;
        this.data = data;
    }

    // Getters and Setters
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getFrom() { return from; }
    public void setFrom(String from) { this.from = from; }

    public String getTo() { return to; }
    public void setTo(String to) { this.to = to; }

    public String getData() { return data; }
    public void setData(String data) { this.data = data; }
}
