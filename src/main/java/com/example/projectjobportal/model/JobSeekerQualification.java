package com.example.projectjobportal.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "job_seeker_qualification")
public class JobSeekerQualification {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobSeekerQualificationId;

    private String description;
    private Date startDate;
    private Date endDate;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "job_seeker_id")
    private JobSeeker jobSeeker;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "qualification_type_id")
    private QualificationType qualificationType;

    public int getJobSeekerQualificationId() {
        return jobSeekerQualificationId;
    }

    public void setJobSeekerQualificationId(int jobSeekerQualificationId) {
        this.jobSeekerQualificationId = jobSeekerQualificationId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public JobSeeker getJobSeeker() {
        return jobSeeker;
    }

    public void setJobSeeker(JobSeeker jobSeeker) {
        this.jobSeeker = jobSeeker;
    }

    public QualificationType getQualificationType() {
        return qualificationType;
    }

    public void setQualificationType(QualificationType qualificationType) {
        this.qualificationType = qualificationType;
    }
}
