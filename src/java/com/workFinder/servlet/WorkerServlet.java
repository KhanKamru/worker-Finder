/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.servlet;

import com.workFinder.Data.Worker;
import com.workFinder.Dao.WorkerDao;
import com.workFinder.Dao.UserDao;
import com.workFinder.Data.user;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/details")

public class WorkerServlet extends HttpServlet {

    private boolean emptyCheck = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String number = request.getParameter("number");
        int city = Integer.parseInt(request.getParameter("city"));
        int work = Integer.parseInt(request.getParameter("work"));
        String description = request.getParameter("description");
                double price=0.0;

        if (number.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your number</div>");
            emptyCheck = true;
        }
        if (city == 0) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\"> Please enter your city</div>");
            emptyCheck = true;
        }
        if (work == 0) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your work</div>");
            emptyCheck = true;
        }
        if (request.getParameter("price").isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\"> Please enter price for your work</div>");
            emptyCheck = true;
        }
        else{
          price = Double.parseDouble(request.getParameter("price"));
        }
        if (description.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter description</div>");
            emptyCheck = true;
        }
        if (emptyCheck == false) {
            user u = (user) session.getAttribute("userObj");
            UserDao c = new UserDao();
            int userSuccess = c.insertQuery(u);
            if (userSuccess == 1) {
                user user = c.readUserData(u.getUname());
                Worker details = new Worker(user.getUserId(), work, city, number, description, price);
                WorkerDao cd = new WorkerDao();
                int detailsSuccess = cd.insertQuery(details);
                if (detailsSuccess == 1) {
                    session.setAttribute("userId", user.getUserId());
                    response.sendRedirect("workerDashboard.jsp");
                }
                else
                {
                    out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">something happend with</div>");
                }
            } else {
                out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">something happend with</div>");
                RequestDispatcher rd = request.getRequestDispatcher("workerDetails.jsp");
                rd.include(request, response);
            }
        }

    }
}
