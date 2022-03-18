package com.workFinder.servlet;

import com.workFinder.Dao.CommentDao;
import com.workFinder.Data.comment;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {

    private boolean ratingError = false;
    private boolean isEmptyError = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        String comment = request.getParameter("comment");
        String who = request.getParameter("customer");
        PrintWriter out = response.getWriter();
        int workerId = Integer.parseInt(request.getParameter("userid"));
        int rating = 0;
        if (request.getParameter("rating").isEmpty()) {
            out.println("Please enter rating");
            isEmptyError = true;
        } else {
            rating = Integer.parseInt(request.getParameter("rating"));
        }
        if (request.getParameter("rating") != null) {
            if (rating > 5) {
                out.println("Rating should less than or equal to 5");
                ratingError = true;
            }
        }

        if (comment.isEmpty()) {
            out.println("Please Enter Your Comment");
            isEmptyError = true;
        }
        comment cmnt = new comment(who, workerId, comment, rating);
        CommentDao cd = new CommentDao();
        if (ratingError == false && isEmptyError == false) {
            int success = cd.insertComment(cmnt);

            if (success == 1) {
                out.println("Thanks for comment");

            }
        }
        out.println("<script>"
                + "setTimeout(()=>{window.location.href=history.back()"
                + "},2000)</script>");
    }
}
