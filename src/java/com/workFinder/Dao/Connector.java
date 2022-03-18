
package com.workFinder.Dao;
import java.sql.*;
public class Connector {
   private static Connection con = null;
    public static Connection makeConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ex?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "khankamru37");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return con;
    }
}
