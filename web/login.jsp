<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Elvin
  Date: 06.08.2019
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        history.pushState(null, null, 'login.jsp');
        window.addEventListener('popstate', function (event)
        {
            history.pushState(null, null, 'login.jsp')
        })
    </script>
    <meta charset="utf-8">

    <title>Log In</title>

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="css/login/animate.css">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="css/login/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <%--<div class="top">
        <h1 id="title" class="hidden"><span id="logo">Daily <span>UI</span></span></h1>
    </div>--%>
    <div class="login-box animated fadeInUp">
        <div class="box-header">
            <h2>Log In</h2>
        </div>
        <form action="ls" method="post">
            <label for="username">Username</label>&nbsp;
            <input type="text" id="username" name="username" required="required"> <br/>

            <label for="password">Password</label>&nbsp;
            <input type="password" id="password" name="password" required="required"> <br/>

            <button type="submit" value="sign in">Sign In</button>&nbsp;
            <a href="#"><p class="small">Forgot your password?</p></a>

            <c:if test="${not empty invalid}">
                <label class="errorMsg">${invalid}</label>
            </c:if>
        </form>
    </div>
</div>
</body>

<script>
    $(document).ready(function () {
        $('#logo').addClass('animated fadeInDown');
        $("input:text:visible:first").focus();
    });
    $('#username').focus(function() {
        $('label[for="username"]').addClass('selected');
    });
    $('#username').blur(function() {
        $('label[for="username"]').removeClass('selected');
    });
    $('#password').focus(function() {
        $('label[for="password"]').addClass('selected');
    });
    $('#password').blur(function() {
        $('label[for="password"]').removeClass('selected');
    });
</script>

</html>
