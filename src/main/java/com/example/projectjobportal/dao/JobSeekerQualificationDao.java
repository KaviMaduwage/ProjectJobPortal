package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeekerQualification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JobSeekerQualificationDao extends JpaRepository<JobSeekerQualification, Integer> {
    @Query("SELECT q FROM JobSeekerQualification q WHERE q.jobSeeker.jobSeekerId =:jobSeekerId")
    List<JobSeekerQualification> getQualificationsByJobSeekerId(int jobSeekerId);
}
