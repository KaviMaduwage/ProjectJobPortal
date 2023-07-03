package com.example.projectjobportal.service;

import com.example.projectjobportal.model.ApplicationHistory;

public interface ApplicationHistoryService {
    ApplicationHistory getAppliedHistoryFromJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId);

    void saveApplicationDate(ApplicationHistory newHistory);
}
