package com.company.spring_annotation.board;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* ReviewService.*(..))")
    public void logBeforeMethodCall(JoinPoint joinPoint) {
        System.out.println("Before calling method: " + joinPoint.getSignature().getName());
        System.out.println("Arguments: " + Arrays.toString(joinPoint.getArgs()));
    }

    @AfterReturning(pointcut = "execution(* ReviewService.*(..))", returning = "result")
    public void logAfterMethodCall(JoinPoint joinPoint, Object result) {
        System.out.println("After calling method: " + joinPoint.getSignature().getName());
        System.out.println("Returning: " + result);
    }
}
