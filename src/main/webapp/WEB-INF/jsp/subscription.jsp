<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/25/2023
  Time: 12:52 AM
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

                    <li><a href="/contact">Contact</a></li>
                    <c:if test="${not empty sessionScope.userLogin }">
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
<section class="banner-area relative" id="home">
    <div class="overlay overlay-bg" style="opacity: 0;"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white"> Pricing Plan </h1>

            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->
<!-- Start price Area -->
<section class="price-area section-gap" id="price">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">Choose the best pricing plan for you</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>Basic</h4>
                    </div>
                    <ul class="lists">
                        <li>Top search</li>
                        <li>Secure online chat</li>
                        <li>Limited vacancy posting</li>
                        <li>Customer Service</li>
                    </ul>
                    <div class="price-bottom">
                        <div class="price-wrap d-flex flex-row justify-content-center">
                            <span class="price">Rs.</span>
                            <h1> 399 </h1>
                            <span class="time">Per <br>
                    Month</span> </div>
                        <a href="" class="primary-btn header-btn">Get Started</a> </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>Standard</h4>
                    </div>
                    <ul class="lists">
                        <li>Top search</li>
                        <li>Secure online chat</li>
                        <li>Limited vacancy posting</li>
                        <li>Customer Service</li>
                        <li>10GB cloud space</li>
                    </ul>
                    <div class="price-bottom">
                        <div class="price-wrap d-flex flex-row justify-content-center">
                            <span class="price">Rs</span>
                            <h1> 699 </h1>
                            <span class="time">Per <br>
                    Month</span> </div>
                        <a href="" class="primary-btn header-btn">Get Started</a> </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>Ultimate</h4>
                    </div>
                    <ul class="lists">
                        <li>Top search</li>
                        <li>Secure online chat</li>
                        <li>Unlimited job posting</li>
                        <li>Customer Service</li>
                        <li>30GB cloud space</li>
                    </ul>
                    <div class="price-bottom">
                        <div class="price-wrap d-flex flex-row justify-content-center">
                            <span class="price">Rs.</span>
                            <h1> 1099 </h1>
                            <span class="time">Per <br>
                    Month</span> </div>
                        <a href="" class="primary-btn header-btn">Get Started</a> </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End price Area -->
<!-- Start feature Area -->
<section class="feature-area">
    <div class="container-fluid">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-3 feat-img no-padding"> <img class="img-fluid" src="img/pages/f1.jpg"

                                                            alt=""> </div>
            <div class="col-lg-3 no-padding feat-txt">
                <h6 class="text-uppercase text-white"><br>
                </h6>
                <h1>Who we are</h1>
                <p>Welcome to our job portal, where we strive to bridge the gap between job seekers and employers. We understand the challenges individuals face when searching for their dream job or the perfect candidate to join their team. </p>

            </div>
            <div class="col-lg-3 feat-img no-padding"> <img class="img-fluid" src="img/pages/f2.jpg"

                                                            alt=""> </div>
            <div class="col-lg-3 no-padding feat-txt"><br>
                <h1>What we do</h1>
                <p>With a user-friendly interface and powerful search functionality, our job portal offers a vast database of job listings from various industries and locations.</p>

            </div>
        </div>
    </div>
</section>

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
