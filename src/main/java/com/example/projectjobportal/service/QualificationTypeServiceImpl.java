package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.QualificationTypeDao;
import com.example.projectjobportal.model.QualificationType;
import org.springframework.stereotype.Service;

@Service
public class QualificationTypeServiceImpl implements QualificationTypeService
{
    QualificationTypeDao qualificationTypeDao;

    public QualificationTypeServiceImpl(QualificationTypeDao qualificationTypeDao) {
        this.qualificationTypeDao = qualificationTypeDao;
    }

    @Override
    public QualificationType getQualificationTypeById(int qTypeId) {
        return qualificationTypeDao.findById(qTypeId).get();
    }
}
