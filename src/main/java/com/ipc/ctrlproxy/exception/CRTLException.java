package com.ipc.ctrlproxy.exception;

import com.ipc.ctrlproxy.model.status.Status;

public class CRTLException extends Exception
{
    public Status status;

    public CRTLException(Status status) {
        this.status = status;
    }
}
