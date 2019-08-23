var globEmployeId = '';
var globMonthName = '';


function getEmployeeList()
{
    $.ajax({
        type: 'GET',
        url: 'cs?action=getEmployeeList',
        dataType: 'html',
        success: function (data)
        {
            $('#employeeDataId').html(data);
        },
        error: function()
        {
            alert('Have Error')
        }
    })
}



function getTeamList(tlId)
{
    $.ajax({
        type: 'GET',
        url: 'cs?action=getTeamList',
        dataType: 'html',
        data: 'tlId='+tlId,
        success: function (data)
        {
            $('#employeeDataId').html(data);
        },
        error: function ()
        {
            alert('Have a error!');
        }
    })
}




function getEmployeById(empId)
{
    $.ajax({
        type: 'GET',
        url: 'cs?action=getEmployeById',
        dataType: 'html',
        data: 'empId='+empId,
        success: function (data)
        {
            $('#employeeDataId').html(data)
        },
        error: function ()
        {
            alert('Have a error!')
        }
    })
}




function getTimeSheet(rowId, fullname)
{
    if (rowId != null)
    {
        $.ajax({
            type: 'GET',
            url:  'cs?action=getTimeSheet',
            data: 'rowId='+rowId+'&monthName='+globMonthName,
            dataType: 'html',
            success: function (data)
            {
                $('#timesheetDataId').html(data);
                $('.fullname').text(fullname);
                timesheetDatepicker();
            },
            error: function ()
            {
                alert('Have error')
            }
        })
    }
}




/*function searchTime(rowId, month)
{
    if (rowId != null)
    {
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
}*/







function updateTimesheet() {
    var empId = globEmployeId;
    var arr = {};
    $('.items').each(function (i, v) {
        var month = $(v).find('.month').attr('id');
        var day = $(v).find('.day').text();
        var status = $(v).find('.selectpicker :selected').val();
        var comment = $(v).find('.comment').text();
        var workHour = $(v).find('.workhour').text();
        arr[i] = {month: month, day: day, status: status, comment: comment, workHour: workHour};
    });

    console.log(arr);
    $.ajax({
        type: 'POST',
        url: 'cs?action=updateTimeSheet',
        data: {'myArray': JSON.stringify(arr), 'empId': empId},
        success: function ()
        {
            alert('Employee was updated!');
        },
        error: function () {
            alert('Have an error!');
        }
    })
}



        /*var empId = globEmployeId;

        var monthId = $(el).closest('tr').find('.month').attr('id');
        var status  = $(el).closest('tr').find('.selectpicker :selected').val();
        var day     = $(el).closest('tr').find('.day').text();
        var comment = $(el).closest('tr').find('.comment').text();
    $.ajax({
        type: 'POST',
        url: 'cs?action=updateTimeSheet',
        data: 'monthId=' + monthId + '&empId=' + empId + '&status=' + status +
        '&day=' + day + '&comment=' + comment,
        dataType: 'html',
        success: function () {
            alert('Timesheet was updated...')
        },
        error: function () {
            alert('Have a error!')
        }

    })*/





$(function ()
{
    $(document).on('click', '#updateTimesheetBtnId', function ()
    {
        updateTimesheet();
        //getTimeSheet(globEmployeId, fullname);
        $('#timesheetDataId').show();
    })
})




$(function ()
{
    $(document).on('click', '#empTableId tr', function ()
    {
        var rowId = $(this).attr('id');
        globEmployeId = rowId;
        $('#timesheetDataId').show();
        var fullname = $(this).find('.name').text();
        getTimeSheet(rowId, fullname)

    })
})





function timesheetDatepicker()
{
    var currentDate = new Date();
    $("#dateId").datepicker("setDate",currentDate);
    cd = $('.datepicker').val();
    globMonthName = cd;


    /*var getDaysInMonth = function(month,year)
    {
        return new Date(year, month, 0).getDate()
    };
    var month = currentDate.getMonth();
    var year  = currentDate.getYear();
    var dayCount = getDaysInMonth(month, year);
    globDayCount = dayCount;*/

}