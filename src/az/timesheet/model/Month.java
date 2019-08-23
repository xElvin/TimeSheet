package az.timesheet.model;

/**
 * Created by Elvin on 02.08.2019.
 */
public class Month
{
    private long id;
    private String name;
    private int countDay;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCountDay() {
        return countDay;
    }

    public void setCountDay(int countDay) {
        this.countDay = countDay;
    }

    @Override
    public String toString() {
        return "Month{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", countDay=" + countDay +
                '}';
    }
}
