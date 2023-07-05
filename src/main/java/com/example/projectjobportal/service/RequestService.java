package com.example.projectjobportal.service;

import com.example.projectjobportal.model.Request;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

public interface RequestService {
    void saveInitialRequest(Request employerRequest);

    List<Request> getNotApprovedRequestList();



    void updateRequest(boolean isApproved, Date approvedDate, int requestId);
}
