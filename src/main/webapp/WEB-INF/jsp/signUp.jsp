<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/18/2023
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function loadHomePage(){
            document.signUpPage.action = "homePage.htm";
            document.signUpPage.submit();
        }
    </script>
</head>
<body>
<h2>Sign Up Page</h2>

<form action="" name="signUpPage" id="signUpPage" method="POST">
    <label for="email"> User Name :</label>
    <input type="text" name="email" id="email"><br>
    <label for="password"> Password :</label>
    <input type="password" name="password" id="password"><br>

    <input type="button" id="signUp" name="signUp" value="signUp" onclick="loadHomePage()">

</form>

</body>
</html>
