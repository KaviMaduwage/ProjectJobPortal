package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.JobSeekerQualificationDao;
import com.example.projectjobportal.model.JobSeekerQualification;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobSeekerQualificationServiceImpl implements JobSeekerQualificationService{
    JobSeekerQualificationDao jobSeekerQualificationDao;

    public JobSeekerQualificationServiceImpl(JobSeekerQualificationDao jobSeekerQualificationDao) {
        this.jobSeekerQualificationDao = jobSeekerQualificationDao;
    }

    @Override
    public void saveAllJobSeekerQualifications(List<JobSeekerQualification> jobSeekerQualificationList) {
        jobSeekerQualificationDao.saveAll(jobSeekerQualificationList);
    }

    @Override
    public List<JobSeekerQualification> getQualificationsByJobSeekerId(int jobSeekerId) {
        return jobSeekerQualificationDao.getQualificationsByJobSeekerId(jobSeekerId);
    }
}
