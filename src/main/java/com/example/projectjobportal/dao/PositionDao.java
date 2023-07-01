package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.Position;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PositionDao extends JpaRepository<Position,Integer> {
}
