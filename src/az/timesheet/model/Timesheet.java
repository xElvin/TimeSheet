package az.timesheet.model;

/**
 * Created by Elvin on 02.08.2019.
 */
public class Timesheet
{
    private long   id;
    private long   monthId;
    private String monthName;
    private long   empId;
    private String empName;
    private String empSurname;
    private String status;
    private int    day;
    private String comment;
    private int    workHour;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getMonthId() {
        return monthId;
    }

    public void setMonthId(long monthId) {
        this.monthId = monthId;
    }

    public String getMonthName() {
        return monthName;
    }

    public void setMonthName(String monthName) {
        this.monthName = monthName;
    }

    public long getEmpId() {
        return empId;
    }

    public void setEmpId(long empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpSurname() {
        return empSurname;
    }

    public void setEmpSurname(String empSurname) {
        this.empSurname = empSurname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getWorkHour() {
        return workHour;
    }

    public void setWorkHour(int workHour) {
        this.workHour = workHour;
    }

    @Override
    public String toString() {
        return "Timesheet{" +
                "id=" + id +
                ", monthId=" + monthId +
                ", monthName='" + monthName + '\'' +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empSurname='" + empSurname + '\'' +
                ", status='" + status + '\'' +
                ", day=" + day +
                ", comment='" + comment + '\'' +
                ", workHour=" + workHour +
                '}';
    }
}
