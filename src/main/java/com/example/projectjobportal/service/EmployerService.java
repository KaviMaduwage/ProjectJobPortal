package com.example.projectjobportal.service;

import com.example.projectjobportal.model.Employer;

import java.util.List;

public interface EmployerService {
    List<Employer> getEmployerByIndustryTypeId(int industryTypeId);
}
