/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.Dao;

import com.workFinder.Data.user;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {
      private Connection con = Connector.makeConnection();
      public int insertQuery(user u) {
        int rs=0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into user (uname ,email,pass,profilepic) values (?,?,?,?)");
            stmt.setString(1, u.getUname());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getPassword());
            stmt.setString(4, u.getProfilePic());
            rs = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }

    public void deleteQuery(user u) {
        try {
            PreparedStatement stmt =con.prepareStatement("delete from user where uname = ?");
            stmt.setString(1, u.getUname());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

//    public int updateQuery(user u) {
//        int affect = 0;
//
//        try {
//            PreparedStatement stmt = con.prepareStatement("update user set email=?,pass=? where uname=?");
//            stmt.setString(1, u.getEmail());
//            stmt.setString(2, u.getPassword());
//            stmt.setString(3, u.getUname());
//            stmt.setString(4, u.getProfilePic());
//            affect = stmt.executeUpdate();
//
//        } catch (SQLException ex) {
//            System.out.println(ex.getMessage());
//        }
//        return affect;
//
//    } 
      private  user u=new user();
    public user readUserData(String uname)
    {
             ResultSet rs=null;

        try {
            PreparedStatement stmt =con.prepareStatement("select * from user where uname=?");
            stmt.setString(1, uname);
            rs=stmt.executeQuery();
            System.out.println(rs);
            while(rs.next())
            {
               u.setUserId(rs.getInt("id"));
               u.setUname(rs.getString("uname"));
               u.setEmail(rs.getString("email"));
               u.setPassword(rs.getString("pass"));
               u.setProfilePic(rs.getString("profilepic"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println(u.getUserId());
        return u;
    }
    public user readUserData(int userid)
    {
     ResultSet rs=null;
        try {
            PreparedStatement stmt =con.prepareStatement("select * from user where id=?");
            stmt.setInt(1, userid);
            rs=stmt.executeQuery();
            System.out.println(rs);
            while(rs.next())
            {
               u.setUname(rs.getString("uname"));
               u.setEmail(rs.getString("email"));
               u.setPassword(rs.getString("pass"));
               u.setProfilePic(rs.getString("profilepic"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println(u.getUserId());
        return u;
    }
  public ResultSet checkLogin(String table,String email, String pass)
  {
      ResultSet rs=null;
      try {
          PreparedStatement pstmt=con.prepareStatement("select * from "+table+" where email=? and pass=?");
          pstmt.setString(1, email);
          pstmt.setString(2, pass);
          rs=pstmt.executeQuery();
      } catch (SQLException e) {
          System.out.println(e.getMessage());
      }
      return rs;
  }
    public String checkData(String data,String column) {
        ResultSet rs = null;
        String value=null;
        try {
            PreparedStatement stmt = con.prepareStatement("select * from user where "+column+"=?");
            stmt.setString(1, data);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                value=rs.getString(column);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return value;
    }
//   public void insertionFile()
//   {
//      File f=new File("C:\\Users\\kamru\\OneDrive\\Pictures\\Documents\\NetBeansProjects\\loginSystem\\web\\worker");
//        String [] fileArray=f.list();
//        for(int i=0;i<fileArray.length;i++)
//        {
//          try {
//              PreparedStatement stmt=con.prepareStatement("insert into work (work) value(?)");
//              stmt.setString(1, fileArray[i]);
//              stmt.executeUpdate();
//          } catch (Exception ex) {
//              ex.printStackTrace();
//          }
//        }   
//   }
}
