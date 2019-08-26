package web;

import az.timesheet.dao.Dao;
import az.timesheet.dao.daoImpl;
import az.timesheet.model.Employee;
import az.timesheet.model.Report;
import az.timesheet.model.Timesheet;
import com.google.gson.Gson;
import org.json.*;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.*;

/**
 * Created by Elvin on 02.08.2019.
 */
public class ControllerServlet extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Gson gson = new Gson();
        Dao dao = new daoImpl();
        String action  = null;
        String address = null;
        String[] monthName = {"January", "February",
                "March", "April", "May", "June", "July",
                "August", "September", "October", "November",
                "December"};
        try
        {
            if (request.getParameter("action") != null) {
                action = request.getParameter("action");
            }
            if (action.equalsIgnoreCase("getEmployeeList"))
            {
                List<Employee> employeeList = dao.employeList();
                request.setAttribute("employeeList",employeeList);
                address = "WEB-INF/parseJsp/employeList.jsp";
                /*String json = new Gson().toJson(employeeList);
                response.setContentType("application/json");
                response.getWriter().write(json);*/
            }

            else if (action.equalsIgnoreCase("getTeamList"))
            {
                long tlId = Long.parseLong(request.getParameter("tlId"));
                List<Employee> getTeamList = dao.teamList(tlId);
                request.setAttribute("getTeamList", getTeamList);
                address = "WEB-INF/parseJsp/employeList.jsp";
            }

            else if (action.equalsIgnoreCase("getEmployeById"))
            {
                long empId = Long.parseLong(request.getParameter("empId"));
                Employee emp = dao.getEmployeById(empId);
                request.setAttribute("emp", emp);
                address = "WEB-INF/parseJsp/employeList.jsp";
            }

            else if (action.equalsIgnoreCase("getTimeSheet"))
            {
                String e_id = request.getParameter("rowId");
                if (e_id != null && !e_id.isEmpty())
                {
                    int monthId = Integer.parseInt(request.getParameter("monthId"));
                    long eId = Long.parseLong(e_id);

                    List<Timesheet> tsList = dao.searchTimesheet(eId, monthId);
                    request.setAttribute("tsList", tsList);

                    address = "WEB-INF/parseJsp/timeList.jsp";
                }

                else
                    System.out.println("EmployeId is null!");
            }

            else if (action.equalsIgnoreCase("searchTimeSheet"))
            {
                String monNameId = request.getParameter("monthId");
                String e_id = request.getParameter("rowId");

                if (monNameId != null && e_id != null && !monNameId.isEmpty() && ! e_id.isEmpty()) {
                    long monthId = Long.parseLong(monNameId);
                    long eId = Long.parseLong(e_id);

                    List<Timesheet> tsList = dao.searchTimesheet(eId, monthId);
                    request.setAttribute("tsList", tsList);

                    request.setAttribute("monthId", monthId);

                    address = "WEB-INF/parseJsp/searchTimeList.jsp";
                }
                else
                {
                    System.out.println("EmployeeId or MonthId is null!");
                }
            }



            else if (action.equalsIgnoreCase("updateTimeSheet"))
            {
                long   empId   = Long.parseLong(request.getParameter("empId"));
                String data = request.getParameter("myArray");

                JSONObject json = new JSONObject(data);

                for (int i = 0; i < json.length(); i++)
                {
                    String a              = Integer.toString(i);
                    JSONObject jsonObject = json.getJSONObject(a);
                    long monthId   = jsonObject.getLong("month");
                    int day        = jsonObject.getInt("day");
                    String status  = jsonObject.getString("status");
                    String comment = jsonObject.getString("comment");
                    int workHour   = jsonObject.getInt("workHour");

                    Timesheet t = new Timesheet();
                    t.setEmpId(empId);
                    t.setMonthId(monthId);
                    t.setDay(day);
                    t.setStatus(status);
                    t.setComment(comment);
                    t.setWorkHour(workHour);
                    dao.updateTimesheet(t);
                }

                address = "WEB-INF/parseJsp/timeList.jsp";
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}
