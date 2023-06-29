package com.example.projectjobportal.service;

import com.example.projectjobportal.model.User;

public interface UserService{
    User getUserByUserNameOrEmail(String name);

}
