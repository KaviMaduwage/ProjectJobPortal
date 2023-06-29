<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/25/2023
  Time: 12:56 AM
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
          <li class="menu-has-children"><a href="">Pages</a>
            <ul>
              <li><a href="elements.html">elements</a></li>
              <li><a href="search.html">search</a></li>
              <li><a href="single.html">single</a></li>
            </ul>
          </li>
          <c:if test="${empty sessionScope.userLogin}">
            <li><a class="ticker-btn" href="#">Signup</a></li>
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
<section class="banner-area relative" id="home">
  <div class="overlay overlay-bg"></div>
  <div class="container">
    <div class="row d-flex align-items-center justify-content-center">
      <div class="about-content col-lg-12">
        <h1 class="text-white"> Contact Us </h1>

      </div>
    </div>
  </div>
</section>
<!-- End banner Area -->
<!-- Start contact-page Area -->
<section class="contact-page-area section-gap">
  <div class="container">
    <div class="row">
      <div class="map-wrap" style="width:100%; height: 445px;" id="map"></div>
      <div class="col-lg-4 d-flex flex-column"> <a class="contact-btns" href="#">Submit
        Your CV</a> <a class="contact-btns" href="#">Post New Job</a> <a

              class="contact-btns" href="#">Create New Account</a> </div>
      <div class="col-lg-8">
        <form class="form-area " id="myForm" action="mail.php" method="post">
          <div class="row">
            <div class="col-lg-12 form-group"> <input name="name" placeholder="Enter your name"

                                                      onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'"

                                                      class="common-input mb-20 form-control" required="" type="text">
              <input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"

                     onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'"

                     class="common-input mb-20 form-control" required="" type="email">
              <input name="subject" placeholder="Enter your subject" onfocus="this.placeholder = ''"

                     onblur="this.placeholder = 'Enter your subject'" class="common-input mb-20 form-control"

                     required="" type="text"> <textarea class="common-textarea mt-10 form-control"

                                                        name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"

                                                        required=""></textarea> <button class="primary-btn mt-20 text-white" style="float: right;">Send
                Message</button>
              <div class="mt-20 alert-msg" style="text-align: left;"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- End contact-page Area -->
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
