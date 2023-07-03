package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeekerPreference;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JobSeekerPreferenceDao extends JpaRepository<JobSeekerPreference,Integer> {
    @Query("SELECT p FROM JobSeekerPreference p WHERE p.jobSeeker.jobSeekerId = :jobSeekerId ")
    List<JobSeekerPreference> getPreferenceListByJobSeekerId(int jobSeekerId);
}
