package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/hello")
    public String myEndpoint() {
        return "hello"; // 이 부분에서 렌더링할 HTML 페이지 이름을 반환합니다.
    }
}