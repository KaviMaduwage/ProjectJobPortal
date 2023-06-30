package com.example.projectjobportal.model;

import javax.persistence.*;

@Entity
@Table(name = "job_seeker_preference")
public class JobSeekerPreference {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobSeekerPreferenceId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "job_seeker_id")
    private JobSeeker jobSeeker;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "job_field_id")
    private JobField jobField;

    public int getJobSeekerPreferenceId() {
        return jobSeekerPreferenceId;
    }

    public void setJobSeekerPreferenceId(int jobSeekerPreferenceId) {
        this.jobSeekerPreferenceId = jobSeekerPreferenceId;
    }

    public JobSeeker getJobSeeker() {
        return jobSeeker;
    }

    public void setJobSeeker(JobSeeker jobSeeker) {
        this.jobSeeker = jobSeeker;
    }

    public JobField getJobField() {
        return jobField;
    }

    public void setJobField(JobField jobField) {
        this.jobField = jobField;
    }
}
