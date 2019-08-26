<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Elvin
  Date: 01.08.2019
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>TimeSheet</title>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="css/MonthPicker.css">
    <link rel="stylesheet" type="text/css" href="css/MonthPicker.min.css">
    <link rel="stylesheet" type="text/css" href="css/examples.css">


    <script type="text/javascript" src="js/jquery/jquery-latest.js"></script>
    <script type="text/javascript" src="js/jquery/jquery.layout-latest.js"></script>
    <script type="text/javascript" src="js/jquery/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/jquery/MonthPicker.js"></script>
    <script type="text/javascript" src="js/jquery/MonthPicker.min.js"></script>
    <script type="text/javascript" src="js/jquery/examples.js"></script>


    <script>
        <%
            if (session.getAttribute("login") == null || session.getAttribute("login").equals(""))
            {
                response.sendRedirect("login.jsp");
                session.invalidate();
            }
          %>
        history.pushState(null, null, 'index.jsp');
        window.addEventListener('popstate', function (event)
        {
            history.pushState(null, null, 'index.jsp')
        })

      $(function ()
      {

          $(function ()
          {
              $('#EmployeeButtonId').click(function ()
              {
                  $('#employeeDataId').show();
                  <c:choose>
                    <c:when test="${login.role eq 'admin'}">
                      getEmployeeList();
                    </c:when>

                    <c:when test="${login.role eq 'team_leader'}">
                      var tlId  = ${login.employee.tlId}
                      getTeamList(tlId)
                    </c:when>

                    <c:when test="${login.role eq 'member'}">
                      getEmployeById(${login.employee.id})
                    </c:when>
                  </c:choose>

              })
          })

      })

    </script>
  </head>


  <body>

  <div class="wrapper">
    <header  style="outline:1px solid; min-height: 70px;text-align: center">TimeSheet
      <div style="float: right">Welcome, ${login.employee.name} ${login.employee.surname}</div> <br>
      <a href="logout.jsp"><img src="images/logout.png" style="float: right; height: 40px; width: 60px"></a>
    </header>
<div class="container">
  <div class="row" style=" min-height: 500px;">
    <div class="col-md-4" >
      <input type="button" value="Employes" id="EmployeeButtonId" class="buttonDesign" style="margin-top: 10px;"> <br>
      <div id="employeeDataId" style="display: none">
      </div>
    </div>

    <div class="col-md-8">
      <div id="timesheetDataId" style="display: none">

      </div>
    </div>

  </div>
</div>
    <div  style="text-align: center">Copyright©Elvin</div>
  </div>


  </body>


</html>
