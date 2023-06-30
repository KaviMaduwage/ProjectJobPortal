package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.PositionDao;
import com.example.projectjobportal.model.Position;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService{
    PositionDao positionDao;

    public PositionServiceImpl(PositionDao positionDao) {
        this.positionDao = positionDao;
    }

    @Override
    public List<Position> getJobPositionList() {
        return positionDao.findAll();
    }
}
