package com.ipc.ctrlproxy.exception;

import com.ipc.ctrlproxy.model.status.Status;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler
{

    //other exception handlers

    @ExceptionHandler(CRTLException.class)
    protected ResponseEntity<Status> handleEntityNotFound(CRTLException ex) {
        return buildResponseEntity(ex.status);
    }

    private ResponseEntity<Status> buildResponseEntity(Status status) {
        return new ResponseEntity<>(status, HttpStatus.OK);
    }
}