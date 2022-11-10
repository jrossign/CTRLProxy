package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.status.Status;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;

@Slf4j
@Component
public class CTRLReceiveServices {

    @Autowired
    private CTRLWebServices webServices;

    public Status receive(final String actionType, final Header header, final List<Details> details) throws IOException {
        return null;
    }
}
