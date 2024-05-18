package com.ipc.ctrlproxy.model;

import lombok.Builder;

@Builder
public class CTRLResponse {

    public int code;
    public String body;
}
