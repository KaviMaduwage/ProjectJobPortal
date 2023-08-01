<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/3/2023
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee User profile</title>
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />

    <script>
        function viewVacancy(index){
            var vacancyId= document.getElementById("hiddenVacancyId_" + index).value;
            console.log(vacancyId);
            const url = "viewVacancy.htm?vacancyId="+vacancyId;

            window.open(url, '_blank', 'width=900,height=900');

        }

        function showResumeInput(){
            $('#resumeInput').show();
        }

        function removePreferences(index){
            var preferenceId= document.getElementById("hiddenPreferenceId_" + index).value;
            document.jobSeekerPreferenceForm.action = "removePreferences.htm?preferenceId="+preferenceId;
            document.jobSeekerPreferenceForm.submit();
        }
    </script>
</head>
<header class="head">
    <div class="logo border-bottom">
        <img class="w-100" src="assets/images/logo.jpg" alt="" />
        <a class="navbar-toggler d-block d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-list"></i>
        </a>
    </div>
    <div id="navbarNav" class="navcol d-none d-lg-block">
        <ul>
            <li><a href="/"><i class="bi bi-house-door fs-5 me-2"></i> Home</a></li>
            <li><a href="#about"><i class="bi fs-5 bi-info-square me-2"></i> About me</a></li>
            <li><a href="#qualifications"><i class="bi fs-5 bi-people me-2"></i> Qualifications</a></li>
            <li><a href="#fields"><i class="bi fs-5 bi-gear me-2"></i> Preferred Fields</a></li>
            <li><a href="#appliedJobs"><i class="bi fs-5 bi-people me-2"></i> Applied Jobs</a></li>
            <li><a href="#uploadResume"><i class="bi fs-5 bi-people me-2"></i> Resume Updates</a></li>
            <li><a href="#contact"><i class="bifs-5  bi-envelope me-2"></i> Contact</a></li>
        </ul>
    </div>

</header>
<div  class="main-content">

    <!--########################## Profile Starts Here ############################# -->

    <div class="profile-head">
        <div class="row vh-100">
            <div class="col-xl-6 text-center mx-auto align-self-center ">
                <div class="imgcover mb-4">
                    <img src="img/profileImg.png" class="rounded-pill bg-white p-2 shadow" alt="">
                </div>
                <b class="fs-6">Hello I am, ${jobSeeker.firstName} ${jobSeeker.lastName}</b>
                <h1 class="fw-bold mb-4 fs-1">${jobSeeker.currentJobTitle}</h1>
                <p style="text-transform: uppercase">As a dedicated and experienced job seeker, I am motivated to contribute my versatile skills and be a results-oriented team player, bringing enthusiasm
                    and a detail-oriented approach to solve challenges in your organization.</p>

<%--                <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill">Download Resume</button>--%>
                <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill"><a href="/downloadCv?applicantId=${jobSeeker.jobSeekerId}">Download Resume</a></button>
                <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill"><a href="#uploadResume">Upload Resume</a></button>
                <input type="file" id="resumeInput" accept="application/pdf" style="display: none;">
            </div>
        </div>
    </div>

    <!--########################## About Us Starts Here ############################# -->

    <div id="about" class="about px-4 bg-white py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">About Me</h2>
        </div>
        <div class="row">
            <div class="col-md-7">
                <p><b>I am, ${jobSeeker.firstName} ${jobSeeker.lastName}</b></p>
                <p class="pt-2 fs-6 text-justify">${jobSeeker.mySelfDes}</p>
                <h4 class=" fs-5 my-3 mt-4 fw-bolder">Other Details</h4>


                <div class="row skill-set">
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Date Of Birth : </h6><fmt:formatDate value="${jobSeeker.dob}" pattern="yyyy/MM/dd" /></span>

                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Age : </h6>${jobSeeker.age}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Gender : </h6>${jobSeeker.gender}</span>
                    </div>

                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Address : </h6>${jobSeeker.address}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Tel No : </h6>${jobSeeker.telNo}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Email : </h6> ${jobSeeker.user.email}</span>
                    </div>





                </div>
            </div>
            <div class="col-md-5">
                <img src="img/profileImg.png" alt="" style="height: 400px;width: 300px">
            </div>
        </div>
    </div>

    <div id="qualifications" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <div class="d-flex align-items-center">
                <h2 class="fw-bolder">Educational Qualifications</h2>
                <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 ms-3 rounded-pill" style="margin-top: -9px">+</button>
            </div>

        </div>
        <div class="row mt-5">
            <label>${noQualification}</label>
            <c:forEach items="${qualifications}" var="qualification" varStatus="status">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="serv-cove shadow-md rounded bg-white p-3">
                        <div class="prf row mb-3">

                            <div class="col-md-12 align-self-center">
                                <h6 class="mb-0 fw-bolder" style="text-transform: uppercase;">${qualification.qualificationType.description}</h6>
                                <span>${qualification.eduField}</span>
                            </div>

                        </div>
                        <div class="details">
                            <span style="color: blue"><label class="fs-7 fst-italic" style="font-weight: bold">Status   : </label>  ${qualification.status}</span><br>
                            <span><label class="fs-7 fst-italic" style="font-weight: bold">Started On   : </label>  ${qualification.startDate}</span><br>
                            <span><label class="fs-7 fst-italic" style="font-weight: bold">Ended on   : </label>  ${qualification.endDate}</span><br>
                            <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill" >Remove</button>

                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>

    <!--##########################  Starts Here ############################# -->
    <form action="" name="jobSeekerPreferenceForm" method="POST">
    <div id="fields" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <div class="d-flex align-items-center">
                <h2 class="fw-bolder">Preferred Fields</h2>
                <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 ms-3 rounded-pill" style="margin-top: -9px">+</button>
            </div>
        </div>
        <label>${noPreference}</label>
        <div class="row mt-5">
            <c:forEach items="${preferences}" var="preference" varStatus="status">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="serv-cove shadow-md rounded bg-white text-center p-4">
                        <i class="bi fs-1 bi-boxes"></i>
                        <h5 class="mt-3 fs-6 fw-bold">${preference.jobField.description}</h5>
                        <input type="hidden" name="hiddenPreferenceId" value="${preference.jobField.jobFieldId}" id="hiddenPreferenceId_${status.index}">

                        <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill" onclick="removePreferences(${status.index})" >Remove</button>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    </form>

    <div id="appliedJobs" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Applied Jobs</h2>

        </div>
        <label>${noVacancy}</label>
        <div class="row mt-5">
            <c:forEach items="${appliedJobs}" var="appliedJob" varStatus="status">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="serv-cove shadow-md rounded bg-white p-3">
                        <input type="hidden" value="${appliedJob.vacancy.vacancyId}" id="hiddenVacancyId_${status.index}">
                        <div class="prf row mb-3">
                            <div class="col-md-3">
                                <img class="rounded-pill"
                                     src="img/company-logos/${appliedJob.vacancy.employer.employerId}_${appliedJob.vacancy.employer.companyName}/${appliedJob.vacancy.employer.logoImage}"
                                     alt="" style="width: 70px;height: 70px">
                            </div>
                            <div class="col-md-9 align-self-center">
                                <h6 class="mb-0 fw-bolder">${appliedJob.vacancy.description}</h6>
                                <span>${appliedJob.vacancy.employer.companyName}</span>
                            </div>


                        </div>
                        <div class="details">
                            <p class="fs-7 fst-italic">Job Nature : ${appliedJob.vacancy.vacancyType.description}</p>
                            <p class="fs-7 fst-italic">Applied on : ${appliedJob.appliedDate}"</p><br>
                            <ul class="btns">
                                <li ><button id="viewVacancy" onclick="viewVacancy(${status.index})" style="padding: 5px">View</button>
                                    <button id="removeVacancy" onclick="" style="padding: 5px">Remove</button></li>



                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>

    <div id="uploadResume" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Resume Updates</h2>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="mb-3">
                    <label for="vacancyImg" class="form-label fw-bolder fs-8">Upload CV
                        <input type="file" id="vacancyImg" name="vacancyImg" accept="application/pdf"></label><br>
                    <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill"><a href="">Upload</a></button>


                </div>

            </div>

        </div>
    </div>


    <!--########################## Contact Us Starts Here ############################# -->

    <div id="contact" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Contact</h2>

        </div>
        <div class="contact-row m-0 mt-5 row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="shadow-md row p-4 m-0 rounded bg-white">
                    <div class="col-md-3 text-center align-self-center">
                        <i class="bi fs-1 bi-headphones"></i>
                    </div>
                    <div class="col-md-9">
                        <h6 class="fs-7 fw-bolder">Phone</h6>
                        <ul>
                            <li>${jobSeeker.telNo}</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="shadow-md row p-4 m-0 rounded bg-white">
                    <div class="col-md-3 text-center align-self-center">
                        <i class="bi fs-1 bi-headphones"></i>
                    </div>
                    <div class="col-md-9">
                        <h6 class="fs-7 fw-bolder">Email</h6>
                        <ul>
                            <li style="white-space: normal; word-wrap: break-word;">${jobSeeker.user.email}</li>

                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="shadow-md row p-4 m-0  rounded bg-white">
                    <div class="col-md-3 text-center align-self-center">
                        <i class="bi fs-1 bi-headphones"></i>
                    </div>
                    <div class="col-md-9">
                        <h6 class="fs-7 fw-bolder">Address</h6>
                        <ul>
                            <li style="white-space: normal; word-wrap: break-word;">${jobSeeker.address}</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
<%--        <div id="contact" class="contact-row m-0 row">--%>
<%--            <div class="col-md-6">--%>
<%--                <div class="shadow-md p-4 rounded bg-white">--%>
<%--                    <h4 class="fs-6 fw-bolder mb-3">Contact Form</h4>--%>
<%--                    <form action="">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="exampleFormControlInput1" class="form-label fw-bolder fs-8">Email address</label>--%>
<%--                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Enter Email Address">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="exampleFormControlInput1" class="form-label fw-bolder fs-8">Enter Subject</label>--%>
<%--                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Enter Subject">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="exampleFormControlTextarea1" class="form-label fw-bolder fs-8">Example textarea</label>--%>
<%--                            <textarea class="form-control" placeholder="Enter Message" id="exampleFormControlTextarea1" rows="3"></textarea>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <div class="shadow-md p-4 rounded bg-white">--%>
<%--                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15659.16664494769!2d77.32095495000002!3d11.1288885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1660839868672!5m2!1sen!2sin" style="width:100%" height="340" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>





</div>
<body>
</body>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>

</html>
