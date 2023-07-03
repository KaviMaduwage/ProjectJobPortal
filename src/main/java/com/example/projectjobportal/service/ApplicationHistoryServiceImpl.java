package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.ApplicationHistoryDao;
import com.example.projectjobportal.model.ApplicationHistory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationHistoryServiceImpl implements ApplicationHistoryService{
    ApplicationHistoryDao applicationHistoryDao;

    public ApplicationHistoryServiceImpl(ApplicationHistoryDao applicationHistoryDao) {
        this.applicationHistoryDao = applicationHistoryDao;
    }

    @Override
    public ApplicationHistory getAppliedHistoryFromJobSeekerIdAndVacancyId(int jobSeekerId, int vacancyId) {
        return applicationHistoryDao.getAppliedHistoryFromJobSeekerIdAndVacancyId(jobSeekerId,vacancyId);
    }

    @Override
    public void saveApplicationDate(ApplicationHistory newHistory) {
        applicationHistoryDao.save(newHistory);
    }

    @Override
    public List<ApplicationHistory> getAppliedJobHistoryByJobSeekerId(int jobSeekerId) {
        return applicationHistoryDao.getAppliedJobHistoryByJobSeekerId(jobSeekerId);
    }
}
