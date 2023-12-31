package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobSeekerQualification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JobSeekerQualificationDao extends JpaRepository<JobSeekerQualification, Integer> {
    @Query("SELECT q FROM JobSeekerQualification q WHERE q.jobSeeker.jobSeekerId =:jobSeekerId")
    List<JobSeekerQualification> getQualificationsByJobSeekerId(int jobSeekerId);
    @Modifying
    @Query("DELETE FROM JobSeekerQualification q WHERE q.jobSeeker.jobSeekerId =:jobSeekerId AND q.jobSeekerQualificationId =:jobSeekerQuaId")
    void deleteQualificationsByJobSeekerIdAndQuaId(int jobSeekerId, int jobSeekerQuaId);
}
