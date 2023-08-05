package com.example.projectjobportal.service;

import com.example.projectjobportal.model.JobSeekerQualification;

import java.util.List;

public interface JobSeekerQualificationService {
    void saveAllJobSeekerQualifications(List<JobSeekerQualification> jobSeekerQualificationList);

    List<JobSeekerQualification> getQualificationsByJobSeekerId(int jobSeekerId);

    void deleteQualificationsByJobSeekerIdAndQuaId(int jobSeekerId, int jobSeekerQuaId);
}
