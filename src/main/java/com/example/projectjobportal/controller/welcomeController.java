package com.example.projectjobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class welcomeController {
    @RequestMapping("/")
    public String getWelcomePage(Model model){
        return "welcome";
    }

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

    @RequestMapping("/login")
    public String getLoginPage(Model model){

        return "login";
    }

    @GetMapping("/logOut")
    public String logout(HttpSession session) {
        // Invalidate the session to remove all session attributes
        session.invalidate();

        return "welcome";
    }



}
