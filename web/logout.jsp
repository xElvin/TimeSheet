<%--
  Created by IntelliJ IDEA.
  User: Elvin
  Date: 06.08.2019
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    history.pushState(null, null, 'logout.jsp');
    window.addEventListener('popstate', function (event)
    {
        history.pushState(null, null, 'logout.jsp')
    })
</script>
<%
    session.removeAttribute("login");
    session.invalidate();
    response.sendRedirect("login.jsp");
%>


