package com.example.projectjobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
    @RequestMapping("/about-us")
    public String getAboutUsPage(Model model){
        return "about-us";
    }
}
