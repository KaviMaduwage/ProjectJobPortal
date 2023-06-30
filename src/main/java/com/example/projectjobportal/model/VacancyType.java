package com.example.projectjobportal.model;

import javax.persistence.*;

@Entity
@Table(name = "vacancy_type")
public class VacancyType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int vacancyTypeId;

    private String description;

    public int getVacancyTypeId() {
        return vacancyTypeId;
    }

    public void setVacancyTypeId(int vacancyTypeId) {
        this.vacancyTypeId = vacancyTypeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
