package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.UserDao;
import com.example.projectjobportal.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    UserDao userDao;


    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User getUserByUserName(String userName) {
        User user = userDao.getUserByUserName(userName);
        return user;
    }
}
