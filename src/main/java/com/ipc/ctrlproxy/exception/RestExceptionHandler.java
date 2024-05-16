package com.ipc.ctrlproxy.exception;

import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.Status;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.Arrays;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler
{
    @ExceptionHandler(Exception.class)
    protected ResponseEntity<Status> handleException(Exception e) {
        return new ResponseEntity<>(Status.builder()
                .status("2")
                .messageHeader(Arrays.asList(
                        Message.builder().type("E").message("StatusCode : " + HttpStatus.INTERNAL_SERVER_ERROR).build(),
                        Message.builder().type("E").message("Body : " + e.getMessage()).build()))
                .build(), HttpStatus.OK);
    }

}