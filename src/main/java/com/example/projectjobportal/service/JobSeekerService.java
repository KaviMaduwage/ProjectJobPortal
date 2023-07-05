package com.example.projectjobportal.service;

import com.example.projectjobportal.model.JobSeeker;

public interface JobSeekerService {

    JobSeeker getJobSeekerByUserId(int userId);

    JobSeeker saveJobSeeker(JobSeeker jobSeeker);

    JobSeeker getJobSeekerByJobSeekerId(int i);
}
