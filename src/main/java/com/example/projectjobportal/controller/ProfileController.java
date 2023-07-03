package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @RequestMapping("/viewProfile")
    public String getProfilePage(Model model, HttpSession session){
        User user = (User) session.getAttribute("userLogin");
        if(user.getUserType().getDescription().equalsIgnoreCase("jobSeeker")){
            return "jobSeekerProfile";
        }else if(user.getUserType().getDescription().equalsIgnoreCase("employer")){
            return "employerProfile";
        }
        return "welcome";

    }
}
