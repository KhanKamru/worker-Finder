package com.workFinder.Dao;
import com.workFinder.Data.city;
import com.workFinder.Data.work;
import com.workFinder.Data.Worker;
import java.util.ArrayList;
import java.sql.*;

public class WorkerDao {

    private Connection con = Connector.makeConnection();

    public int insertQuery(Worker d) {
        int rs = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into workerdetails (userid,workid,cityid,phone,description,price) values (?,?,?,?,?,?)");
            stmt.setInt(1, d.getUserId());
            stmt.setInt(2, d.getWorkId());
            stmt.setInt(3, d.getCityId());
            stmt.setString(4, d.getPhone());
            stmt.setString(5, d.getDescription());
            stmt.setDouble(6, d.getPrice());
            rs = stmt.executeUpdate();
        } catch (SQLException ev) {
            System.out.println(ev.getMessage());
        }
        return rs;
    }
    
    public ResultSet selectFromBoth(String work, String city) {
        ResultSet rs = null;
        PreparedStatement stmt;
        try {
            if (work == null && city == null) {
                stmt = con.prepareStatement("select * from workerdetails");
                rs = stmt.executeQuery();
            } else if (work != null && city != null) {
                stmt = con.prepareStatement("select * from workerdetails where workid=? and cityid=?");
                stmt.setInt(1, Integer.parseInt(work));
                stmt.setInt(2, Integer.parseInt(city));
                rs = stmt.executeQuery();
            } else if (work == null) {

                stmt = con.prepareStatement("select * from workerdetails where cityid=?");
                stmt.setInt(1, Integer.parseInt(city));
                rs = stmt.executeQuery();

            } else if (city == null) {
                stmt = con.prepareStatement("select * from workerdetails where workid=?");
                stmt.setInt(1, Integer.parseInt(work));
                rs = stmt.executeQuery();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return rs;
    }

    public ArrayList<city> getAllCity() {
        ArrayList<city> cities = new ArrayList<city>();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from city order by city asc");
            while (rs.next()) {
                String ct=rs.getString(2);
                ct = ct.substring(0,1).toUpperCase() + ct.substring(1).toLowerCase();
                city city = new city(rs.getInt(1),ct);
                cities.add(city);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return cities;
    }

    public ArrayList<work> getAllWork() {
        ArrayList<work> works = new ArrayList<work>();
        try {
            PreparedStatement st = con.prepareStatement("select * from work order by work asc");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                work work = new work(rs.getInt(1), rs.getString(2));
                works.add(work);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return works;
    }
    private String selectedCity;

    public String getSelectedCity(int cityId) {
        ResultSet rs = null;

        try {
            PreparedStatement stmt = con.prepareStatement("select city from city where cityid=?");
            stmt.setInt(1, cityId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int pos=rs.getString(1).indexOf(".");
                selectedCity = rs.getString(1).substring(0,pos);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return selectedCity;
    }
    private String selectedWork;

    public String getSelectedWork(int workId) {
       ResultSet rs = null;

        try {
            PreparedStatement stmt = con.prepareStatement("select work from work where workid=?");
            stmt.setInt(1, workId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                
                int pos=rs.getString(1).indexOf(".");
                selectedWork = rs.getString(1).substring(0,pos);            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return selectedWork;
    }
    private Worker worker = new Worker();

    public Worker readUserData(int userId) {
        ResultSet rs = null;

        try {
            PreparedStatement stmt = con.prepareStatement("select *from workerdetails where userid=?");
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                worker.setUserId(rs.getInt(2));
                worker.setWorkId(rs.getInt(3));
                worker.setCityId(rs.getInt(4));
                worker.setPhone(rs.getString(5));
                worker.setDescription(rs.getString(6));
                worker.setPrice(rs.getDouble(7));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return worker;
    }

    public ResultSet readAllData(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from workerdetails inner join user on userid=user.id where userid=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
}
