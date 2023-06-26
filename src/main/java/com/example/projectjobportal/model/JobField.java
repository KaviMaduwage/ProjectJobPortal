package com.example.projectjobportal.model;

import javax.persistence.*;

@Entity
@Table(name = "job_field")
public class JobField {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobFieldId;
    private String description;

    public int getJobFieldId() {
        return jobFieldId;
    }

    public void setJobFieldId(int jobFieldId) {
        this.jobFieldId = jobFieldId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
