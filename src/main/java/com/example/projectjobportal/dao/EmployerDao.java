package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.Employer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployerDao extends JpaRepository<Employer,Integer> {


    @Query("SELECT e FROM Employer e WHERE e.industryType.industryTypeId = :industryTypeId")
    List<Employer> getEmployerByIndustryTypeId(int industryTypeId);

    @Query("SELECT e FROM Employer e WHERE e.user.userId = :userId")
    Employer getEmployerByUserId(int userId);
}
