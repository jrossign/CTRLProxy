package com.ipc.ctrlproxy.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.StopWatch;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
@Aspect
@Slf4j
public class AopConfiguration {

    @Pointcut("@annotation(com.ipc.ctrlproxy.config.Measured)")
    public void loggableMethods() {}

    @Around("loggableMethods()")
    public Object measuredMethods(ProceedingJoinPoint joinPoint) throws Throwable {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        try {
            return joinPoint.proceed();
        }
        finally {
            stopWatch.stop();
            log.info("Measured time on {} : {} ms", joinPoint.getSignature().toString(), stopWatch.getTime());
        }
    }
}
