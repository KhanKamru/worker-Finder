/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.Data;

/**
 *
 * @author kamru
 */
public class customer {

    private String name;
    private String email;
    private String password;
    private String phoneNum;
    private String address;

    public customer() {
    }

    public customer(String name, String email, String phoneNum, String address) {
        this.name = name;
        this.email = email;
        this.phoneNum = phoneNum;
        this.address = address;
    }
    
    public customer(String name, String email, String password, String phoneNum, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNum = phoneNum;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
