package com.rakib.sms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String helloMessage(ModelMap map) {
        map.addAttribute("hello", "Welcome to spring");
        map.addAttribute("name","Md. Rakib Hassan");
        return "index";
    }
}
