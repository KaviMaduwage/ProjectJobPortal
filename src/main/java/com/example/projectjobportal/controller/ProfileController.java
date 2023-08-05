package com.example.projectjobportal.controller;

import com.example.projectjobportal.model.*;
import com.example.projectjobportal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    VacancyTypeService vacancyTypeService;
    RequestService requestService;
    QualificationTypeService qualificationTypeService;
    User userObject;
    Employer employerObject;

    public ProfileController(JobSeekerService jobSeekerService,ApplicationHistoryService applicationHistoryService,
                             JobSeekerPreferenceService jobSeekerPreferenceService,JobSeekerQualificationService jobSeekerQualificationService,
                             EmployerService employerService,VacancyService vacancyService,PositionService positionService,
                             JobFieldService jobFieldService,VacancyTypeService vacancyTypeService,RequestService requestService,
                             QualificationTypeService qualificationTypeService) {
        this.jobSeekerService = jobSeekerService;
        this.applicationHistoryService =applicationHistoryService;
        this.jobSeekerPreferenceService = jobSeekerPreferenceService;
        this.jobSeekerQualificationService = jobSeekerQualificationService;
        this.employerService = employerService;
        this.vacancyService = vacancyService;
        this.positionService = positionService;
        this.jobFieldService = jobFieldService;
        this.vacancyTypeService = vacancyTypeService;
        this.requestService = requestService;
        this.qualificationTypeService = qualificationTypeService;
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
        userObject = user;
        if(user.getUserType().getDescription().equalsIgnoreCase("jobSeeker")){
            generateJobSeekerData(model,user);
            return "jobSeekerProfile";
        }else if(user.getUserType().getDescription().equalsIgnoreCase("employer")){
            generateEmployerData(model,user);
            return "employerProfile";
        }else{
            generateAdminData(model);
            return "adminProfile";
        }


    }

    private void generateAdminData(Model model) {
        List<Request> requestList = requestService.getNotApprovedRequestList();
        model.addAttribute("requestList",requestList);

        List<Request> approvedList = requestService.getApprovedRequestList();
        model.addAttribute("approvedRequest",approvedList);
    }

    private void generateEmployerData(Model model, User user) {
        Employer employer = employerService.getEmployerByUserId(user.getUserId());
        if(employer != null){
            employerObject = employer;
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

    @RequestMapping( value = "/postVacancy.htm", method = RequestMethod.POST)
    public String postVacancy(@RequestParam("vacancyImg") MultipartFile multipartFile,HttpServletRequest request,Model model) throws IOException{
        String message = "success";
        String fieldId = request.getParameter("field");
        String vacancyTypeId = request.getParameter("vacancyType");
        String positionId = request.getParameter("position");
        String closingDateStr = request.getParameter("closingDate");
        String jobDes = request.getParameter("jobDes");


        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "src/main/resources/static/img/vacancies/"+employerObject.getEmployerId()+"_"+employerObject.getCompanyName();
        Path uploadpath = Paths.get(uploadDir);

        JobField jobField = jobFieldService.getJobFieldList().get(Integer.parseInt(fieldId)-1);
        VacancyType vacancyType = vacancyTypeService.getVacancyTypeById(Integer.parseInt(vacancyTypeId));
        Position position = positionService.getJobPositionList().get(Integer.parseInt(positionId)-1);


        Vacancy vacancy = new Vacancy();
        vacancy.setDescription(jobDes);
        vacancy.setEmployer(employerObject);
        vacancy.setJobField(jobField);
        vacancy.setPosition(position);
        vacancy.setVacancyType(vacancyType);
        vacancy.setPostedDate(new Date());
        Date closingDate;
        try {
            closingDate = new SimpleDateFormat("yyyy-MM-dd").parse(closingDateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        vacancy.setClosingDate(closingDate);
        vacancy.setVacancyImageName(fileName);

        vacancyService.saveVacancy(vacancy);


        try{
            if(!Files.exists(uploadpath)){
                Files.createDirectories(uploadpath);
            }
            InputStream inputStream = multipartFile.getInputStream();
            Path filePath = uploadpath.resolve(fileName);

            Files.copy(inputStream, filePath,
                    StandardCopyOption.REPLACE_EXISTING);

        }catch (IOException e){
            throw  new IOException("couldn't save uploaded image :"+ fileName);
        }
        generateEmployerData(model,userObject);

        return "employerProfile";

    }

    @GetMapping("/downloadCv")
    public void downloadCv(@RequestParam("applicantId") String jobSeekerId, HttpServletRequest request, HttpServletResponse response){
        JobSeeker jobSeeker  =jobSeekerService.getJobSeekerByJobSeekerId(Integer.parseInt(jobSeekerId));
        if(jobSeeker != null){
            String filename = jobSeeker.getCvFileName();
            String filePath = "src/main/resources/static/files/cv/"+jobSeeker.getJobSeekerId()+"/"+filename;

            try {
                File file = new File(filePath);
                FileInputStream fis = new FileInputStream(file);

                // Set response headers
                response.setContentType("application/pdf");
                response.setContentLength((int) file.length());
                response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

                // Copy the file content to the response output stream
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                fis.close();
                outputStream.close();
            }catch (IOException e){
                throw new RuntimeException(e);
            }

        }
    }
    @RequestMapping(value = "/acceptRequest", method = RequestMethod.GET)
    public String acceptRequest(@RequestParam("requestId") String requestId, Model model){

        Request request = requestService.getRequestById(Integer.parseInt(requestId));
        if(request!=null){
            boolean isApproved = true;
            Date approvedDate = new Date();

            requestService.updateRequest(isApproved,approvedDate, Integer.parseInt(requestId));
        }

        generateAdminData(model);
        return "adminProfile";
    }

    @RequestMapping(value = "/rejectRequest", method = RequestMethod.GET)
    public String rejectRequest(@RequestParam("requestId") String requestId, Model model){

        Request request = requestService.getRequestById(Integer.parseInt(requestId));
        if(request != null){
            boolean isApproved = false;
            Date approvedDate = null;

            requestService.updateRequest(isApproved,approvedDate, Integer.parseInt(requestId));
        }

        generateAdminData(model);
        return "adminProfile";
    }
    @RequestMapping(value = "/removePreferences.htm", method = RequestMethod.POST)
    public String removePreferences(@RequestParam("preferenceId") String preferenceId,HttpServletRequest request,Model model, HttpSession session){

        String jobFieldId = preferenceId;
        User user = (User) session.getAttribute("userLogin");
        JobSeeker jobSeeker = jobSeekerService.getJobSeekerByUserId(user.getUserId());
        int jobSeekerId = jobSeeker.getJobSeekerId();

        jobSeekerPreferenceService.deleteJobSeekerPreference(Integer.parseInt(jobFieldId), jobSeekerId);

        String pageName = getProfilePage(model,session);
        return pageName;
    }
    @RequestMapping(value = "/saveNewPreferences.htm", method = RequestMethod.POST)
    public String saveNewPreferences(HttpServletRequest request, HttpSession session, Model model){
        String[] fields = request.getParameterValues("field");

        User user = (User) session.getAttribute("userLogin");
        JobSeeker jobSeeker = jobSeekerService.getJobSeekerByUserId(user.getUserId());
        List<JobSeekerPreference> jobSeekerPreferenceList = jobSeekerPreferenceService.getPreferenceListByJobSeekerId(jobSeeker.getJobSeekerId());
        List<Integer> savedPreferFieldIds = new ArrayList<>();
        List<Integer> toBeSavedPreferFieldIdS = new ArrayList<>();

        if(jobSeekerPreferenceList != null && jobSeekerPreferenceList.size() > 0){
            for(int i=0;i<jobSeekerPreferenceList.size();i++){
                savedPreferFieldIds.add(jobSeekerPreferenceList.get(0).getJobField().getJobFieldId());
            }
        }
        for(int i=0;i<fields.length;i++){
            if(!savedPreferFieldIds.contains(Integer.parseInt(fields[i]))){
                toBeSavedPreferFieldIdS.add(Integer.parseInt(fields[i]));
            }
        }
        if(toBeSavedPreferFieldIdS.size() > 0){
            List<JobSeekerPreference> newPreferenceList = new ArrayList<>();
            for(int i=0;i<toBeSavedPreferFieldIdS.size();i++){
                JobField jobField = jobFieldService.getJobFieldList().get(Integer.parseInt(fields[i])-1);
                JobSeekerPreference jobSeekerPreference = new JobSeekerPreference();
                jobSeekerPreference.setJobField(jobField);
                jobSeekerPreference.setJobSeeker(jobSeeker);

                newPreferenceList.add(jobSeekerPreference);
            }

            jobSeekerPreferenceService.saveAllJobSeekerPreferences(newPreferenceList);

        }else{
            model.addAttribute("noPreference","No New Preference To Add.");
        }
        String pageName = getProfilePage(model,session);
        return pageName;
    }

    @RequestMapping("/addNewEducationQua.htm")
    public String getQualificationPage(Model model,HttpServletRequest request){


        return "addNewEducationQua";
    }

    @RequestMapping(value = "/saveNewQualification.htm", method = RequestMethod.POST)
    public String saveNewQualifications(Model model,HttpServletRequest request, HttpSession session){

        //get educational details
        String[] qualifications = request.getParameterValues("qualification");
        String[] educationFields = request.getParameterValues("educationField");
        String[] startDates = request.getParameterValues("startDate");
        String[] endDates = request.getParameterValues("endDate");
        String[] statuses = request.getParameterValues("StatusType");
        String[] description = request.getParameterValues("description");

        User user = (User) session.getAttribute("userLogin");
        JobSeeker jobSeeker = jobSeekerService.getJobSeekerByUserId(user.getUserId());

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
            jobSeekerQualification.setJobSeeker(jobSeeker);
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
        String pageName = getProfilePage(model,session);
        return pageName;
    }

}
