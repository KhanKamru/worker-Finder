package com.workFinder.servlet;

import com.workFinder.Data.customer;
import com.workFinder.Dao.CustomerDao;
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

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private boolean emptyCheck = false;
    private boolean uniqueCheck = false;
    private CustomerDao cc = new CustomerDao();

    private RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sess = request.getSession();
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if (name.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your name</div>");           
            emptyCheck = true;
        }
        if (email.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your email</div>");
            emptyCheck = true;
        }
        if (pass.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your pass</div>");
            emptyCheck = true;
        }
        if (phone.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your phone</div>");
            emptyCheck = true;
        }
        if (address.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your address</div>");
            emptyCheck = true;
        }
        if (email.isEmpty() == false) {
            if (cc.verifyData(email, "email") != null) {
                out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">This email has already taken by someone else</div>");
                uniqueCheck = true;
            }
        }
            if (name.isEmpty() == false) {
                if (cc.verifyData(name, "uname") != null) {
                    out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">This username has already taken by someone else</div>");
                    uniqueCheck = true;
                }
            }
            if (emptyCheck == false && uniqueCheck == false) {
                customer customer = new customer(name, email, pass, phone, address);
                //for session
                customer customers = new customer(name, email, phone, address);

                int successCustomer = cc.insertQuery(customer);

                if (successCustomer == 1) {
                    response.sendRedirect("customerDashboard.jsp");
                    sess.setAttribute("customer", customers);
                } else {
                    out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">something went wrong</div>");

                }
            } else {
                rd = request.getRequestDispatcher("customerDetails.jsp");
                rd.include(request, response);
            }

        }
    }
