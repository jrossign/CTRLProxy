package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.MessageItem;
import com.ipc.ctrlproxy.model.status.Status;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class StatusHelper {


    public List<Message> buildStatusHeader(boolean isSuccess, String msg) {
        List<Message> messages = new ArrayList<>();
        messages.add(Message.builder()
                .type(isSuccess?"S":"E")
                .message(msg)
                .build());
        return messages;
    }
    public boolean buildMessageItems(final String msg, final int status, final String body, final List<MessageItem> responses) {
        boolean isSuccess = !body.toUpperCase().contains("ERROR"); // TODO
        String type = isSuccess?"S":"E";
        MessageItem item = MessageItem.builder()
                .status(isSuccess?"1":"2")
                .messages(Arrays.asList(
                        Message.builder().type(type).message(msg).build(),
                        Message.builder().type(type).message("StatusCode : " + status).build(),
                        Message.builder().type(type).message("Body : " + body).build()))
                .build();
        responses.add(item);
        return isSuccess;
    }

    public Status buildStatus(boolean success, String msg, List<MessageItem> responses) {
        return
                Status.builder()
                        .webservice("0")
                        .status(success?"1":"2")
                        .messageHeader(buildStatusHeader(success, msg))
                        .messageItem(responses)
                        .build();
    }
}
