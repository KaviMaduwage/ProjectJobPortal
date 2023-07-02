package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeekerPreference;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobSeekerPreferenceDao extends JpaRepository<JobSeekerPreference,Integer> {
}
