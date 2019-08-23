<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Elvin
  Date: 02.08.2019
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>

<script>
    $(function ()
    {
        $('#empTableId').dataTable();
    })
</script>
<div>
    <table id="empTableId" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>No</th>
            <th>Employes</th>
        </tr>
        </thead>

        <tbody>
        <c:choose>
            <c:when test="${login.role eq 'admin'}">
                <c:forEach items="${employeeList}" var="el" varStatus="Count">
                    <tr id="${el.id}">
                        <td>${Count.count}</td>
                        <td class="name">${el.name} ${el.surname}</td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:when test="${login.role eq 'team_leader'}">
                <c:forEach items="${getTeamList}" var="tl" varStatus="Count">
                    <tr id="${tl.id}">
                        <td>${Count.count}</td>
                        <td class="name">${tl.name} ${tl.surname}</td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:when test="${login.role eq 'member'}">
                <tr id="${emp.id}">
                    <td>1</td>
                    <td class="name">${emp.name} ${emp.surname}</td>
                </tr>
            </c:when>
        </c:choose>
        </tbody>
        <tfoot>
        <tr>
            <th>No</th>
            <th>Employes</th>
        </tr>
        </tfoot>
    </table>
</div>
