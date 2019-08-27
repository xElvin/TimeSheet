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

    function searchTimeSheet(rowId, monthId, gMonthName)
    {
            $.ajax({
                type: 'GET',
                url:  'cs?action=searchTimeSheet',
                data: 'rowId='+rowId+'&monthId='+monthId,
                dataType: 'html',
                success: function (data)
                {
                    $('#timesheetDataId').html(data);
                    $('.fullname').text(globEmpName);
                    $("#IconDemo").val(gMonthName);
                },
                error: function ()
                {
                    alert('Have error')
                }
            })
    }



    $(function ()
    {
        $('#tsTableId').dataTable({
            paging: true,
            pageLength: 40,
            searching: true,
            lengthChange: false,
            info: false,
            scrollCollapse: true,
            scrollY: "calc(74vh)"});
        $('#tsTableId_paginate').hide();

        $('#tsTableId_length').hide();


        $('#reportTableId').dataTable({
            paging: true,
            pageLength: 5,
            searching: true,
            lengthChange: false,
            info: false,
            scrollCollapse: true,
            scrollY: "calc(74vh)"});
        $('#reportTableId_filter').hide();

        $('#reportTableId_paginate').hide();

        $('#reportTableId_length').hide();



        $('#IconDemo').MonthPicker({ StartYear: 2019, ShowIcon: true,
            OnAfterChooseMonth: function()
            {
                var monthId = $(this).val().split('/')[0];
                var gMonthName = globMonthList[parseInt(monthId-1)];
                $('#IconDemo').val(monthName);
                searchTimeSheet(globEmployeId, monthId, gMonthName);
            }
        });

        $("input[type='month']").MonthPicker();


        var rdCount = 0;
        var vdCount = 0;
        var sdCount = 0;
        var ndCount = 0;
        var rhHour  = 0;
        var ohHour  = 0;

        $('.items').each(function (i, v)
        {
            var status = $(v).find('.selectpicker :selected').val();
            var workHour   = $(v).find('.workhour').text();

            if (status == 'R' || status == 'SD')
            {
                rdCount++ ;
                rhHour += parseInt(workHour);
            }

            else if(status == 'O')
            {
                ohHour += parseInt(workHour);
            }

            else if(status == 'V')
            {
                vdCount++;
            }

            else if(status == 'SL')
            {
                sdCount++;
            }

            else if(status == 'W' || status == 'H')
            {
                ndCount++;
            }

        });

        $('#mwd').text(rdCount)
        $('#nwd').text(ndCount);
        $('#sl').text(sdCount);
        $('#vd').text(vdCount);
        $('#mwh').text(rhHour);
        $('#ot').text(ohHour);


    });

</script>


<div>
    <div style="margin-top: 10px;"> Choose a Month
        <div style="display: inline-block">
            <input id="IconDemo" class="Default month-year-input" type="text" disabled="disabled">
        </div> &nbsp;

        <div class="fullname" style="display: initial">fullname</div>
        <br>
    </div>
</div>

<div>
    <table id="tsTableId" class="display" cellspacing="0" width="100%">
        <thead>
            <th>Month</th>
            <th>Day</th>
            <th>Status</th>
            <th>Comment</th>
            <th>Working Hour</th>
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
                                $('#workHour_${Count.count}').attr('contenteditable', true);
                                $('#workHour_${Count.count}').text('');
                               // $('#workHour_${Count.count}').css('background-color', '#7abaff');
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
                        <option <c:if test="${tl.status == 'SL'}"> selected </c:if> value="SL">Sick Leave</option>
                    </select>
                </td>

                <td class="comment" contenteditable="true">${tl.comment}</td>

                <td id="workHour_${Count.count}" class="workhour">${tl.workHour}</td>
            </tr>
        </c:forEach>

        </tbody>
        <%--<tfoot>
            <th>Month</th>
            <th>Day</th>
            <th>Status</th>
            <th>Comment</th>
            <th>Working Hour</th>
        </tfoot>--%>


    </table>

    <div>
            <table id="reportTableId" class="display" cellspacing="0" width="100%" style="text-align: center">
                <thead>
                    <th>Monthly Working Days</th>
                    <th>Holidays and Non-working days</th>
                    <th>Sick Leave</th>
                    <th>Vacation</th>
                    <th>Monthly Working Hours</th>
                    <th>Overtime Hours</th>
                </thead>

                <tbody>
                    <tr>
                        <td id="mwd"></td>
                        <td id="nwd"></td>
                        <td id="sl"></td>
                        <td id="vd"></td>
                        <td id="mwh"></td>
                        <td id="ot"></td>
                    </tr>
                </tbody>
            </table>
        </div>

    <div>
        <input type="button" id="updateTimesheetBtnId" value="Submit"
               style="float: right;
                      width: 100%;
                      height: 45px;
                      margin-top: 30px;">
    </div>
</div>
