package com.example.projectjobportal.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "application_history")
public class ApplicationHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int applicationHistoryId;
    private Date appliedDate;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "job_seeker_id")
    private JobSeeker jobSeeker;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "vacancy_id")
    private Vacancy vacancy;

    public int getApplicationHistoryId() {
        return applicationHistoryId;
    }

    public void setApplicationHistoryId(int applicationHistoryId) {
        this.applicationHistoryId = applicationHistoryId;
    }

    public Date getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(Date appliedDate) {
        this.appliedDate = appliedDate;
    }

    public JobSeeker getJobSeeker() {
        return jobSeeker;
    }

    public void setJobSeeker(JobSeeker jobSeeker) {
        this.jobSeeker = jobSeeker;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }
}
