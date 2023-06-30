package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.JobField;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobFieldDao extends JpaRepository<JobField,Integer> {

}
