package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.User;
import com.example.projectjobportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
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

    @RequestMapping("/getLoginAccess.htm")
    public String getLoginAccess(Model model, HttpServletRequest request, HttpSession session){
        //hold user name or email value
        String name = request.getParameter("userName_email");
        String password = request.getParameter("password");

        User user = userService.getUserByUserNameOrEmail(name);
        if(user != null){
            if(user.getPassword().equals(password)){
                session.setAttribute("userLogin",user);
                return "welcome";
            }else{
                model.addAttribute("errorMessage","Invalid username/email or password");
                return "login";
            }

        }else{
            model.addAttribute("errorMessage","Invalid username/email or password");
            return "login";
        }

    }
}
