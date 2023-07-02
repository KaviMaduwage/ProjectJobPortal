<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/2/2023
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vacancy</title>
    <style>
        #imageContainer {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        #imageContainer img {
            max-width: 100%;
            max-height: 100%;
        }
    </style>
</head>
<body>

<div id="imageContainer">
    <img src="${imageSrc}" alt="Image">
</div>

</body>
</html>
