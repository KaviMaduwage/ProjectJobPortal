package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.JobFieldDao;
import com.example.projectjobportal.model.JobField;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class JobFieldServiceImpl implements JobFieldService{

    JobFieldDao jobFieldDao;

    public JobFieldServiceImpl(JobFieldDao jobFieldDao) {
        this.jobFieldDao = jobFieldDao;
    }

    @Override
    public List<JobField> getJobFieldList() {
        List<JobField> jobFieldList = jobFieldDao.findAll();
        return jobFieldList;
    }
}
