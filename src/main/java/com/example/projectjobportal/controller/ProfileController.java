package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProfileController {

    JobSeekerService jobSeekerService;
    ApplicationHistoryService applicationHistoryService;
    JobSeekerPreferenceService jobSeekerPreferenceService;
    JobSeekerQualificationService jobSeekerQualificationService;
    EmployerService employerService;
    VacancyService vacancyService;
    PositionService positionService;
    JobFieldService jobFieldService;

    public ProfileController(JobSeekerService jobSeekerService,ApplicationHistoryService applicationHistoryService,
                             JobSeekerPreferenceService jobSeekerPreferenceService,JobSeekerQualificationService jobSeekerQualificationService,
                             EmployerService employerService,VacancyService vacancyService,PositionService positionService,
                             JobFieldService jobFieldService) {
        this.jobSeekerService = jobSeekerService;
        this.applicationHistoryService =applicationHistoryService;
        this.jobSeekerPreferenceService = jobSeekerPreferenceService;
        this.jobSeekerQualificationService = jobSeekerQualificationService;
        this.employerService = employerService;
        this.vacancyService = vacancyService;
        this.positionService = positionService;
        this.jobFieldService = jobFieldService;
    }

    @ModelAttribute("positionList")
    public List<Position> positionList(){
        List<Position> positionList = positionService.getJobPositionList();
        return positionList;
    }
    @ModelAttribute("jobFieldList")
    public List<JobField> jobFieldList(){
        List<JobField> jobFieldList = jobFieldService.getJobFieldList();
        return jobFieldList;
    }

    @RequestMapping("/viewProfile")
    public String getProfilePage(Model model, HttpSession session){
        User user = (User) session.getAttribute("userLogin");
        if(user.getUserType().getDescription().equalsIgnoreCase("jobSeeker")){
            generateJobSeekerData(model,user);
            return "jobSeekerProfile";
        }else if(user.getUserType().getDescription().equalsIgnoreCase("employer")){
            generateEmployerData(model,user);
            return "employerProfile";
        }
        return "welcome";

    }

    private void generateEmployerData(Model model, User user) {
        Employer employer = employerService.getEmployerByUserId(user.getUserId());
        if(employer != null){
            model.addAttribute("employer",employer);
        }

        List<Vacancy> vacancyList = vacancyService.getVacancyListByEmployerId(employer.getEmployerId());
        if(vacancyList != null && vacancyList.size() > 0){
            model.addAttribute("vacancies",vacancyList);
        }

//        List<Vacancy> postedVacancyList = vacancyService.getVacancyListByEmployerId(employer.getEmployerId());
//        int noOfVacanciesPosted = postedVacancyList.size();


//        HashMap<String, List> applicantsHashMap = new HashMap<>();
//        for(int i=0;i<noOfVacanciesPosted;i++){
//            String key = postedVacancyList.get(i).getDescription()+"Vacancy Posted On "+postedVacancyList.get(0).getPostedDate();
//            List<ApplicationHistory> applicationList = applicationHistoryService.getApplicationsByVacancyId(postedVacancyList.get(i).getVacancyId());
//            applicantsHashMap.put(key,applicationList);
//        }

        List<ApplicationHistory> applicationList = applicationHistoryService.getApplicationsByEmployerId(employer.getEmployerId());
        if(applicationList != null && applicationList.size() > 0){
            model.addAttribute("applicants",applicationList);
        }


//        if(applicationList !=null && applicationList.size() > 0){
//            for(int i=0;i<applicationList.size();i++){
//                String key = applicationList.get(i).getVacancy().getDescription()+"Vacancy Posted On "+applicationList.get(0).getAppliedDate();
//                if(applicantsHashMap.containsKey(key)){
//
//                }
//            }
//
//        }


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
