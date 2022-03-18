/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.Dao;

import com.workFinder.Data.customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDao {
    private Connection con = Connector.makeConnection();

    public int insertQuery(customer cus) {
        int rs = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into customerdetails (uname,email,pass,phone,address) values (?,?,?,?,?)");
            stmt.setString(1, cus.getName());
            stmt.setString(2, cus.getEmail());
            stmt.setString(3, cus.getPassword());
            stmt.setString(4, cus.getPhoneNum());
            stmt.setString(5, cus.getAddress());
            rs = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return rs;

    }
    public customer readCustomerData(String cusUname)
    {
        customer cus=new customer();
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from customerdetails where uname =?");
            pstmt.setString(1, cusUname);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {
               cus.setName(rs.getString("uname"));
               cus.setEmail(rs.getString("email"));
               cus.setPhoneNum(rs.getString("phone"));
               cus.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cus;
    }
//      public ResultSet checkLogin(String email, String pass)
//        {
//      ResultSet rs=null;
//      try {
//          PreparedStatement pstmt=con.prepareStatement("select * from customerdetails where email=? and pass=?");
//          pstmt.setString(1, email);
//          pstmt.setString(2, pass);
//          rs=pstmt.executeQuery();
//      } catch (SQLException e) {
//          System.out.println(e.getMessage());
//      }
//      return rs;
//  }
      public String verifyData(String data,String column) {
        ResultSet rs = null;
        String value=null;
        try {
            PreparedStatement stmt = con.prepareStatement("select * from customerdetails where "+column+" =?");
            
            stmt.setString(1, data);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                value=rs.getString(column);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return value;
    }

}
