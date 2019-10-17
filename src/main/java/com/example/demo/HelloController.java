package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Title:
 * @Author: yangchunming
 * @Date: 2019/10/18 0:54
 */
@RestController("/")
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "hello.";
    }
}
