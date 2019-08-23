package az.timesheet.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created by Elvin on 01.08.2019.
 */
public class DBConnect
{
    public static Connection getConnection() throws Exception
    {
        Context contect = new InitialContext();
        DataSource ds = (DataSource) contect.lookup("java:comp/env/jdbc/timesheet");
        Connection c = ds.getConnection();
        return c;
    }
}
