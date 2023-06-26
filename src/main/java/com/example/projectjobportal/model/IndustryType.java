package com.example.projectjobportal.model;

import javax.persistence.*;

@Entity
@Table(name = "industry_type")
public class IndustryType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int industryTypeId;

    private String description;

    public int getIndustryTypeId() {
        return industryTypeId;
    }

    public void setIndustryTypeId(int industryTypeId) {
        this.industryTypeId = industryTypeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
