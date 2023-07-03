package com.example.projectjobportal.service;

import com.example.projectjobportal.model.Vacancy;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface VacancyService {
    List<Vacancy> getVacancyListByCriteria(int industryTypeId, int jobFieldId, int positionId);

    List<Vacancy> getRecentVacancyList(Pageable pageable);

    Vacancy getVacancyById(int vacancyId);
}
