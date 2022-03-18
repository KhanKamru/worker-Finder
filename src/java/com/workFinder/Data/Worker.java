/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.Data;

public class Worker {
    private int userId;
    private int workId;
    private int cityId;
    private String phone;
    private String description;
    private double price; 

    public Worker(int userId, int workId, int cityId, String phone, String description, double price) {
        this.userId = userId;
        this.workId = workId;
        this.cityId = cityId;
        this.phone = phone;
        this.description = description;
        this.price = price;
    }

    public Worker() {
    }
 
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getWorkId() {
        return workId;
    }

    public void setWorkId(int workId) {
        this.workId = workId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
   
}
