package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.EmployerDao;
import com.example.projectjobportal.model.Employer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployerServiceImpl implements EmployerService {

    EmployerDao employerDao;

    public EmployerServiceImpl(EmployerDao employerDao) {
        this.employerDao = employerDao;
    }

    @Override
    public List<Employer> getEmployerByIndustryTypeId(int industryTypeId) {
        return employerDao.getEmployerByIndustryTypeId(industryTypeId);
    }

    @Override
    public Employer saveEmployer(Employer employer) {
        return employerDao.save(employer);
    }


}
