package com.example.projectjobportal.service;

import com.example.projectjobportal.dao.RequestDao;
import com.example.projectjobportal.model.Request;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Service

public class RequestServiceImpl implements RequestService{
    RequestDao requestDao;

    public RequestServiceImpl(RequestDao requestDao) {
        this.requestDao = requestDao;
    }

    @Override
    public void saveInitialRequest(Request employerRequest) {
        requestDao.save(employerRequest);
    }

    @Override
    public List<Request> getNotApprovedRequestList() {
        return requestDao.getNotApprovedRequestList();
    }

    @Override
    @Transactional
    public void updateRequest(boolean isApproved, Date approvedDate, int requestId) {
        requestDao.updateRequest(isApproved,approvedDate,requestId);

    }

    @Override
    public List<Request> getApprovedRequestList() {
        return requestDao.getApprovedRequestList();
    }

    @Override
    public Request getRequestById(int requestId) {
        return requestDao.findById(requestId).get();
    }


}
