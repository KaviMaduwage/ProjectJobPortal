package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.Vacancy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VacancyDao extends JpaRepository<Vacancy,Integer> {
    @Query("SELECT v FROM Vacancy v WHERE (0 = : industryTypeId OR v.employer.industryType.industryTypeId = :industryTypeId) AND " +
            "(0 = : jobFieldId OR v.jobField.jobFieldId = :jobFieldId) AND " +
            "(0 = : positionId OR v.position.positionId = :positionId)")
    List<Vacancy> getVacancyListByCriteria(int industryTypeId, int jobFieldId, int positionId);
}
