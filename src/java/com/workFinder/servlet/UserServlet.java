/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.workFinder.servlet;

import com.workFinder.Dao.UserDao;
import com.workFinder.Data.user;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/redirect")
@MultipartConfig
public class UserServlet extends HttpServlet {

    private boolean emptyCheck = false;
    private boolean uniqueCheck = false;
    private boolean isValidExtensionError = true;
    private UserDao ud = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        Part part = request.getPart("profilePic");
        String fileName = part.getSubmittedFileName();
        String[] validFileType = {"jpg", "jpeg", "png", "gif", "jfif"};
        if (fileName.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please upload your file</div>");
            emptyCheck = true;
        }
        if (fileName.isEmpty() == false) {
            String extension = part.getContentType().replace("image/", "").trim();
            for (String ex : validFileType) {
                if (ex.equals(extension)) {
                    isValidExtensionError = false;
                    break;
                }
            }
        }
        if (uname.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please create your username</div>");
            emptyCheck = true;
        }

        if (email.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your email</div>");
            emptyCheck = true;

        }
        if (email.isEmpty() == false) {
            if (ud.checkData(email, "email") != null) {
                out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\"> This email has already taken by someone else</div>");
                uniqueCheck = true;
            }
        }
        if (pass.isEmpty()) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">Please enter your username</div>");
            emptyCheck = true;
        }
        if (pass.length() < 6) {
            out.println("<div class=\"alert alert-danger mx-10\" role=\"alert\">length of password must be 6 or more</div>");
            emptyCheck = true;
        }

        InputStream is = part.getInputStream();
        byte[] data = new byte[is.available()];
        int example = is.read(data);
        String path = request.getRealPath("/") + "img" + File.separator + fileName;
        if (emptyCheck == false && uniqueCheck == false && isValidExtensionError == false) {
            user use = new user(uname, email, pass, fileName);
            session.setAttribute("userObj", use);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(data);
            fos.close();
            RequestDispatcher rd = request.getRequestDispatcher("workerDetails.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("workerRegister.jsp");
            rd.include(request, response);
        }
    }
}
