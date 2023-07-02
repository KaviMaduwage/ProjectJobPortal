package com.example.projectjobportal.service;

import com.example.projectjobportal.model.User;
import com.example.projectjobportal.model.UserType;

public interface UserService{
    User getUserByUserNameOrEmail(String name);


    User saveUser(User newUser);
}
