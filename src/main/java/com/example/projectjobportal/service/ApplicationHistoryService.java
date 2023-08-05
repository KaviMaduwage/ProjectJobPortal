package com.example.projectjobportal.service;

import com.example.projectjobportal.model.ApplicationHistory;

import java.util.List;

public interface ApplicationHistoryService {
    ApplicationHistory getAppliedHistoryFromJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId);

    void saveApplicationDate(ApplicationHistory newHistory);

    List<ApplicationHistory> getAppliedJobHistoryByJobSeekerId(int jobSeekerId);

    List<ApplicationHistory> getApplicationsByEmployerId(int employerId);

    List<ApplicationHistory> getApplicationsByVacancyId(int vacancyId);

    void deleteAppliedHistoryByJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId);
}
