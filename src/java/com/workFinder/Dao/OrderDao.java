/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDao {

    private Connection con = Connector.makeConnection();

    public int insertOrderData(int workerId, String customerUname) {
        int success=0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into orders (workerid,customeruname) values(?,?)");
            stmt.setInt(1, workerId);
            stmt.setString(2, customerUname);
            success=stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return success;
    }

    public int updateStatus(int userId, int status,int id ,String cusUname) {
        int success = 0;
        try {
            PreparedStatement pstmt = con.prepareStatement("update orders set orderstatus =? where id=? and workerid =? and customeruname=?");
            pstmt.setInt(1, status);
            pstmt.setInt(2, id);
            pstmt.setInt(3, userId);
            pstmt.setString(4, cusUname);
            success=pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return success;
    }
//    public ResultSet readUserData(int userId)
//    {
//        ResultSet rs=null;
//        try {
//            PreparedStatement pstmt=con.prepareStatement("select * from orders where workerid =?");
//            pstmt.setInt(1, userId);
//            rs=pstmt.executeQuery();
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        return rs;
//    }
    public ResultSet checkingPendingCondition(int userId,int status)
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from orders where workerid =? and orderstatus=?");
            
            pstmt.setInt(1, userId);
            pstmt.setInt(2,status);
            rs=pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
        public ResultSet checkingPendingCondition(String customer,int status)
        {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from orders where customeruname = ? and orderstatus = ?");
            pstmt.setString(1, customer);
            pstmt.setInt(2,status);
            rs=pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
    public ResultSet readCustomerData(String uname)
    {
     ResultSet rs=null;
     try
     {
         PreparedStatement pstmt=con.prepareStatement("select * from orders where customeruname=?");
         pstmt.setString(1, uname);
         rs=pstmt.executeQuery();
     }
     catch(SQLException e){
         System.out.println(e.getMessage());
     }
     return rs;
    }
    public ResultSet eligibleForComment(int workerid,String customerUname)
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from orders where workerid=? and customeruname=? and orderstatus= 1");
            pstmt.setInt(1, workerid);
            pstmt.setString(2, customerUname);
            rs=pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}
