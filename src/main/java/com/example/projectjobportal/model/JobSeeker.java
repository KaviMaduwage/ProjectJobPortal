package com.example.projectjobportal.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

@Entity
@Table(name = "job_seeker")
public class JobSeeker {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobSeekerId;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    private String firstName;
    private String lastName;

    private Date dob;
    private String gender;
    @Transient
    private int age;
    private String currentJobTitle;
    @Column(length = 1000)
    private String mySelfDes;

    private String address;
    private String telNo;
    private String cvFileName;

    public String getMySelfDes() {
        return mySelfDes;
    }

    public void setMySelfDes(String mySelfDes) {
        this.mySelfDes = mySelfDes;
    }

    public String getCurrentJobTitle() {
        return currentJobTitle;
    }

    public void setCurrentJobTitle(String currentJobTitle) {
        this.currentJobTitle = currentJobTitle;
    }

    public int getJobSeekerId() {
        return jobSeekerId;
    }

    public void setJobSeekerId(int jobSeekerId) {
        this.jobSeekerId = jobSeekerId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getAge() {
        if (dob == null) {
            return 0; // Handle the case when date of birth is not set
        }
        LocalDate currentDate = LocalDate.now();
        LocalDate birthDate = dob.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        Period period = Period.between(birthDate, currentDate);
        return period.getYears();
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getCvFileName() {
        return cvFileName;
    }

    public void setCvFileName(String cvFileName) {
        this.cvFileName = cvFileName;
    }
}
