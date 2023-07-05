<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/3/2023
  Time: 9:46 AM
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
    <title>Employer profile</title>
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />

    <script>
        function postVacancy(){

            document.postVacancyForm.action = "postVacancy.htm";
            document.postVacancyForm.submit();
            <%--console.log("1234");--%>

            <%--var field = document.getElementById("field").value;--%>
            <%--var vacancyType = document.getElementById("vacancyType").value;--%>
            <%--var position = document.getElementById("position").value;--%>
            <%--var closingDate = document.getElementById("closingDate").value;--%>
            <%--var jobDes = document.getElementById("jobDes").value;--%>
            <%--var image = document.getElementById("vacancyImg").files[0];--%>

            <%--$.ajax({--%>
            <%--    url : '<c:url value="/postVacancy.htm"/>',--%>
            <%--    method: 'POST',--%>
            <%--    contentType: false,--%>
            <%--    data : ({--%>
            <%--        'selectedFieldId' :field,--%>
            <%--        'selectedVacancyTypeId' : vacancyType,--%>
            <%--        'selectedPositionId' : position,--%>
            <%--        'closingDate' : closingDate,--%>
            <%--        'jobDes' : jobDes,--%>
            <%--        'image':image--%>


            <%--    }),--%>
            <%--    success : function (response){--%>
            <%--        var message = response;--%>
            <%--        console.log(response);--%>

            <%--    }--%>
            <%--});--%>

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
            <li><a href="#about"><i class="bi fs-5 bi-info-square me-2"></i> About</a></li>
            <li><a href="#preVacancies"><i class="bi fs-5 bi-gear me-2"></i> Previous Vacancies</a></li>
            <li><a href="#addNewVacancy"><i class="bi fs-5 bi-columns-gap me-2"></i>New Vacancies</a></li>
            <li><a href="#viewApplicants"><i class="bi fs-5 bi-newspaper me-2"></i> View Applicants</a></li>
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
                    <img src="img/company-logos/${employer.employerId}_${employer.companyName}/${employer.logoImage}" class="rounded-pill bg-white p-2 shadow" alt="">
                </div>
                <b class="fs-6">Hello we are, ${employer.companyName}</b>
                <h1 class="fw-bold mb-4 fs-1">Leading ${employer.industryType.description} company in Sri Lanka</h1>
                <p></p>
                <ul>
                    <li>
                        <a href="#addNewVacancy"><button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill">Post a  Vacancy</button></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!--########################## About Us Starts Here ############################# -->

    <div id="about" class="about px-4 bg-white py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">About Us</h2>
        </div>
        <div class="row">
            <div class="col-md-7">
                <p class="pt-2 fs-6 text-justify">${employer.description}</p>
                <h4 class=" fs-5 my-3 mt-4 fw-bolder">Other Details</h4>

                <div class="row skill-set">
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Address : </h6>${employer.address}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Telephone No : </h6>${employer.tel}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Email : </h6>${employer.user.email}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Founded On : </h6>${employer.founded}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">HeadQuarters : </h6>${employer.headquarters}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">No Of Employees : </h6>${employer.noOfEmployees}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Website : </h6>${employer.website}</span>
                    </div>
                    <div class="col-md-6 py-3">
                        <span><h6 class="fw-bold">Industry Type : </h6>${employer.industryType.description}</span>
                    </div>

                </div>
            </div>
            <div class="col-md-5">
                <img src="img/company-logos/${employer.employerId}_${employer.companyName}/${employer.companyName}_env.png" alt="" style="width: 1000px;height: 400px;border-radius: 10px">
            </div>
        </div>
    </div>

    <!--########################## Previous Vacancies Starts Here ############################# -->

    <div id="preVacancies" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Previous Vacancies</h2>
        </div>
        <div class="row mt-5">
            <c:forEach items="${vacancies}" var="vacancy" varStatus="status">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="serv-cove shadow-md rounded bg-white text-center p-4">
                        <i class="bi fs-1 bi-boxes"></i>
                        <h5 class="mt-3 fs-6 fw-bold">${vacancy.description}</h5>
                        <h5>Job Nature: ${vacancy.vacancyType.description}</h5>
                        <p>Posted on : <fmt:formatDate value="${vacancy.postedDate}" pattern="yyyy/MM/dd" />  <br>  Closing Date : <fmt:formatDate value="${vacancy.closingDate}" pattern="yyyy/MM/dd" /></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>




        <!--########################## Post a Vacancy Starts Here ############################# -->
    <div id="addNewVacancy" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">New Vacancy</h2>

        </div>
        <div class="contact-row m-0 row">
            <div>
                <div class="shadow-md p-4 rounded bg-white">
                <form name="postVacancyForm" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="field" class="form-label fw-bolder fs-8">Select Job Field:</label>
                        <select class="form-control" id="field" name="field">
                            <option value="0">Select Field</option>
                            <c:forEach items="${jobFieldList}" var="jobField" varStatus="status">
                                <c:if test="${jobField.jobFieldId eq selectedJobFiledId}">
                                    <option value="${jobField.jobFieldId}" SELECTED>
                                            ${jobField.description}
                                    </option>
                                </c:if>
                                <c:if test="${jobField.jobFieldId ne selectedJobFiledId}">
                                    <option value="${jobField.jobFieldId}">
                                            ${jobField.description}
                                    </option>
                                </c:if>

                            </c:forEach>

                        </select>
                    </div>


                    <div class="mb-3">
                        <label for="vacancyType" class="form-label fw-bolder fs-8">Select Vacancy Type:</label>
                        <select class="form-control" id="vacancyType" name="vacancyType">
                            <option value="0">Select Vacancy Type</option>
                            <option value="1">Full-time</option>
                            <option value="2">Part-time</option>
                            <option value="3">Contract</option>
                            <option value="4">Temporary</option>
                            <option value="5">Internship</option>

                        </select>
                    </div>

                        <div class="mb-3">
                            <label for="position" class="form-label fw-bolder fs-8">Select Position Type:</label>
                            <select class="form-control" id="position" name="position" >
                                <option value="0">Select Position</option>
                                <c:forEach items="${positionList}" var="jobPosition" varStatus="status">
                                    <c:if test="${jobPosition.positionId eq selectedPositionId}">
                                        <option value="${jobPosition.positionId}" SELECTED>
                                                ${jobPosition.description}
                                        </option>
                                    </c:if>
                                    <c:if test="${jobPosition.positionId ne selectedPositionId}">
                                        <option value="${jobPosition.positionId}">
                                                ${jobPosition.description}
                                        </option>
                                    </c:if>

                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="closingDate" class="form-label fw-bolder fs-8">Select Closing Date:</label>
                            <input type="date" class="form-control" id="closingDate" name="closingDate" placeholder="Enter Closing date">
                        </div>
                        <div class="mb-3">
                            <label for="jobDes" class="form-label fw-bolder fs-8">Job Description:</label>
                            <input type="text" class="form-control" placeholder="Enter Description" id="jobDes" name="jobDes" />
                        </div>
                        <div class="mb-3">
                            <label for="vacancyImg" class="form-label fw-bolder fs-8">Upload Image
                                <input type="file" id="vacancyImg" name="vacancyImg" accept="image/png,image/jpeg"></label>
                        </div>
                        <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill" onclick="postVacancy()">Post Vacancy</button>
                </form>
                </div>
            </div>

        </div>
    </div>

    <!--########################################recived applicaions######################## -->


    <div id="viewApplicants" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Received Applications</h2>
        </div>
        <div class="row mt-5">


            <c:forEach items="${applicants}" var="applicant" varStatus="status">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="serv-cove shadow-md rounded bg-white text-center p-4">
                        <h5 class="mt-3 fs-6 fw-bold">${applicant.jobSeeker.firstName} ${applicant.jobSeeker.lastName}</h5>
                        <h5 class="mt-3 fs-6 fw-bold">${applicant.vacancy.description} Position</h5>
                        <p>Posted on : <fmt:formatDate value="${applicant.vacancy.postedDate}" pattern="yyyy/MM/dd" />  <br>  Applied On Date : ${applicant.appliedDate} </p>

                        <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill"><a href="/downloadCv?applicantId=${applicant.jobSeeker.jobSeekerId}">Download Resume</a></button>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>


    <!--########################## Contact Us Starts Here ############################# -->

    <div id="contact" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Contact Us</h2>
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
                            <li>${employer.tel}</li>

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
                            <li>${employer.user.email}</li>

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
                            <li>${employer.address}</li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
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