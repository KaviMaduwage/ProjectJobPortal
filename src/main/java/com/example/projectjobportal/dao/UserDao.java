package com.example.projectjobportal.dao;

import com.example.projectjobportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserDao extends JpaRepository<User, Integer> {
    @Query("SELECT u FROM User u WHERE u.userName = :name or u.email = :name")
    User getUserByUserNameOrEmail(String name);
}
