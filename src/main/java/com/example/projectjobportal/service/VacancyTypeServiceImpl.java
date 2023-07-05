package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.VacancyTypeDao;
import com.example.projectjobportal.model.VacancyType;
import org.springframework.stereotype.Service;

@Service
public class VacancyTypeServiceImpl implements VacancyTypeService{

    VacancyTypeDao vacancyTypeDao;

    public VacancyTypeServiceImpl(VacancyTypeDao vacancyTypeDao) {
        this.vacancyTypeDao = vacancyTypeDao;
    }

    @Override
    public VacancyType getVacancyTypeById(int vacancyTypeId) {
        return vacancyTypeDao.findById(vacancyTypeId).get();
    }
}
