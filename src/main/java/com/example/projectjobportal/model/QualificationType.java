package com.example.projectjobportal.model;

import javax.persistence.*;

@Entity
@Table(name = "qualification_type")
public class QualificationType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int qualificationTypeId;
    private String description;

    public int getQualificationTypeId() {
        return qualificationTypeId;
    }

    public void setQualificationTypeId(int qualificationTypeId) {
        this.qualificationTypeId = qualificationTypeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
