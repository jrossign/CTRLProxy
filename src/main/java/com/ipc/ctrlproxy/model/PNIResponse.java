package com.ipc.ctrlproxy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PNIResponse
{
    private String status;
    private String ctrlMessage;
}
