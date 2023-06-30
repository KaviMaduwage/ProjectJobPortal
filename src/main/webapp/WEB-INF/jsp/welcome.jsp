<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/18/2023
  Time: 10:16 AM
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
            <div id="logo"> <img src="img/companyLogo.png"

                                 alt="" style="width: 100px; height: 66px;"> </div>
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
<section class="banner-area relative" id="home" style="background-image: url(../img/job_seeker1.jpg); background-repeat: no-repeat">
    <div class="overlay overlay-bg" style="opacity: 0.15"></div>
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-12">
                <h1 class="text-white" style="font-weight: bold;font-size: 50px"> Find Your Dream Job </h1><br>
                <h1 class="text-white" style="font-weight: bold;font-size: 50px"> Join With Us Today  </h1><br>
<%--                <h1 class="text-white" style="font-weight: bold;font-size: 60px"> - JOB GATEWAY - </h1><br>--%>
<%--                <form action="search.html" class="serach-form-area">--%>
<%--                    <div class="row justify-content-center form-wrap">--%>
<%--                        <div class="col-lg-4 form-cols">--%>
<%--                            <div class="default-select" id="default-select">--%>
<%--                                <select id="company" name="company">--%>
<%--                                    <option value="0">Select Company</option>--%>

<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-3 form-cols">--%>
<%--                            <div class="default-select" id="default-selects">--%>
<%--                            <select id="field" name="field">--%>
<%--                                <option value="0">Select Field</option>--%>

<%--                            </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-3 form-cols">--%>
<%--                            <div class="default-select" id="default-selects2">--%>
<%--                                <select id="position" name="position">--%>
<%--                                    <option value="0">Select Position</option>--%>
<%--                                    <option value="2">Medical</option>--%>
<%--                                    <option value="3">Technology</option>--%>
<%--                                    <option value="4">Goverment</option>--%>
<%--                                    <option value="5">Development</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-2 form-cols"> <button type="button" class="btn btn-info">--%>
<%--                            <span class="lnr lnr-magnifier"></span> Search </button> </div>--%>

<%--                    </div>--%>
<%--                </form>--%>

            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->
<!-- Start features Area -->
<section class="features-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Searching</h4>
                    <p>Find what you're looking for quickly and effortlessly</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Applying</h4>
                    <p>Apply now to start your journey towards success</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>History</h4>
                    <p>Explore your past applications and their status </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Notifications</h4>
                    <p>Stay updated with important news and job alerts </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End features Area -->
<!-- Start popular-post Area -->
<section class="popular-post-area pt-100">
    <div class="container">
        <div class="row align-items-center">
            <div class="active-popular-post-carusel">
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img class="img-fluid" src="img/p1.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Colombo</h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img src="img/p2.png" alt=""> <a class="btns text-uppercase"

                                                                         href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Colombo</h6>
                        <h6></h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img src="img/p1.png" alt=""> <a class="btns text-uppercase"

                                                                         href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Colombo</h6>
                        <h6></h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img src="img/p2.png" alt=""> <a class="btns text-uppercase"

                                                                         href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Colombo</h6>
                        <h6></h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img src="img/p1.png" alt=""> <a class="btns text-uppercase"

                                                                         href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Colombo</h6>
                        <h6></h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb"> <img src="img/p2.png" alt=""> <a class="btns text-uppercase"

                                                                         href="#">view job post</a> </div>
                    <div class="details"> <a href="#">
                        <h4>Creative Designer</h4>
                    </a>
                        <h6>Los Angeles</h6>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam quis. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End popular-post Area -->
<!-- Start feature-cat Area -->
<section class="feature-cat-area pt-100" id="category">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">Available Job Categories</h1>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/accountant.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Accounting</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/software-engineer.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>IT</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/banker.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Banking/Insurance</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/media.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Media &amp; News</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/medical-team.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Medical</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/government.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Government</p>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 20px">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/salesman.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Sales/Marketing</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/logistic.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Logistic</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/civil engineer.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Civil Engineering</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/elec.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Electrical Engineering</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/manufacturer.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Manufacturing</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/chef.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Hotel/Restaurants</p>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 20px">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/research.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>R&D</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/designer.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Apparel/Clothing</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/security.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Security</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/hr.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>HR</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/law.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Law</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat"> <a href="category.html"> <img src="img/others.png" style="height: 50px"

                                                                        alt=""> </a>
                    <p>Others</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End feature-cat Area -->
<!-- Start post Area -->
<section class="post-area section-gap">
    <div class="container">
        <div class="row justify-content-center d-flex">
            <div class="col-lg-8 post-list">
                <ul class="cat-list">
                    <li><a href="#">Recent</a></li>
                    <li><a href="#">Full Time</a></li>
                    <li><a href="#">Intern</a></li>
                    <li><a href="#">part Time</a></li>
                </ul>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb"> <img src="img/post.png" alt="">
                        <ul class="tags">
                            <li> <a href="#">Art</a> </li>
                            <li> <a href="#">Media</a> </li>
                            <li> <a href="#">Design</a> </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles"> <a href="single.html">
                                <h4>Creative Art Designer</h4>
                            </a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a><br>
                                </li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8,
                            Colombo Rd, Kiribathgoda</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k -
                            25k</p>
                    </div>
                </div>
                <a class="text-uppercase loadmore-btn mx-auto d-block" href="category.html">Load
                    More job Posts</a> </div>
            <div class="col-lg-4 sidebar">
                <div class="single-slidebar">
                    <h4>Jobs by Location</h4>
                    <ul class="cat-list">
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Gampaha</p>
                            <span>37</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Colombo</p>
                            <span>57</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Kaluthara</p>
                            <span>33</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Maharagama</p>
                            <span>36</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Kandy</p>
                            <span>47</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Jaffna</p>
                            <span>27</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Anuradhapura</p>
                            <span>17</span></a></li>
                    </ul>
                </div>
                <div class="single-slidebar">
                    <h4>Top rated job posts</h4>
                    <div class="active-relatedjob-carusel">
                        <div class="single-rated"> <img class="img-fluid" src="img/r1.jpg"

                                                        alt=""> <a href="single.html">
                            <h4>Creative Art Designer</h4>
                        </a>
                            <h6>Premium Labels Limited</h6>
                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8,
                                Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k
                                - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a> </div>
                        <div class="single-rated"> <img class="img-fluid" src="img/r1.jpg"

                                                        alt=""> <a href="single.html">
                            <h4>Creative Art Designer</h4>
                        </a>
                            <h6>Premium Labels Limited</h6>
                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8,
                                Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k
                                - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a> </div>
                        <div class="single-rated"> <img class="img-fluid" src="img/r1.jpg"

                                                        alt=""> <a href="single.html">
                            <h4>Creative Art Designer</h4>
                        </a>
                            <h6>Premium Labels Limited</h6>
                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod temporinc ididunt ut dolore magna aliqua. </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8,
                                Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k
                                - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a> </div>
                    </div>
                </div>
                <div class="single-slidebar">
                    <h4>Jobs by Category</h4>
                    <ul class="cat-list">
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Technology</p>
                            <span>37</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Media &amp; News</p>
                            <span>57</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Goverment</p>
                            <span>33</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Medical</p>
                            <span>36</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Restaurants</p>
                            <span>47</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Developer</p>
                            <span>27</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html">
                            <p>Accounting</p>
                            <span>17</span></a></li>
                    </ul>
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
<section class="callto-action-area section-gap" id="join">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content col-lg-9">
                <div class="title text-center">
                    <h1 class="mb-10 text-white">Join us today without any hesitation</h1>
                    <p class="text-white">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                        exercitation.</p>
                    <a class="primary-btn" href="#">I am a Candidate</a> <a class="primary-btn"

                                                                            href="#">I Am Emloyer</a> </div>
            </div>
        </div>
    </div>
</section>
<!-- End calto-action Area -->
<!-- Start download Area -->
<section class="download-area section-gap" id="app">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 download-left"> <img class="img-fluid" src="img/d1.png"

                                                      alt=""> </div>
            <div class="col-lg-6 download-right">
                <h1>Download the <br>
                    Job gateway App Today!</h1>
                <p class="subs"> It won’t be a bigger problem to find one video game
                    lover in your neighbor. Since the introduction of Virtual Game, it
                    has been achieving great heights so far as its popularity and
                    technological advancement are concerned. </p>
                <div class="d-flex flex-row">
                    <div class="buttons"> <i class="fa fa-apple" aria-hidden="true"></i>
                        <div class="desc"> <a href="#">
                            <p> <span>Available</span> <br>
                                on App Store </p>
                        </a> </div>
                    </div>
                    <div class="buttons"> <i class="fa fa-android" aria-hidden="true"></i>
                        <div class="desc"> <a href="#">
                            <p> <span>Available</span> <br>
                                on Play Store </p>
                        </a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End download Area -->
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



