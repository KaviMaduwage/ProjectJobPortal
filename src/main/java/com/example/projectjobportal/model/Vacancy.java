package com.example.projectjobportal.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
public class Vacancy {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int vacancyId;

    private String description;
    private Date postedDate;
    private Date closingDate;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "job_field_id")
    private JobField jobField;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "vacancy_type_id")
    private VacancyType vacancyType;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "employer_id")
    private Employer employer;

    public int getVacancyId() {
        return vacancyId;
    }

    public void setVacancyId(int vacancyId) {
        this.vacancyId = vacancyId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public JobField getJobField() {
        return jobField;
    }

    public void setJobField(JobField jobField) {
        this.jobField = jobField;
    }

    public VacancyType getVacancyType() {
        return vacancyType;
    }

    public void setVacancyType(VacancyType vacancyType) {
        this.vacancyType = vacancyType;
    }

    public Employer getEmployer() {
        return employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }
}