package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.Vacancy;
import com.example.projectjobportal.service.VacancyService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class welcomeController {

    VacancyService vacancyService;

    public welcomeController(VacancyService vacancyService) {
        this.vacancyService = vacancyService;
    }

    @RequestMapping("/")
    public String getWelcomePage(Model model){
        return "welcome";
    }

    @ModelAttribute("vacancyList")
    public List<Vacancy> getResentVacancies(){
        List<Vacancy> vacancyList = new ArrayList<>();
        Pageable pageable = PageRequest.of(0, 5, Sort.by("vacancyId").descending());
        vacancyList = vacancyService.getRecentVacancyList(pageable);
        return vacancyList;
    }



    @RequestMapping("/subscription")
    public String getSubscriptionPage(Model model){

        return "subscription";
    }


    @RequestMapping("/contact")
    public String getContactPage(Model model){

        return "contact";
    }







}
