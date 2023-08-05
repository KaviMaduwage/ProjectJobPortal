package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.JobSeekerPreferenceDao;
import com.example.projectjobportal.model.JobSeekerPreference;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class JobSeekerPreferenceServiceImpl implements JobSeekerPreferenceService{
    JobSeekerPreferenceDao jobSeekerPreferenceDao;

    public JobSeekerPreferenceServiceImpl(JobSeekerPreferenceDao jobSeekerPreferenceDao) {
        this.jobSeekerPreferenceDao = jobSeekerPreferenceDao;
    }

    @Override
    public void saveAllJobSeekerPreferences(List<JobSeekerPreference> jobSeekerPreferenceList) {
        jobSeekerPreferenceDao.saveAll(jobSeekerPreferenceList);
    }

    @Override
    public List<JobSeekerPreference> getPreferenceListByJobSeekerId(int jobSeekerId) {
        return jobSeekerPreferenceDao.getPreferenceListByJobSeekerId(jobSeekerId);
    }

    @Override
    @Transactional
    public void deleteJobSeekerPreference(int jobFieldId, int jobSeekerId) {
        jobSeekerPreferenceDao.deleteJobSeekerPreference(jobFieldId, jobSeekerId);
    }
}
