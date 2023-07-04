package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

@Controller
public class SignUpController {

    UserService userService;
    EmployerService employerService;
    IndustryTypeService industryTypeService;
    JobFieldService jobFieldService;
    JobSeekerService jobSeekerService;
    UserTypeService userTypeService;
    QualificationTypeService qualificationTypeService;
    JobSeekerQualificationService jobSeekerQualificationService;
    JobSeekerPreferenceService jobSeekerPreferenceService;
    @PersistenceContext
    private EntityManager entityManager;


    public SignUpController(UserService userService, EmployerService employerService,
                            IndustryTypeService industryTypeService,JobFieldService jobFieldService,
                            JobSeekerService jobSeekerService, UserTypeService userTypeService,
                            QualificationTypeService qualificationTypeService,
                            JobSeekerQualificationService jobSeekerQualificationService,
                            JobSeekerPreferenceService jobSeekerPreferenceService) {
        this.userService = userService;
        this.employerService = employerService;
        this.industryTypeService = industryTypeService;
        this.jobFieldService = jobFieldService;
        this.jobSeekerService = jobSeekerService;
        this.userTypeService = userTypeService;
        this.qualificationTypeService = qualificationTypeService;
        this.jobSeekerQualificationService = jobSeekerQualificationService;
        this.jobSeekerPreferenceService = jobSeekerPreferenceService;
    }
    @ModelAttribute("industryTypeList")
    public List<IndustryType> industryTypeList(){
        List<IndustryType> industryTypeList = industryTypeService.getAllIndustryTypes();
        return industryTypeList;
    }
    @ModelAttribute("jobFieldList")
    public List<JobField> jobFieldList(){
        List<JobField> jobFieldList = jobFieldService.getJobFieldList();
        return jobFieldList;
    }

    @RequestMapping(value = "/signUp")
    public String getHomePage(Model model, HttpServletRequest request){

        return "signUp";
    }


    @RequestMapping(value = "/employerSignUp.htm", method = RequestMethod.POST)
    public String employerSignUp(@RequestParam("companyLogo") MultipartFile multipartFile, HttpServletRequest request, Model model) throws IOException {
        String companyName = request.getParameter("companyName");
        String address = request.getParameter("address");
        String telNo = request.getParameter("telNo");
        String headquarters = request.getParameter("headquarters");
        String description = request.getParameter("description");
        String noOfEmployees = request.getParameter("noOfEmployees");
        String found = request.getParameter("found");
        String website = request.getParameter("website");
        String industryTypeId = request.getParameter("industryType");

        //get login details
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int userTypeId = Integer.parseInt(request.getParameter("userType"));

        UserType userType = userTypeService.getUserTypeById(userTypeId);
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setUserName(userName);
        newUser.setPassword(password);
        newUser.setUserType(userType);

        User savedUser = userService.saveUser(newUser);

        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

        Employer employer = new Employer();
        employer.setCompanyName(companyName);
        employer.setAddress(address);
        employer.setFounded(Integer.parseInt(found));
        employer.setDescription(description);
        employer.setHeadquarters(headquarters);
        employer.setNoOfEmployees(Integer.parseInt(noOfEmployees));
        employer.setTel(telNo);
        employer.setUser(savedUser);

        IndustryType industryType = industryTypeService.getIndustryTypeById(Integer.parseInt(industryTypeId));
        //IndustryType mergedIndustryType = entityManager.merge(industryType);
        employer.setIndustryType(industryType);
        employer.setWebsite(website);
        employer.setLogoImage(fileName);

        Employer savedEmployer = employerService.saveEmployer(employer);
        String uploadDir = "src/main/resources/static/img/company-logos/"+savedEmployer.getEmployerId()+"_"+savedEmployer.getCompanyName();
        Path uploadpath = Paths.get(uploadDir);
        try{
            if(!Files.exists(uploadpath)){
                Files.createDirectories(uploadpath);
            }
            InputStream inputStream = multipartFile.getInputStream();
            Path filePath = uploadpath.resolve(fileName);
//            System.out.println(filePath.toFile().getAbsolutePath());
//            savedEmployer.setLogoFilePath(filePath.toFile().getAbsolutePath());
//            employerService.saveEmployer(savedEmployer);
            Files.copy(inputStream, filePath,
                    StandardCopyOption.REPLACE_EXISTING);

        }catch (IOException e){
            throw  new IOException("couldn't save uploaded image :"+ fileName);
        }


        return "signUp";
    }
    @RequestMapping(value = "/jobSeekerSignUp.htm", method = RequestMethod.POST)
    public String jobSeekerSignUp(@RequestParam("cv") MultipartFile cv, HttpServletRequest request, Model model) throws IOException{
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String telNo = request.getParameter("telNo");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String currentJobTitle = request.getParameter("currentJobTitle");
        String mySelfDes = request.getParameter("mySelfDes");
        String[] fields = request.getParameterValues("field");

        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int userTypeId = Integer.parseInt(request.getParameter("userType"));

        //get educational details
        String[] qualifications = request.getParameterValues("qualification");
        String[] educationFields = request.getParameterValues("educationField");
        String[] startDates = request.getParameterValues("startDate");
        String[] endDates = request.getParameterValues("endDate");
        String[] statuses = request.getParameterValues("StatusType");
        String[] description = request.getParameterValues("description");


        UserType userType = userTypeService.getUserTypeById(userTypeId);
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setUserName(userName);
        newUser.setPassword(password);
        newUser.setUserType(userType);

        User savedUser = userService.saveUser(newUser);


        String cvFileName = StringUtils.cleanPath(cv.getOriginalFilename());

        JobSeeker jobSeeker = new JobSeeker();

        jobSeeker.setFirstName(firstName);
        jobSeeker.setLastName(lastName);
        jobSeeker.setAddress(address);
        jobSeeker.setGender(gender);
        jobSeeker.setTelNo(telNo);
        jobSeeker.setCurrentJobTitle(currentJobTitle);
        jobSeeker.setMySelfDes(mySelfDes);
        jobSeeker.setUser(savedUser);

        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        try {
            Date date = simpleDateFormat.parse(dob);
            jobSeeker.setDob(date);
            jobSeeker.setCvFileName(cvFileName);

            //job seeker saving
              JobSeeker savedJobSeeker = jobSeekerService.saveJobSeeker(jobSeeker);

              List<JobSeekerQualification> jobSeekerQualificationList = new ArrayList<>();
              for(int i=0;i<qualifications.length;i++){
                  String qualification = qualifications[i];
                  String startDate = startDates[i];
                  String endDate = endDates[i];
                  String status = statuses[i];
                  String eduField = educationFields[i];
                  String des = description[i];

                  QualificationType qualificationType = qualificationTypeService.getQualificationTypeById(Integer.parseInt(qualification));

                  JobSeekerQualification jobSeekerQualification = new JobSeekerQualification();
                  jobSeekerQualification.setJobSeeker(savedJobSeeker);
                  jobSeekerQualification.setQualificationType(qualificationType);
                  jobSeekerQualification.setEduField(eduField);
                  jobSeekerQualification.setStartDate(startDate);
                  jobSeekerQualification.setEndDate(endDate);
                  jobSeekerQualification.setDescription(des);
                  jobSeekerQualification.setStatus(status);

                  jobSeekerQualificationList.add(jobSeekerQualification);

              }
                // job seeker qualifications saving
              if(jobSeekerQualificationList.size() > 0){
                  jobSeekerQualificationService.saveAllJobSeekerQualifications(jobSeekerQualificationList);
              }

              //job seeker preferences saving
                List<JobSeekerPreference> jobSeekerPreferenceList = new ArrayList<>();
                for(int i=0;i<fields.length;i++){
                    JobField jobField = jobFieldService.getJobFieldList().get(Integer.parseInt(fields[i])-1);
                    JobSeekerPreference jobSeekerPreference = new JobSeekerPreference();
                    jobSeekerPreference.setJobField(jobField);
                    jobSeekerPreference.setJobSeeker(savedJobSeeker);

                    jobSeekerPreferenceList.add(jobSeekerPreference);
                }

                if(jobSeekerQualificationList.size() >0){
                    jobSeekerPreferenceService.saveAllJobSeekerPreferences(jobSeekerPreferenceList);
                }

            String uploadDir = "src/main/resources/static/files/cv/"+savedJobSeeker.getJobSeekerId();
            Path uploadpath = Paths.get(uploadDir);

            if(!Files.exists(uploadpath)){
                Files.createDirectories(uploadpath);
            }
            InputStream inputStream = cv.getInputStream();
            Path filePath = uploadpath.resolve(cvFileName);
            System.out.println(filePath.toFile().getAbsolutePath());
            Files.copy(inputStream, filePath,
                    StandardCopyOption.REPLACE_EXISTING);


        } catch (ParseException e) {
            throw new RuntimeException(e);
        }


        return "signUp";

    }
}
