package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

public interface RequestDao extends JpaRepository<Request, Integer> {
    @Query("SELECT r FROM Request r WHERE r.isApproved = false ")
    List<Request> getNotApprovedRequestList();
    @Modifying
    @Query("UPDATE Request r SET r.isApproved =:isApproved, r.approvedDate = :approvedDate WHERE r.requestId = :requestId")
    void updateRequest(boolean isApproved, Date approvedDate, int requestId);
}
