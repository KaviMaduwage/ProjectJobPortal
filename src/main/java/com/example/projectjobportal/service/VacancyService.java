package com.example.projectjobportal.service;

import com.example.projectjobportal.model.Vacancy;

import java.util.List;

public interface VacancyService {
    List<Vacancy> getVacancyListByCriteria(int industryTypeId, int jobFieldId, int positionId);
}
