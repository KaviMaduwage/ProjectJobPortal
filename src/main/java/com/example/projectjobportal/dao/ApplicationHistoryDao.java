package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.ApplicationHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ApplicationHistoryDao extends JpaRepository<ApplicationHistory, Integer> {
    @Query("SELECT h FROM ApplicationHistory  h WHERE h.jobSeeker.jobSeekerId = :jobSeekerId AND h.vacancy.vacancyId = :vacancyId")
    ApplicationHistory getAppliedHistoryFromJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId);
}
