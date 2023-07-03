package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.VacancyDao;
import com.example.projectjobportal.model.Vacancy;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VacancyServiceImpl implements VacancyService{
    VacancyDao vacancyDao;

    public VacancyServiceImpl(VacancyDao vacancyDao) {
        this.vacancyDao = vacancyDao;
    }

    @Override
    public List<Vacancy> getVacancyListByCriteria(int industryTypeId, int jobFieldId, int positionId) {
        return vacancyDao.getVacancyListByCriteria(industryTypeId,jobFieldId,positionId);
    }

    @Override
    public List<Vacancy> getRecentVacancyList(Pageable pageable) {
        return vacancyDao.getRecentVacancyList(pageable);
    }

    @Override
    public Vacancy getVacancyById(int vacancyId) {
        return vacancyDao.findById(vacancyId).get();
    }

    @Override
    public List<Vacancy> getVacancyListByEmployerId(int employerId) {
        return vacancyDao.getVacancyListByEmployerId(employerId);
    }
}
