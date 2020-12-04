package com.isscollege.gdce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/custom")
public class CustomController {
    @RequestMapping("/main")
    public String custom(){
        return "customService";
    }
    @RequestMapping("/wellcom")
    @ResponseBody
    public String wellcom(){
        return "欢迎使用国电煤炭交易平台客服咨询中心，有什么可以帮您？#16##16##16#";
    }
}
