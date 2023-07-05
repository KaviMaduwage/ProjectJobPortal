<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/18/2023
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <!-- Site Title -->
    <title>Job Gateway</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"

          rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!--
            CSS			============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/signUp.css">
    <style>
        .form-box {
            background-color: #7b6e9b;
            padding: 50px;
            margin-top: 50px;

        }

        .tab-content {
            margin-top: 30px;
        }
    </style>

    <script>
        $(document).ready(function(){
            $('.nav-tabs a').click(function(){
                $(this).tab('show');
            });
        });


        function registerJobSeeker(){
            document.jobSeekerForm.action = "jobSeekerSignUp.htm";
            document.jobSeekerForm.submit();
        }

        function registerEmployer(){
            document.employerForm.action = "employerSignUp.htm";
            document.employerForm.submit();
        }

        function showImagePreview(fileInput){
            $('#imageContainer').show();
            file = fileInput.files[0];
            reader = new FileReader();

            reader.onload = function (e){
                $('#logoPreview').attr('src',e.target.result);
            }
            reader.readAsDataURL(file);

        }

        $(document).ready(function() {
            // Disable the remove button if there's only one set of fields initially
            updateRemoveButtons();

            // Add new set of fields when the plus button is clicked
            $('#addFieldButton').click(function() {
                var fields = $('.educationFields').first().clone();
                fields.find('input[type="date"]').val(''); // Clear the date inputs
                fields.find('select').prop('selectedIndex', 0); // Reset select dropdowns
                // fields.append('<button type="button" class="removeFieldButton">-</button>'); // Add remove button
                $('#fieldsContainer').append(fields);

                // Update remove buttons after adding new fields
                updateRemoveButtons();
            });

            // Remove the respective set of fields when the remove button is clicked
            $(document).on('click', '.removeFieldButton', function() {
                $(this).closest('.educationFields').remove();

                // Update remove buttons after removing fields
                updateRemoveButtons();
            });

            function updateRemoveButtons() {
                var fieldCount = $('.educationFields').length;
                $('.removeFieldButton').prop('disabled', fieldCount <= 1);
            }
        });
    </script>
</head>
<body>
<header id="header">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <h1 class="text-white"><img src="img/companyLogo.png"

                                            alt="" style="width: 100px; height: 66px;"></h1>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="/">Home</a></li>
                    <li><a href="/about-us">About Us</a></li>
                    <li><a href="/category">Category</a></li>
                    <li><a href="/subscription">Subscriptions</a></li>
                    <li><a href="/blog-home">Blog</a></li>
                    <li><a href="/contact">Contact</a></li>
                    <c:if test="${not empty sessionScope.userLogin}">
                        <li><a  href="/viewProfile">Profile</a></li>
                    </c:if>
                    <li><a class="ticker-btn" href="/signUp">Signup</a></li>
                    <li><a class="ticker-btn" href="/login">Login</a></li>
                </ul>
            </nav>
            <!-- #nav-menu-container --> </div>
    </div>
</header>
<!-- #header -->
<!-- start banner Area -->
<section class="banner-area relative" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white"> Sign Up </h1>

            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->


<!-- start form Area -->
<div class="container form-box" style="width: 900px;">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#jobseekers">Job Seekers</a></li>
        <li><a data-toggle="tab" href="#employers">Employers</a></li>
    </ul>

    <div class="tab-content">
        <div id="jobseekers" class="tab-pane fade in active">

            <!-- Job Seeker form fields -->
            <h1>Job Seekers' Form</h1>
            <p>Please fill out this form with the required information</p>
            <form action='jobSeekerSignUp.htm' method="POST" name="jobSeekerForm" enctype="multipart/form-data">
                <div class="box">
                    <h2 class="box-title">Personal Information</h2>

                    <fieldset>
                        <label>First Name: <input type="text" name="firstName" id="firstName" required /></label>
                        <label>Last Name: <input type="text" name="lastName" id="lastName" required /></label>
                        <label>Address: <input type="text" name="address" required /></label>
                        <label>Contact No: <input type="text" name="telNo" required /></label>
                        <label>DOB: <input type="date" name="dob" required /></label>
                        <label>Current Job Title: <input type="text" name="currentJobTitle" required /></label>
<%--                        <label>Age (years): <input type="number" name="age" min="10" max="120" /></label>--%>
                        <label>Gender:</label>
                        <label><input type="radio" name="gender" class="inline" value="M"/> Male</label>
                        <label><input type="radio" name="gender" class="inline" value="F" /> Female</label>
                        <label>Special Note: <textarea name="mySelfDes" rows="3" cols="5"></textarea></label>
                        <fieldset>
                            <label>Upload Your CV: <input type="file" name="cv"  accept="application/pdf"/></label>
                        </fieldset>
                    </fieldset>
                </div>
                <div class="box">
                    <h2 class="box-title">General Information</h2>

                    <fieldset>
                        <label>Field Of Interest: </label>
                        <select multiple id="field" name="field" style="color: #0a0a23">
                            <option value="0" style="font-weight: bold">Select Field</option>
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

                    </fieldset>
                </div>
                <div class="box">
                    <h2 class="box-title">Educational Background</h2>

                    <fieldset>
                        <div id="fieldsContainer">

                                <div class="educationFields">
                                    <div class="box">
                                        <span><label for="qualification">Type of Educational qualification:<button type="button" class="removeFieldButton" style="color: #0a0a23" disabled>-</button></label></span>
                                        <select name="qualification" id="qualification" style="color: #0a0a23">
                                            <option value="0">Select Qualification</option>
                                            <option value="1">Certificate</option>
                                            <option value="2">Diploma</option>
                                            <option value="3">Higher Diploma</option>
                                            <option value="4">Degree</option>
                                            <option value="5">Masters</option>
                                            <option value="6">PHD</option>
                                        </select>
                                        <label for="educationField">Field of Study:</label>
                                        <select name="educationField" id="educationField" style="color: #0a0a23">
                                            <option value="">Select Field</option>
                                            <option value="engineering">Engineering</option>
                                            <option value="medicine">Medicine</option>
                                            <option value="business">Business</option>
                                            <option value="computer science">Computer Science</option>
                                            <option value="biology">Biology</option>
                                            <option value="chemistry">Chemistry</option>
                                            <option value="physics">Physics</option>
                                            <option value="mathematics">Mathematics</option>
                                            <option value="psychology">Psychology</option>
                                            <option value="education">Education</option>
                                            <option value="art">Art</option>
                                            <option value="music">Music</option>
                                            <option value="history">History</option>
                                        </select>

                                        <label>Start Date: <input type="date" name="startDate" required></label>
                                        <label>End Date: <input type="date" name="endDate" required></label>

                                        <label for="StatusType">Status:</label>
                                        <select name="StatusType" id="StatusType" style="color: #0a0a23">
                                            <option value="select">Select</option>
                                            <option value="complete">Complete</option>
                                            <option value="not complete">Not complete</option>
                                            <option value="pending">Pending</option>
                                        </select>
                                        <label>Special Note: <textarea name="description" rows="3" cols="5"></textarea></label>


                                    </div>
                                </div>


                        </div>

                        <button type="button" id="addFieldButton" style="color: #0a0a23">+</button>


                    </fieldset>
                </div>
                <div class="box">
                    <h2 class="box-title">Login Information</h2>

                    <fieldset>
                        <label>Email: <input type="text" name="email" id="email" required /></label>
                        <label>User Name: <input type="text" name="userName" id="userName" required /></label>
                        <label>Password: <input type="password" name="password" id="password" required /></label>
                        <input type="hidden" name="userType" value="3" /></label>


                    </fieldset>
                </div>
                <input type="button" value="Register" onclick="registerJobSeeker()"/>
            </form>

        </div>

        <div id="employers" class="tab-pane fade">

            <!-- Employers form fields -->
            <h1>Employers' Form</h1>
            <p>Please fill out this form with the required information</p>
            <form action='employerSignUp.htm' method="POST" name="employerForm" enctype="multipart/form-data">
                <div class="box">
                    <h2 class="box-title">General Information</h2>
                <fieldset>

                    <label>Company Name: <input type="text" name="companyName" id="companyName" required /></label>
                    <label>Address: <input type="text" name="address" id="address" required /></label>
                    <label>Contact No: <input type="text" name="telNo" id="telNo" required /></label>
                    <label>Headquarters:</label>
                    <select name = "headquarters" id="headquarters" style="color: #0a0a23">
                        <option value = "Select one" selected>Select</option>
                        <option value = "Sri Lanka">Sri Lanka</option>
                        <option value = "Foreign">Foreign</option>
                    </select>
                    <label>Industry Type:</label>
                    <select id="industryType" name="industryType" style="color: #0a0a23">
                        <option value="0">Select Industry Type</option>
                        <c:forEach items="${industryTypeList}" var="industryType" varStatus="status">
                            <c:if test="${industryType.industryTypeId eq selectedIndustryTypeId}">
                                <option value="${industryType.industryTypeId}" SELECTED>
                                        ${industryType.description}
                                </option>
                            </c:if>
                            <c:if test="${industryType.industryTypeId ne selectedIndustryTypeId}">
                                <option value="${industryType.industryTypeId}">
                                        ${industryType.description}
                                </option>
                            </c:if>

                        </c:forEach>

                    </select>
                    <label>Description: <textarea name="description" id="description" rows="3" cols="5"></textarea></label>
                        <label>No of Employees: <input type="number" name="noOfEmployees" id="noOfEmployees" required /></label>
                        <label>Founded by: <input type="text" name="found" id="found" required /></label>
                        <label>Website: <input type="text" name="website" id="website" required /></label>
                        <label>Upload Company Logo: <input type="file" name="companyLogo" id="companyLogo" accept="image/png, image/jpeg" onchange="showImagePreview(this)"/></label>
                        <label>Logo Preview:
                            <div id="imageContainer" style="width: 200px; height: 200px; overflow: hidden; display: none">
                                <img id="logoPreview" alt="Logo Preview" style="max-width: 100%; max-height: 100%;">
                            </div>
                        </label>
                </fieldset>
                </div>
                <div class="box">
                    <h2 class="box-title">Login Information</h2>

                    <fieldset>
                        <label>Email: <input type="text" name="email" required /></label>
                        <label>User Name: <input type="text" name="userName"  required /></label>
                        <label>Password: <input type="password" name="password"  required /></label>
                        <input type="hidden" name="userType" value="2" /></label>


                    </fieldset>
                </div>
                <input type="button" value="Register" onclick="registerEmployer()" />
            </form>

        </div>
    </div>
</div>
<!-- End form Area -->

<!-- start footer Area -->
<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-3  col-md-12">
                <div class="single-footer-widget">
                    <h6>About Us</h6>
                    <ul class="footer-nav">
                        <li>329 1/1, Galle Road, Colombo 03, Sri Lanka</li>
                        <li>(+94) ( 011) 6375163</li>
                        <li>jobGateWay@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6  col-md-12">
                <div class="single-footer-widget newsletter">
                    <h6>Connect With Us</h6>
                    <p>For quick news...</p>
                    <div id="mc_embed_signup">

                        <div class="form-group row" style="width: 100%">
                            <div class="col-lg-8 col-md-12"> <input name="EMAIL" placeholder="Enter Email"
                                                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
                                                                    required="" type="email">
                                <div style="position: absolute; left: -5000px;"> <input name="email" tabindex="-1" value="" type="text"> </div>
                            </div>
                            <div class="col-lg-4 col-md-12"> <button class="nw-btn primary-btn">Subscribe<span

                                    class="lnr lnr-arrow-right"></span></button> </div>
                        </div>
                        <div class="info"></div>

                    </div>
                </div>
            </div>
            <div class="col-lg-3  col-md-12">
                <div class="single-footer-widget mail-chimp">
                    <h6 class="mb-20">Photoes</h6>
                    <ul class="instafeed d-flex flex-wrap">
                        <li><img src="img/i2.jpg" alt=""></li>
                        <li><img src="img/i3.jpg" alt=""></li>
                        <li><img src="img/i4.jpg" alt=""></li>

                    </ul><br>
                    <ul class="instafeed d-flex flex-wrap">
                        <li><img src="img/i6.jpg" alt=""></li>
                        <li><img src="img/i7.jpg" alt=""></li>
                        <li><img src="img/i8.jpg" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End footer Area -->
<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"

        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"

        crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="js/easing.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/main.js"></script>
</body>
</html>
