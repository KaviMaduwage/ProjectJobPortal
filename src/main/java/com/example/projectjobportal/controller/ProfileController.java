package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProfileController {

    JobSeekerService jobSeekerService;
    ApplicationHistoryService applicationHistoryService;
    JobSeekerPreferenceService jobSeekerPreferenceService;
    JobSeekerQualificationService jobSeekerQualificationService;

    public ProfileController(JobSeekerService jobSeekerService,ApplicationHistoryService applicationHistoryService,
                             JobSeekerPreferenceService jobSeekerPreferenceService,JobSeekerQualificationService jobSeekerQualificationService) {
        this.jobSeekerService = jobSeekerService;
        this.applicationHistoryService =applicationHistoryService;
        this.jobSeekerPreferenceService = jobSeekerPreferenceService;
        this.jobSeekerQualificationService = jobSeekerQualificationService;
    }

    @RequestMapping("/viewProfile")
    public String getProfilePage(Model model, HttpSession session){
        User user = (User) session.getAttribute("userLogin");
        if(user.getUserType().getDescription().equalsIgnoreCase("jobSeeker")){
            generateJobSeekerData(model,user);
            return "jobSeekerProfile";
        }else if(user.getUserType().getDescription().equalsIgnoreCase("employer")){
            return "employerProfile";
        }
        return "welcome";

    }

    private void generateJobSeekerData(Model model,User user) {
        JobSeeker jobSeeker = jobSeekerService.getJobSeekerByUserId(user.getUserId());
        List<ApplicationHistory> appliedJobList = applicationHistoryService.getAppliedJobHistoryByJobSeekerId(jobSeeker.getJobSeekerId());
        if(appliedJobList != null && appliedJobList.size() > 0){
            model.addAttribute("appliedJobs",appliedJobList);
        }else{
            model.addAttribute("noVacancy","No Applied Vacancies To Show.");
        }
        model.addAttribute("jobSeeker",jobSeeker);

        List<JobSeekerPreference> jobSeekerPreferenceList = jobSeekerPreferenceService.getPreferenceListByJobSeekerId(jobSeeker.getJobSeekerId());
        if(jobSeekerPreferenceList != null && jobSeekerPreferenceList.size() > 0){
            model.addAttribute("preferences",jobSeekerPreferenceList);
        }else{
            model.addAttribute("noPreference","No Preference To Show.");

        }

        List<JobSeekerQualification> jobSeekerQualificationList = jobSeekerQualificationService.getQualificationsByJobSeekerId(jobSeeker.getJobSeekerId());
        if(jobSeekerQualificationList != null && jobSeekerQualificationList.size() > 0){
            model.addAttribute("qualifications",jobSeekerQualificationList);
        }else{
            model.addAttribute("noQualification","No Qualification To Show.");
        }
    }
}
