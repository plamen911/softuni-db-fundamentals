package com.company;

import java.sql.*;
import java.util.Properties;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws SQLException {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter username default (root): ");
        String user = sc.nextLine();
        user = user.equals("") ? "root" : user;
        System.out.println();

        System.out.print("Enter password default (empty):");
        String password = sc.nextLine();
        System.out.println();

        Properties props = new Properties();
        props.setProperty("user", user);
        props.setProperty("password", password);

        Connection connection = null;

        try {
            connection = DriverManager
                    .getConnection("jdbc:mysql://127.0.0.1:3306/soft_uni", props);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            System.exit(0);
        }


        PreparedStatement stmt =
                connection.prepareStatement("SELECT * FROM employees WHERE salary > ?");

        System.out.print("Salary? ");
        String salary = sc.nextLine();
        stmt.setDouble(1, Double.parseDouble(salary));
        ResultSet rs = stmt.executeQuery();

        while(rs.next()){
            System.out.println(rs.getString("first_name") + " " + rs.getString("last_name"));
        }
        connection.close();


    }
}