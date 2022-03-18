package com.workFinder.Data;

import java.sql.Timestamp;

public class comment {
    private String who;
    private int whom;
    private String comment;
    private int rating;
    private Timestamp time;
    public comment(String who, int whom, String comment, int rating) {
        this.who = who;
        this.whom = whom;
        this.comment = comment;
        this.rating = rating;
    }

    public comment(String who, int whom, String comment, int rating, Timestamp time) {
        this.who = who;
        this.whom = whom;
        this.comment = comment;
        this.rating = rating;
        this.time = time;
    }
    
    public comment() {
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
    
    public String getWho() {
        return who;
    }

    public void setWho(String who) {
        this.who = who;
    }

    public int getWhom() {
        return whom;
    }

    public void setWhom(int whom) {
        this.whom = whom;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
}
