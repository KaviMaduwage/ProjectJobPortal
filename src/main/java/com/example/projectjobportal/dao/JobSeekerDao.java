package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeeker;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobSeekerDao extends JpaRepository<JobSeeker, Integer> {
}
