package az.timesheet.dao;

import az.timesheet.model.Employee;
import az.timesheet.model.Report;
import az.timesheet.model.Timesheet;

import java.util.List;

/**
 * Created by Elvin on 01.08.2019.
 */
public interface Dao
{
    List<Employee>  employeList()              throws Exception;
    List<Employee>  teamList(long tlId)        throws Exception;
    Employee        getEmployeById(long empId) throws Exception;

    List<Timesheet> getTimesheet(long eId)     throws Exception;
    List<Timesheet> searchTimesheet(long eId, long monthId) throws Exception;

    void updateTimesheet(Timesheet t) throws Exception;
}
