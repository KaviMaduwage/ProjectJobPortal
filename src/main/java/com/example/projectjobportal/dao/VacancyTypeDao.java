package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.VacancyType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VacancyTypeDao extends JpaRepository<VacancyType, Integer> {
}
