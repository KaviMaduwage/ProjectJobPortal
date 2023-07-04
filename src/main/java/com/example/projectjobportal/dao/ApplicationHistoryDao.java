package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.ApplicationHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ApplicationHistoryDao extends JpaRepository<ApplicationHistory, Integer> {
    @Query("SELECT h FROM ApplicationHistory  h WHERE h.jobSeeker.jobSeekerId = :jobSeekerId AND h.vacancy.vacancyId = :vacancyId")
    ApplicationHistory getAppliedHistoryFromJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId);

    @Query("SELECT h FROM ApplicationHistory  h WHERE h.jobSeeker.jobSeekerId = :jobSeekerId")
    List<ApplicationHistory> getAppliedJobHistoryByJobSeekerId(int jobSeekerId);
    @Query("SELECT h FROM ApplicationHistory  h WHERE h.vacancy.employer.employerId = :employerId")
    List<ApplicationHistory> getApplicationsByEmployerId(int employerId);

    @Query("SELECT h FROM ApplicationHistory  h WHERE h.vacancy.vacancyId = :vacancyId")
    List<ApplicationHistory> getApplicationsByVacancyId(int vacancyId);
}
