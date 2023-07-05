<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/4/2023
  Time: 11:03 PM
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
    <title>Admin User Profile</title>
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <script>
        function acceptRequest(index){
            console.log("1234");
            //var requestId= document.getElementById("hiddenRequestId_" + index).value;
            //console.log(requestId);
            // const url = "acceptRequest.htm?requestId="+requestId;
            // document.acceptRequestForm.action = url;
            // document.acceptRequestForm.submit();

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

            <li><a href="#service"><i class="bi fs-5 bi-gear me-2"></i> Accept Requests</a></li>
        </ul>
    </div>
</header>
<div  class="main-content">

    <!--########################## Profile Starts Here ############################# -->

    <div class="profile-head">
        <div class="row vh-100">
            <div class="col-xl-6 text-center mx-auto align-self-center ">
                <div class="imgcover mb-4">
                    <img src="img/admin.jpg" class="rounded-pill bg-white p-2 shadow" alt="">
                </div>
                <h2 class="fw-bolder">Welcome Admin</h2>
                <p>- Check Your Today's Tasks -</p>
                <ul>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>

    <!--########################## Accept reasent job postings ############################# -->

    <div id="service" class="service px-4 py-5">
        <div class="titie-row row mb-3">
            <h2 class="fw-bolder">Accept Requests</h2>

        </div>
        <form name="acceptRequestForm">
        <div class="row mt-5">

                <c:forEach items="${requestList}" var="employerRequest" varStatus="status" >
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="serv-cove shadow-md rounded bg-white text-center p-4">
                            <input type="hidden" value="${employerRequest.requestId}" id="hiddenrequestId_${status.index}">
    <%--                        <i class="bi fs-1 bi-boxes"></i>--%>
                            <img class="rounded-pill" src="img/company-logos/${employerRequest.employer.employerId}_${employerRequest.employer.companyName}/${employerRequest.employer.logoImage}"
                            style="width: 50px;height: 50px">
                            <h5 class="mt-3 fs-6 fw-bold">${employerRequest.employer.companyName}</h5>
                            <p>${employerRequest.employer.description}</p>
                            <p>${employerRequest.employer.tel}</p>
                            <p>${employerRequest.employer.address}</p>
                            <p><fmt:formatDate value="${employerRequest.requestedDate}" pattern="yyyy/MM/dd" /></p>

                            <button class="btn btn-outline-primary fw-bolder fs-7 px-4 py-2 mt-3 rounded-pill"><a href="/acceptRequest?requestId=${employerRequest.requestId}">Accept</a></button>
                        </div>
                    </div>
                </c:forEach>

        </div>
        </form>
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