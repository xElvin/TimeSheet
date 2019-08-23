<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Elvin
  Date: 02.08.2019
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    function searchTime(rowId, month)
    {
        if (rowId != null)
        {
            month = month + 2
            if (month > 12)
            {
                month = month - 12
            }
            $.ajax({
                type: 'GET',
                url:  'cs?action=searchTimeSheet',
                data: 'rowId='+rowId+'&monthName='+month,
                dataType: 'html',
                success: function (data)
                {
                    $('#timesheetDataId').html(data);
                    //$('.fullname').text(fullname);
                },
                error: function ()
                {
                    alert('Have error')
                }
            })
        }
    }
    $(function ()
    {
        $('#tsTableId').dataTable({
            paging: true,
            pageLength: 31,
            searching: true,
            lengthChange: false,
            info: false,
            scrollCollapse: true,
            scrollY: "calc(74vh)"});
        $('#tsTableId_paginate').hide();

        $('#tsTableId_length').hide();

        $('.datepicker').datepicker({
            changeMonth: true,
            changeYear: false,
            dateFormat: 'MM',
            showButtonPanel: true,
            dateFormat: 'MM',
            onClose: function(dateText, inst)
            {
                //$(this).datepicker('setDate', new Date(inst.selectedMonth, 0));
                $('#datepicker').datepicker("setDate", new Date(inst.selectedMonth, 0));
            },

        });


            /*$('#statusComboId').change(function ()
            {
                alert($(this).val())
                if ($(this).val() === 'O')
                {
                    $('#workHour').attr("contenteditable", true);
                }
            })*/


    });

</script>

<div>
    <div>
        <div style="display: inline-block">
            <input type="text" id="dateId" class="datepicker" placeholder="Select Date"/>
        </div> &nbsp;

        <div class="fullname" style="display: initial">fullname</div>
        <br>
    </div>

<div>
    <table id="tsTableId" class="display" cellspacing="0" width="100%">
        <thead>
            <th>Month</th>
            <th>Day</th>
            <th>Status</th>
            <th>Comment</th>
            <td>Working Hour</td>
        </thead>

        <tbody>


        <c:forEach items="${tsList}" var="tl" varStatus="Count">
            <tr class="items" ${tl.id}>
                <td class="month" id="${tl.monthId}">${tl.monthName}</td>

                <td class="day">${tl.day}</td>

                <td class="status">
                    <select id="statusComboId_${Count.count}" style="width: 110px" class="selectpicker"
                            onchange="if ((this.value) === 'O')
                            {
                                alert(this.value);
                                $('#workHour_${Count.count}').attr('contenteditable', true)
                            }
                            else
                            {
                                $('#workHour_${Count.count}').attr('contenteditable', false)
                            }">
                        <option value="NF">Not Fill</option>
                        <option <c:if test="${tl.status == 'R'}">  selected </c:if> value="R">Regular</option>
                        <option <c:if test="${tl.status == 'A'}">  selected </c:if> value="A">Absent</option>
                        <option <c:if test="${tl.status == 'W'}">  selected </c:if> value="W">Weekend</option>
                        <option <c:if test="${tl.status == 'H'}">  selected </c:if> value="H">Holiday</option>
                        <option <c:if test="${tl.status == 'O'}">  selected </c:if> value="O">Overtime</option>
                        <option <c:if test="${tl.status == 'V'}">  selected </c:if> value="V">Vacation</option>
                        <option <c:if test="${tl.status == 'SD'}"> selected </c:if> value="SD">Sort Day</option>
                    </select>
                </td>

                <td class="comment" contenteditable="true">${tl.comment}</td>

                <td id="workHour_${Count.count}" class="workhour"  contenteditable="false">${tl.workHour}</td>
            </tr>
        </c:forEach>

        </tbody>
        <tfoot>
            <th>Month</th>
            <th>Day</th>
            <th>Status</th>
            <th>Comment</th>
            <th>Working Hour</th>
        </tfoot>
    </table>
    <div>
        <input type="button" id="updateTimesheetBtnId" value="Submit"
               style="float:right;  width: 140px; height: 45px; margin: 30px; margin-right: 270px">
    </div>
</div>
</div>