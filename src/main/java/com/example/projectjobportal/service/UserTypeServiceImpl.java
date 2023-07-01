package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.UserTypeDao;
import com.example.projectjobportal.model.UserType;
import org.springframework.stereotype.Service;

@Service
public class UserTypeServiceImpl implements UserTypeService {
    UserTypeDao userTypeDao;

    public UserTypeServiceImpl(UserTypeDao userTypeDao) {
        this.userTypeDao = userTypeDao;
    }


    @Override
    public UserType getUserTypeById(int userTypeId) {
        return userTypeDao.findById(userTypeId).get();
    }
}
