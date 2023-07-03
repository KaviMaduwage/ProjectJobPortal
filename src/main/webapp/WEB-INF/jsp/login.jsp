<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/28/2023
  Time: 9:24 PM
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
    <link rel="stylesheet" href="css/style.css">

    <script type="text/javascript">
        function login(){
            document.loginForm.action = "getLoginAccess.htm";
            document.loginForm.submit();
        }
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
                    <c:if test="${not empty sessionScope.userLogin && (sessionScope.userLogin.userType.userTypeId == 2 ||
                                            sessionScope.userLogin.userType.userTypeId ==3)}">
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
                <h1 class="text-white"> LOGIN </h1>

            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->


<!-- start form Area -->
<div class="container" style="padding: 40px">
    <div class="screen">
        <div class="screen__content">

            <form class="login" name="loginForm" method="POST">
                <div>
                    <p style="color: red;font-weight: bold">${errorMessage}</p>
                </div>
                <div class="login__field">
                    <i class="login__icon fas fa-lock"></i>
                    <input type="text" class="login__input" id="userName_email" name="userName_email" placeholder="User name / Email">
                </div>
                <div class="login__field">
                    <i class="login__icon fas fa-lock"></i>
                    <input type="password" class="login__input" id="password" name="password" placeholder="Password">
                </div>
                <button class="button login__submit" onclick="login()">
                    <span class="button__text">Login Now</span>
                    <i class="button__icon fas fa-chevron-right"></i>

                </button>
            </form>

        </div>
        <div class="screen__background">
            <span class="screen__background__shape screen__background__shape4"></span>
            <span class="screen__background__shape screen__background__shape3"></span>
            <span class="screen__background__shape screen__background__shape2"></span>
            <span class="screen__background__shape screen__background__shape1"></span>
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

