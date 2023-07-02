package com.example.projectjobportal.service;

import com.example.projectjobportal.model.IndustryType;

import java.util.List;

public interface IndustryTypeService {
    List<IndustryType> getAllIndustryTypes();

    IndustryType getIndustryTypeById(int industryTypeId);
}
