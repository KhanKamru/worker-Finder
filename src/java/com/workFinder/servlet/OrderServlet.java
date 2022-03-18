/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.servlet;

import com.workFinder.Dao.OrderDao;
import com.workFinder.Data.customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        int workerid=Integer.parseInt(request.getParameter("workerid"));
        customer customer= (customer)session.getAttribute("customer");
        String customerUname=customer.getName();
        OrderDao order=new OrderDao();
        int success= order.insertOrderData(workerid, customerUname);
        if(success==1)
            out.println("Request has been sent to worker");
            response.sendRedirect("CustomerProfile.jsp");
        }
    }


