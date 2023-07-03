package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.JobSeekerDao;
import com.example.projectjobportal.model.JobSeeker;
import org.springframework.stereotype.Service;

@Service
public class JobSeekerServiceImpl implements JobSeekerService{
    JobSeekerDao jobSeekerDao;

    public JobSeekerServiceImpl(JobSeekerDao jobSeekerDao) {
        this.jobSeekerDao = jobSeekerDao;
    }

    @Override
    public JobSeeker getJobSeekerByUserId(int userId) {
        return jobSeekerDao.getJobSeekerByUserId(userId);
    }

    @Override
    public JobSeeker saveJobSeeker(JobSeeker jobSeeker) {
        return jobSeekerDao.save(jobSeeker);
    }
}
