package com.isscollege.gdce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {
    @RequestMapping("/manage")
    public String test1(){
        return "contentManage";
    }

    @RequestMapping("/gosuper")
    public String gourl(){
        return "user/superManager";
    }
}