package entities;

import annotations.Column;
import annotations.Entity;
import annotations.Id;

import java.util.Date;

/**
 * Created by Plamen Markov on 10/27/17.
 */
@Entity(name = "users")
public class User {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "age")
    private int age;

    @Column(name = "registration_date")
    private Date registrationDate;

    @Column(name = "is_admin")
    private int isAdmin;

    public User(String username, String password, int age, Date registrationDate, int isAdmin) {
        this.username = username;
        this.password = password;
        this.age = age;
        this.registrationDate = registrationDate;
        this.isAdmin = isAdmin;
    }

    public User() {

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }
}
