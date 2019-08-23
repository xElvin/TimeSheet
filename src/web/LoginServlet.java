package web;

import az.timesheet.login.loginDao.LoginDao;
import az.timesheet.login.loginDao.LoginDaoImpl;
import az.timesheet.login.loginModel.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Elvin on 06.08.2019.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        LoginDao loginDao = new LoginDaoImpl();
        String address  = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try
        {
            if (username != null && password != null && !username.isEmpty() && !password.isEmpty())
            {
                Login login = loginDao.login(username, password);
                if (login != null)
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("login", login);
                    address = "index.jsp";
                }
                else
                {
                    request.setAttribute("invalid", "Please enter correct username and password");
                    address = "login.jsp";
                }
            }
            else
            {
                request.setAttribute("invalid", "Please, enter username and password!");
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}
