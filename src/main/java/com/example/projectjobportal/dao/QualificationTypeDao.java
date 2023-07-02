package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.QualificationType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QualificationTypeDao extends JpaRepository<QualificationType, Integer> {
}
