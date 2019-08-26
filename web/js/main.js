var globEmployeId = '';
var globEmpName   = '';
var globMonthId   = '';
var globMonthList = '';

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




function getTimeSheet(rowId, monthId)
{
    if (rowId != null)
    {
        $.ajax({
            type: 'GET',
            url:  'cs?action=getTimeSheet',
            data: 'rowId='+rowId+'&monthId='+globMonthId,
            dataType: 'html',
            success: function (data)
            {
                $('#timesheetDataId').html(data);
                $('.fullname').text(globEmpName);
                timesheetDatepicker();
            },
            error: function ()
            {
                alert('Have error')
            }
        })
    }
}






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

    $.ajax({
        type: 'POST',
        url: 'cs?action=updateTimeSheet',
        data: {'myArray': JSON.stringify(arr), 'empId': empId},
        success: function ()
        {
            alert('Employee was updated!');
            getTimeSheet(globEmployeId, globMonthId)
        },
        error: function () {
            alert('Have an error!');
        }
    })
}





$(function ()
{
    $(document).on('click', '#updateTimesheetBtnId', function ()
    {
        updateTimesheet();
        getTimeSheet(globEmployeId, globMonthId);
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
        globEmpName = fullname;
        timesheetDatepicker();
        getTimeSheet(globEmployeId);
    })
})





function timesheetDatepicker()
{
    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];
    globMonthList = monthNames;
    var currentDate = new Date();
    globMonthId = currentDate.getMonth()+1;
    monthName = monthNames[currentDate.getMonth()];
    $("#IconDemo").val(monthName);
}