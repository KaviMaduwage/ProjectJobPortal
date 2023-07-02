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
    private String startDate;
    private String endDate;
    @ManyToOne
    @JoinColumn(name = "job_seeker_id")
    private JobSeeker jobSeeker;
    private String eduField;
    private String status;

    @ManyToOne
    @JoinColumn(name = "qualification_type_id")
    private QualificationType qualificationType;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEduField() {
        return eduField;
    }

    public void setEduField(String eduField) {
        this.eduField = eduField;
    }

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

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
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
