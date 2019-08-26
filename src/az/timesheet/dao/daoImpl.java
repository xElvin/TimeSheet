package az.timesheet.dao;

import az.timesheet.model.Employee;
import az.timesheet.model.Report;
import az.timesheet.model.Timesheet;
import az.timesheet.util.DBClose;
import az.timesheet.util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Elvin on 01.08.2019.
 */
public class daoImpl implements Dao
{

    @Override
    public List<Employee> employeList() throws Exception
    {
        List<Employee> employeeList = new ArrayList<Employee>();
        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;
        String sql = "SELECT E.idEmployee, E.name, E.surname, E.tl_id, E.role, TL.name, TL.surname FROM timesheetdb.employee E\n" +
                    "left join\n" +
                    "timesheetdb.team_leader TL on\n" +
                    "E.tl_id = TL.idTeam_leader";
        try {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next())
                {
                    Employee e = new Employee();
                    e.setId(rs.getLong("idEmployee"));
                    e.setName(rs.getString("name"));
                    e.setSurname(rs.getString("surname"));
                    e.setRole(rs.getString("role"));
                    e.setTlId(rs.getLong("tl_id"));
                    employeeList.add(e);
                }
            }
            else
                System.out.println("Connection is null");
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return employeeList;
    }

    @Override
    public List<Employee> teamList(long tlId) throws Exception
    {
        List<Employee> teamList = new ArrayList<Employee>();
        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;
        String sql = "select E.idEmployee, E.name, E.surname, E.tl_id, E.role, T.name, T.surname from timesheetdb.employee E\n" +
                    "left join timesheetdb.team_leader T on E.tl_id = T.idTeam_leader\n" +
                    "where E.tl_id = ?";
        try {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setLong(1, tlId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Employee e = new Employee();
                    e.setId(rs.getLong("idEmployee"));
                    e.setName(rs.getString("name"));
                    e.setSurname(rs.getString("surname"));
                    e.setRole(rs.getString("role"));
                    e.setTlId(rs.getLong("tl_id"));
                    teamList.add(e);
                }
            }
            else
                System.out.println("Connection is null");
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return teamList;
    }

    @Override
    public Employee getEmployeById(long empId) throws Exception
    {
        Employee e = new Employee();
        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;
        String sql = "select E.idEmployee, E.name, E.surname, E.role, E.tl_id, T.name, T.surname from timesheetdb.employee E\n" +
                     "left join timesheetdb.team_leader T on E.tl_id = T.idTeam_leader\n" +
                     "where E.idEmployee = ?";
        try {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setLong(1, empId);
                rs = ps.executeQuery();

                if (rs.next())
                {
                    e.setId(rs.getLong("idEmployee"));
                    e.setName(rs.getString("name"));
                    e.setSurname(rs.getString("surname"));
                    e.setRole(rs.getString("role"));
                    e.setTlId(rs.getLong("tl_id"));
                }
            }
            else
                System.out.println("Connection is null");
        } catch (Exception ex)
        {
            ex.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return e;
    }

    @Override
    public List<Timesheet> getTimesheet(long eId) throws Exception
    {
        List<Timesheet> timesheetList = new ArrayList<Timesheet>();

        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;

        String sql = "select T.idTimesheet, T.month_id, T.emp_id, T.day, T.status, T.comment, T.workHour, M.name, E.name, E.surname \n" +
                    "from timesheetdb.timesheet T\n" +
                    "inner join timesheetdb.month M on T.month_id = M.idMonth\n" +
                    "inner join timesheetdb.employee E on T.emp_id = E.idEmployee\n" +
                    "where E.idEmployee = ? order by day  ";

        try
        {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setLong(1, eId);
                rs = ps.executeQuery();

                while (rs.next())
                {
                    Timesheet ts = new Timesheet();
                    ts.setId(rs.getLong("T.idTimesheet"));
                    ts.setMonthId(rs.getLong("T.month_id"));
                    ts.setMonthName(rs.getString("M.name"));
                    ts.setEmpId(rs.getLong("T.emp_id"));
                    ts.setEmpName(rs.getString("E.name"));
                    ts.setEmpSurname(rs.getString("E.surname"));
                    ts.setStatus(rs.getString("T.status"));
                    ts.setDay(rs.getInt("T.day"));
                    ts.setComment(rs.getString("T.comment"));
                    ts.setWorkHour(rs.getInt("T.workHour"));
                    timesheetList.add(ts);
                }
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return timesheetList;
    }

    @Override
    public List<Timesheet> searchTimesheet(long eId, long monthId) throws Exception
    {
        List<Timesheet> searchTimesheetList = new ArrayList<Timesheet>();

        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;

        String sql = "select T.idTimesheet, T.month_id, T.emp_id, T.day, T.status, T.comment, T.workHour, M.name, E.name, E.surname \n" +
                "from timesheetdb.timesheet T\n" +
                "inner join timesheetdb.month M on T.month_id = M.idMonth\n" +
                "inner join timesheetdb.employee E on T.emp_id = E.idEmployee\n" +
                "where E.idEmployee = ? and T.month_id = ? order by day  ";

        try
        {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setLong(1, eId);
                ps.setLong(2, monthId);
                rs = ps.executeQuery();

                while (rs.next())
                {
                    Timesheet ts = new Timesheet();
                    ts.setId(rs.getLong("T.idTimesheet"));
                    ts.setMonthId(rs.getLong("T.month_id"));
                    ts.setMonthName(rs.getString("M.name"));
                    ts.setEmpId(rs.getLong("T.emp_id"));
                    ts.setEmpName(rs.getString("E.name"));
                    ts.setEmpSurname(rs.getString("E.surname"));
                    ts.setStatus(rs.getString("T.status"));
                    ts.setDay(rs.getInt("T.day"));
                    ts.setComment(rs.getString("T.comment"));
                    ts.setWorkHour(rs.getInt("T.workHour"));
                    searchTimesheetList.add(ts);
                }
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return searchTimesheetList;
    }


    @Override
    public void updateTimesheet(Timesheet t) throws Exception
    {
        Connection         c = null;
        PreparedStatement ps = null;
        String sql = "update timesheetdb.timesheet set\n" +
                    "status = ?, comment = ?, workHour = ? \n" +
                    "where emp_id = ? and month_id = ? and day = ? ";

        try
        {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setString(1, t.getStatus());
                ps.setString(2, t.getComment());

                String caseKey = t.getStatus();

                switch(caseKey) {
                    case "R" : //Regular day
                        ps.setInt(3,8);
                        break;

                    case "SD" : //Short Day
                        ps.setInt(3,7);
                        break;

                    case "O" : //Overtime
                        ps.setInt(3,t.getWorkHour());
                        break;

                    default : //Other days
                        ps.setInt(3,0);
                }
                ps.setLong(4, t.getEmpId());
                ps.setLong(5, t.getMonthId());
                ps.setLong(6, t.getDay());
                ps.execute();
            }

                else
                    System.out.println("Connection is null!");

        } catch (Exception ex)
        {
            ex.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, null);
        }
    }

    /*@Override
    public List<Report> getReport(long empId, long monthId) throws Exception {
        List<Report> reportList = new ArrayList<Report>();

        Report r = new Report();

        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;

        String sql = "select count(day) as totalDay, sum(workHour) as totalHour, status from timesheetdb.timesheet" +
                     " where emp_id = ? and month_id = ? and status in ('R', 'SD', 'O') group by status";
        try
        {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setLong(1, empId);
                ps.setLong(2, monthId);

                rs = ps.executeQuery();

                while (rs.next())
                {
                    r.setTotalDay(rs.getInt("totalDay"));
                    r.setTotalHour(rs.getInt("totalHour"));
                    r.setStatus(rs.getString("status"));
                    reportList.add(r);
                }
                System.out.println("report Dao="+reportList);
            }

            else
                System.out.println("Connection is null!");

        } catch (Exception ex)
        {
            ex.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return reportList;
    }*/
}
