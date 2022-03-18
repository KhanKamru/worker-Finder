package com.workFinder.Dao;

import com.workFinder.Data.user;
import java.sql.*;
import com.workFinder.Dao.Connector;
import com.workFinder.Data.comment;
import java.util.ArrayList;

public class CommentDao {

    private Connection con = Connector.makeConnection();
    private ArrayList<comment> commentList=new ArrayList<>();
    public ArrayList<comment> showComment(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement("select * from cmnt where whom=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                comment cmnt = new comment();
                cmnt.setComment(rs.getString("commentcolumn"));
                cmnt.setWho(rs.getString("who"));
                cmnt.setRating(rs.getInt("rating"));
                cmnt.setWhom(rs.getInt("whom"));
                cmnt.setTime(rs.getTimestamp("ctime"));
                commentList.add(cmnt);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return commentList;
    }

    public int insertComment(comment cmnt) {
        int rs = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into cmnt (whom,who,commentcolumn,rating) values(?,?,?,?)");
            stmt.setInt(1, cmnt.getWhom());
            stmt.setString(2, cmnt.getWho());
            stmt.setString(3, cmnt.getComment());
            stmt.setInt(4, cmnt.getRating());
            rs = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }
}
