package com.workFinder.Data;
public class work {
    private int workid;
    private String work;

    public work(int workid, String work) {
        this.workid = workid;
        this.work = work;
    }    
    public int getWorkid() {
        return workid;
    }

    public void setWorkid(int workid) {
        this.workid = workid;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }
    
}
