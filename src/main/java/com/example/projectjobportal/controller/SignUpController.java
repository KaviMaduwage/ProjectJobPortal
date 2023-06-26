package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.User;
import com.example.projectjobportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SignUpController {

    UserService userService;


    public SignUpController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/homePage.htm", method = RequestMethod.POST)
    public String getHomePage(Model model, HttpServletRequest request){
        String userName = request.getParameter("email");
        String password = request.getParameter("password");

        User userDetalil = userService.getUserByUserName(userName);
        if(userDetalil != null){
            model.addAttribute("message","success login");
        }else{
            model.addAttribute("message","error login");
        }
        
        return "home";
    }
}
