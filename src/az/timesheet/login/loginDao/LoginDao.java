package az.timesheet.login.loginDao;

import az.timesheet.login.loginModel.Login;

/**
 * Created by Elvin on 06.08.2019.
 */
public interface LoginDao
{
    Login login (String username, String password) throws Exception;
}
