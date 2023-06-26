package com.example.projectjobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class welcomeController {
    @RequestMapping("/")
    public String getWelcomePage(Model model){
        return "welcome";
    }
//    @RequestMapping(value = "/signUpPage.htm", method = RequestMethod.POST)
//    public String getSignUpPage(){
//        return "signUp";
//    }

    @RequestMapping("/about-us")
    public String getAboutUsPage(Model model){
        return "about-us";
    }

    @RequestMapping("/category")
    public String getCategoryPage(Model model){
        return "category";
    }

    @RequestMapping("/subscription")
    public String getSubscriptionPage(Model model){
        return "subscription";
    }

    @RequestMapping("/blog-home")
    public String getBlogPage(Model model){
        return "blog-home";
    }

    @RequestMapping("/contact")
    public String getContactPage(Model model){
        return "contact";
    }



}
