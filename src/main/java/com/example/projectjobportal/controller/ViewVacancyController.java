package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ViewVacancyController {
    JobFieldService jobFieldService;
    IndustryTypeService industryTypeService;
    PositionService positionService;
    EmployerService employerService;
    VacancyService vacancyService;
    JobSeekerService jobSeekerService;
    ApplicationHistoryService applicationHistoryService;


    public ViewVacancyController(JobFieldService jobFieldService, IndustryTypeService industryTypeService, PositionService positionService,
                                 EmployerService employerService, VacancyService vacancyService,
                                 JobSeekerService jobSeekerService,
                                 ApplicationHistoryService applicationHistoryService) {
        this.jobFieldService = jobFieldService;
        this.industryTypeService = industryTypeService;
        this.positionService = positionService;
        this.employerService = employerService;
        this.vacancyService = vacancyService;
        this.jobSeekerService = jobSeekerService;
        this.applicationHistoryService = applicationHistoryService;
    }

    @ModelAttribute("vacancyList")
    public List<Vacancy> getVacancies(){
        List<Vacancy> vacancyList = new ArrayList<>();
        Pageable pageable = PageRequest.of(0, 5, Sort.by("vacancyId").descending());
        vacancyList = vacancyService.getRecentVacancyList(pageable);
        return vacancyList;
    }

    @ModelAttribute("recentVacancyList")
    public List<Vacancy> getResentVacancies(){
        List<Vacancy> vacancyList = new ArrayList<>();
        Pageable pageable = PageRequest.of(0, 5, Sort.by("vacancyId").descending());
        vacancyList = vacancyService.getRecentVacancyList(pageable);
        return vacancyList;
    }


    @ModelAttribute("jobFieldList")
    public List<JobField> jobFieldList(){
        List<JobField> jobFieldList = jobFieldService.getJobFieldList();
        return jobFieldList;
    }
    @ModelAttribute("industryTypeList")
    public List<IndustryType> industryTypeList(){
        List<IndustryType> industryTypeList = industryTypeService.getAllIndustryTypes();
        return industryTypeList;
    }
    @ModelAttribute("positionList")
    public List<Position> positionList(){
        List<Position> positionList = positionService.getJobPositionList();
        return positionList;
    }

    @ResponseBody
    @RequestMapping("/loadCompanyList.htm")
    public String loadCompanyList(HttpServletRequest request){
        String industryTypeId = request.getParameter("selectedIndustryTypeId");
        List<Employer> employerList = employerService.getEmployerByIndustryTypeId(Integer.parseInt(industryTypeId));
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectWriter objectWriter = objectMapper.writer().withDefaultPrettyPrinter();

        String jsonString="";
        try {
            jsonString = objectWriter.writeValueAsString(employerList);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    @RequestMapping("/category")
    public String getCategoryPage(Model model){

        return "category";
    }

    @RequestMapping("/viewVacancy.htm")
    public String getViewVacancyPage(@RequestParam("vacancyId") String vacancyId, Model model,HttpServletRequest request){

        Vacancy vacancy = vacancyService.getVacancyById(Integer.parseInt(vacancyId));
        String image_path = "img/vacancies/"+vacancy.getEmployer().getEmployerId()+"_"+vacancy.getEmployer().getCompanyName()+"/"+vacancy.getVacancyImageName();
        model.addAttribute("imageSrc",image_path);

        return "viewVacancy";
    }
    @ResponseBody
    @RequestMapping(value = "/applyVacancy.htm", method = RequestMethod.POST)
    public String applyVacancy(Model model, HttpServletRequest request, HttpSession session){

        String message = "";
        String vacancyId = request.getParameter("selectedVacancyId");

        User user = (User) session.getAttribute("userLogin");
        if(user.getUserType().getDescription().equalsIgnoreCase("jobSeeker")){
            int userId = user.getUserId();
            JobSeeker jobSeeker = jobSeekerService.getJobSeekerByUserId(userId);
            Vacancy vacancy = vacancyService.getVacancyById(Integer.parseInt(vacancyId));
            if(jobSeeker != null && vacancy != null){
                ApplicationHistory applicationHistory = applicationHistoryService.getAppliedHistoryFromJobSeekerIdAndVacancyId(jobSeeker.getJobSeekerId(), vacancy.getVacancyId());
                if(applicationHistory != null){

                    message = "Already Applied.";

                }else{
                    ApplicationHistory newHistory = new ApplicationHistory();
                    newHistory.setVacancy(vacancy);
                    newHistory.setJobSeeker(jobSeeker);

                    Date currentDate = new Date();
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String todayDateString = simpleDateFormat.format(currentDate);

                    newHistory.setAppliedDate(todayDateString);
                    applicationHistoryService.saveApplicationDate(newHistory);

                    message = "Successfully Applied.";

                }

            }

        }
        return message;
    }


    @RequestMapping(value = "/searchVacancies.htm", method = RequestMethod.POST)
    public String searchVacancies(HttpServletRequest request, Model model){

        int industryTypeId = Integer.parseInt(request.getParameter("industryType"));
        int fieldId = Integer.parseInt(request.getParameter("field"));
        int positionId = Integer.parseInt(request.getParameter("position"));

        List<Vacancy> vacancyList = vacancyService.getVacancyListByCriteria(industryTypeId,fieldId,positionId);

        model.addAttribute("selectedIndustryTypeId",industryTypeId);
        model.addAttribute("selectedJobFiledId",fieldId);
        model.addAttribute("selectedPositionId",positionId);
        model.addAttribute("vacancyList",vacancyList);

        return "category";
    }
}
