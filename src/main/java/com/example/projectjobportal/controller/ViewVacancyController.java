package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ViewVacancyController {
    JobFieldService jobFieldService;
    IndustryTypeService industryTypeService;
    PositionService positionService;
    EmployerService employerService;
    VacancyService vacancyService;


    public ViewVacancyController(JobFieldService jobFieldService, IndustryTypeService industryTypeService, PositionService positionService,
                                 EmployerService employerService, VacancyService vacancyService) {
        this.jobFieldService = jobFieldService;
        this.industryTypeService = industryTypeService;
        this.positionService = positionService;
        this.employerService = employerService;
        this.vacancyService = vacancyService;
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
