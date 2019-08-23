package az.timesheet.model;

/**
 * Created by Elvin on 02.08.2019.
 */
public class Employee
{
    private long   id;
    private String name;
    private String surname;
    private String role;
    private long   tlId;

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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public long getTlId() {
        return tlId;
    }

    public void setTlId(long tlId) {
        this.tlId = tlId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", role='" + role + '\'' +
                ", tlId=" + tlId +
                '}';
    }


}
