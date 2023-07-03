package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.ApplicationHistory;
import com.example.projectjobportal.model.JobSeeker;
import com.example.projectjobportal.model.User;
import com.example.projectjobportal.model.Vacancy;
import com.example.projectjobportal.service.ApplicationHistoryService;
import com.example.projectjobportal.service.JobSeekerService;
import com.example.projectjobportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProfileController {

    JobSeekerService jobSeekerService;
    ApplicationHistoryService applicationHistoryService;

    public ProfileController(JobSeekerService jobSeekerService,ApplicationHistoryService applicationHistoryService) {
        this.jobSeekerService = jobSeekerService;
        this.applicationHistoryService =applicationHistoryService;
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

    }
}
