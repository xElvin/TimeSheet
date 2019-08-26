package az.timesheet.model;

/**
 * Created by Elvin on 25.08.2019.
 */
public class Report
{
    private String status;
    private int    totalDay;
    private int    totalHour;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalDay() {
        return totalDay;
    }

    public void setTotalDay(int totalDay) {
        this.totalDay = totalDay;
    }

    public int getTotalHour() {
        return totalHour;
    }

    public void setTotalHour(int totalHour) {
        this.totalHour = totalHour;
    }


    @Override
    public String toString() {
        return "Report{" +
                "status='" + status + '\'' +
                ", totalDay=" + totalDay +
                ", totalHour=" + totalHour +
                '}';
    }
}
