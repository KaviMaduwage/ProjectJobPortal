<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/25/2023
  Time: 12:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

  <script src="js/vendor/jquery-2.2.4.min.js"></script>

  <script type="text/javascript">
    function loadCompanyList(selectedIndustryType){
      $.ajax({
        url : '<c:url value="/loadCompanyList.htm"/>',
        dataType : "json",
        data : ({
          'selectedIndustryTypeId' :selectedIndustryType
        }),
        success : function (response){
          var companyList = response;


          var dropdown = document.getElementById("company");

          // Clear existing options
          dropdown.innerHTML = "";
          var defaultOption = document.createElement("option");
          defaultOption.value = '0';
          defaultOption.text = "Select Company";
          dropdown.appendChild(defaultOption);

          // Iterate over the company list and create options
          for (var i = 0; i < companyList.length; i++) {
            var company = companyList[i];


            // Create an option element
            var option = document.createElement("option");

            option.value = company.employerId;
            option.appendChild(document.createTextNode(company.companyName));

            // Append the option to the dropdown
            dropdown.appendChild(option);
          }
        }
      });

    }

    function searchVacancies(){
      document.searchForm.action = "searchVacancies.htm";
      document.searchForm.submit();
    }

    function viewVacancy(index){
      var vacancyId= document.getElementById("hiddenVacancyId_" + index).value;
      console.log(vacancyId);
      //const url = `viewVacancy.htm?vacancyId=${vacancyId}`;
      const url = "viewVacancy.htm?vacancyId="+vacancyId;

      window.open(url, '_blank', 'width=900,height=900');

    }
    var temp_index ='' ;
    function applyVacancy(index){
      temp_index = index;
      var vacancyId= document.getElementById("hiddenVacancyId_" + index).value;


      $.ajax({
        url : '<c:url value="/applyVacancy.htm"/>',
        method: 'POST',
        data : ({
          'selectedVacancyId' :vacancyId

        }),
        success : function (response){
          var message = response;
          document.getElementById("appliedStatus_"+temp_index).innerText = message;

        }
      });

    }


  </script>
</head>
<body>
<header id="header">
  <div class="container">
    <div class="row align-items-center justify-content-between d-flex">
      <div id="logo">
        <h1 class="text-white"><img src="img/companyLogo.png"

                                    alt="logo" style="width: 100px; height: 66px;"></h1>
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="/">Home</a></li>
          <li><a href="/about-us">About Us</a></li>
          <li><a href="/category">Category</a></li>
          <li><a href="/subscription">Subscriptions</a></li>
          <li><a href="/blog-home">Blog</a></li>
          <li><a href="/contact">Contact</a></li>
            <c:if test="${not empty sessionScope.userLogin && (sessionScope.userLogin.userType.userTypeId == 2 ||
                                            sessionScope.userLogin.userType.userTypeId ==3)}">
                <li><a  href="/viewProfile">Profile</a></li>
            </c:if>
          <c:if test="${empty sessionScope.userLogin}">
            <li><a class="ticker-btn" href="/signUp">Signup</a></li>
            <li><a class="ticker-btn" href="/login">Login</a></li>
          </c:if>
          <c:if test="${sessionScope.userLogin != null}">
            <li><a class="ticker-btn" href="/logOut">Log Out</a></li>
          </c:if>
        </ul>
      </nav>
      <!-- #nav-menu-container --> </div>
  </div>
</header>
<!-- #header -->
<!-- start banner Area -->
<section class="banner-area relative" id="home" style="background-image: url(../img/category.jpg); background-repeat: no-repeat">
  <div class="overlay overlay-bg" style="opacity: 0;"></div>
  <div class="container">
    <div class="row d-flex align-items-center justify-content-center">
      <div class="about-content col-lg-12">
        <h1 class="text-white"> Job category </h1>

      </div>
    </div>
  </div>
</section>
<!-- End banner Area -->
<!-- Start post Area -->
<div class="container" style="height: 350px">
  <div class="row fullscreen d-flex align-items-center justify-content-center" style="height: 300px">
    <div class="banner-content col-lg-12">

                      <form action="" class="serach-form-area" name="searchForm" method="POST">
                          <div class="row justify-content-center form-wrap">
                            <div class="col-lg-3 form-cols">
                              <div class="default-select" id="default-select3">
                                <select id="industryType" name="industryType" >
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
                              </div>
                            </div>

                              <div class="col-lg-3 form-cols">
                                  <div class="default-select" id="default-selects">
                                  <select id="field" name="field">
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
                              </div>
                              <div class="col-lg-3 form-cols">
                                  <div class="default-select" id="default-selects2">
                                      <select id="position" name="position">
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
                              </div>
                              <div class="col-lg-2 form-cols">
                                <button type="button" class="btn btn-info" onclick="searchVacancies()">
                                  <span class="lnr lnr-magnifier"></span> Search </button>
                              </div>

                          </div>
                      </form>

    </div>
  </div>
</div>
<section class="post-area section-gap" style="padding: 0px">
  <div class="container">
    <div class="row justify-content-center d-flex">
      <div class="col-lg-8 post-list">
        <c:forEach items="${vacancyList}" var="vacancy" varStatus="status">
          <div class="single-post d-flex flex-row ">

            <div class="thumb">
              <input type="hidden" value="${vacancy.vacancyId}" id="hiddenVacancyId_${status.index}">
              <img src="img/company-logos/${vacancy.employer.employerId}_${vacancy.employer.companyName}/${vacancy.employer.logoImage}" alt="" style="width: 100px;height: 100px">

            <ul class="tags">

                <li> ${vacancy.jobField.description} </li>
                <li> ${vacancy.employer.industryType.description} </li>
                <li> ${vacancy.position.description} </li>

              </ul>
            </div>
            <div class="details">
              <div class="title d-flex flex-row justify-content-between">

                <div class="titles"><a href="single.html">
                  <h4>${vacancy.description}</h4>
                </a>
                  <h6>${vacancy.employer.companyName}</h6>
                </div>
                <ul class="btns">


                  <li><button id="viewVacancy" onclick="viewVacancy(${status.index})">View</button></li>
                  <c:if test="${not empty sessionScope.userLogin && sessionScope.userLogin.userType.userTypeId == 3}">
                    <li><button id="applyVacancy" onclick="applyVacancy(${status.index})">Apply</button></li>

                  </c:if>
                </ul>
              </div>
              <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
              <h5>Job Nature: ${vacancy.vacancyType.description}</h5>
              <p>Posted on : <fmt:formatDate value="${vacancy.postedDate}" pattern="yyyy/MM/dd" />    Closing Date : <fmt:formatDate value="${vacancy.closingDate}" pattern="yyyy/MM/dd" /></p>
              <p class="address"><span class="lnr lnr-map"></span> ${vacancy.employer.address}</p>
              <label id="appliedStatus_${status.index}" style="font-weight: bold;color: blue"></label>
            </div>
          </div>

        </c:forEach>


      </div>
      <div class="col-lg-4 sidebar">

        <div class="single-slidebar">
          <h4>Most Recent Job job posts</h4>
          <div class="active-relatedjob-carusel">
          <c:forEach items="${recentVacancyList}" var="vacancy" varStatus="status">
            <div class="single-rated"> <img class="img-fluid" src="img/company-logos/${vacancy.employer.employerId}_${vacancy.employer.companyName}/${vacancy.employer.logoImage}"

                                            alt="">
              <h4>${vacancy.description}</h4>
            </a>
              <h6>${vacancy.employer.companyName}</h6>
              <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
              <h5>Job Nature: ${vacancy.vacancyType.description}</h5>
              <p>Posted on : <fmt:formatDate value="${vacancy.postedDate}" pattern="yyyy/MM/dd" />    Closing Date : <fmt:formatDate value="${vacancy.closingDate}" pattern="yyyy/MM/dd" /></p>
              <p class="address"><span class="lnr lnr-map"></span> ${vacancy.employer.address}</p>
              <a href="#" class="btns text-uppercase">Apply job</a>
            </div>
          </c:forEach>

        </div>

        <div class="single-slidebar">
          <h4>Carrer Advice Blog</h4>
          <div class="blog-list">
            <div class="single-blog " style="background:#000 url(img/blog1.jpg);">
              <a href="single.html">
                <h4>Home Audio Recording <br>
                  For Everyone</h4>
              </a>
              <div class="meta justify-content-between d-flex">
                <p> 02 Hours ago </p>
                <p> <span class="lnr lnr-heart"></span> 06 <span class="lnr lnr-bubble"></span>
                  02 </p>
              </div>
            </div>
            <div class="single-blog " style="background:#000 url(img/blog2.jpg);">
              <a href="single.html">
                <h4>Home Audio Recording <br>
                  For Everyone</h4>
              </a>
              <div class="meta justify-content-between d-flex">
                <p> 02 Hours ago </p>
                <p> <span class="lnr lnr-heart"></span> 06 <span class="lnr lnr-bubble"></span>
                  02 </p>
              </div>
            </div>
            <div class="single-blog " style="background:#000 url(img/blog1.jpg);">
              <a href="single.html">
                <h4>Home Audio Recording <br>
                  For Everyone</h4>
              </a>
              <div class="meta justify-content-between d-flex">
                <p> 02 Hours ago </p>
                <p> <span class="lnr lnr-heart"></span> 06 <span class="lnr lnr-bubble"></span>
                  02 </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End post Area -->
<!-- Start callto-action Area -->
<section class="callto-action-area section-gap">
  <div class="container">
    <div class="row d-flex justify-content-center">
      <div class="menu-content col-lg-9">
        <div class="title text-center">
          <h1 class="mb-10 text-white">Join us today without any hesitation</h1>
          <p class="text-white">- Please login before applying to jobs - </p>
          <a class="primary-btn" href="#">I am a Candidate</a> <a class="primary-btn"

                                                                  href="#">I am an Employer</a> </div>
      </div>
    </div>
  </div>
</section>
<!-- End calto-action Area -->
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
