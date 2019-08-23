package az.timesheet.login.loginDao;

import az.timesheet.login.loginModel.Login;
import az.timesheet.model.Employee;
import az.timesheet.util.DBClose;
import az.timesheet.util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Elvin on 06.08.2019.
 */
public class LoginDaoImpl implements LoginDao
{

    @Override
    public Login login(String username, String password) throws Exception
    {
        Login login = new Login();

        Connection         c = null;
        PreparedStatement ps = null;
        ResultSet         rs = null;
        String sql = "select L.username, L.password, L.role, L.emp_id, E.tl_id, E.name, E.surname from timesheetdb.login L\n" +
                    "inner join timesheetdb.employee E on L.emp_id = E.idEmployee\n" +
                    "where L.username = ? and L.password = ? ";

        try
        {
            c = DBConnect.getConnection();
            if (c != null)
            {
                ps = c.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();

                if (rs.next())
                {
                    login.setUsername(rs.getString("L.username"));
                    login.setPassword(rs.getString("L.password"));
                    login.setRole(rs.getString("L.role"));

                    Employee emp = new Employee();
                    emp.setId(rs.getLong("L.emp_id"));
                    emp.setTlId(rs.getLong("E.tl_id"));
                    emp.setName(rs.getString("E.name"));
                    emp.setSurname(rs.getString("E.surname"));
                    login.setEmployee(emp);
                }
                else
                    login = null;
            }
            else
                System.out.println("Connection is null!");
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            DBClose.dbClose(c, ps, rs);
        }
        return login;
    }
}
