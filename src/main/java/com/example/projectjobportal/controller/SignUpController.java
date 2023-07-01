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

    @RequestMapping(value = "/signUp")
    public String getHomePage(Model model, HttpServletRequest request){

        return "signUp";
    }

    @RequestMapping(value = "/jobSeekerSignUp.htm", method = RequestMethod.POST)
    public String jobSeekerSignUp(HttpServletRequest request, Model model){
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        return "signUp";
    }
    @RequestMapping(value = "/employerSignUp.htm", method = RequestMethod.POST)
    public String employerSignUp(HttpServletRequest request, Model model){
        String companyName = request.getParameter("companyName");
        String address = request.getParameter("address");
        String telNo = request.getParameter("telNo");
        String headquarters = request.getParameter("headquarters");
        String description = request.getParameter("description");
        String noOfEmployees = request.getParameter("noOfEmployees");
        String found = request.getParameter("found");
        String website = request.getParameter("website");
        String companyLogo = request.getParameter("companyLogo");


        return "signUp";
    }
}
