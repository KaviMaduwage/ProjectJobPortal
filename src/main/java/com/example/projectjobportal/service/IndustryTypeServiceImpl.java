package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.IndustryTypeDao;
import com.example.projectjobportal.model.IndustryType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndustryTypeServiceImpl implements IndustryTypeService {
    IndustryTypeDao industryTypeDao;

    public IndustryTypeServiceImpl(IndustryTypeDao industryTypeDao) {
        this.industryTypeDao = industryTypeDao;
    }

    @Override
    public List<IndustryType> getAllIndustryTypes() {
        return industryTypeDao.findAll();
    }

    @Override
    public IndustryType getIndustryTypeById(int industryTypeId) {
        return industryTypeDao.findById(industryTypeId).get();
    }
}
