package com.example.projectjobportal.service;

import com.example.projectjobportal.model.JobSeekerPreference;

import java.util.List;

public interface JobSeekerPreferenceService {
    void saveAllJobSeekerPreferences(List<JobSeekerPreference> jobSeekerPreferenceList);
}
