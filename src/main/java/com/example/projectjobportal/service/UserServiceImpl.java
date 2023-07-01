package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.UserDao;
import com.example.projectjobportal.model.User;
import com.example.projectjobportal.model.UserType;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    UserDao userDao;


    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User getUserByUserNameOrEmail(String name) {
        User user = userDao.getUserByUserNameOrEmail(name);
        return user;
    }

    @Override
    public User saveUser(User newUser) {
        User savedUser = userDao.save(newUser);
        return savedUser;
    }


}
