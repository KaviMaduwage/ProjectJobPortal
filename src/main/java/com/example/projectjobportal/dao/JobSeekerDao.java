package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeeker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface JobSeekerDao extends JpaRepository<JobSeeker, Integer> {
    @Query("SELECT j FROM JobSeeker j WHERE j.user.userId = :userId ")
    JobSeeker getJobSeekerByUserId(int userId);
}
