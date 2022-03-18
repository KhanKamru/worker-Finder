<%-- 
    Document   : specificworker.jsp
    Created on : 28-Dec-2021, 1:26:50 pm
    Author     : kamru
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.workFinder.Data.comment"%>
<%@page import="com.workFinder.Dao.CommentDao"%>
<%@page import="com.workFinder.Data.customer"%>
<%@page import="com.workFinder.Dao.OrderDao"%>
<%@page import="com.workFinder.Dao.UserDao"%>
<%@page import="com.workFinder.Dao.WorkerDao"%>
<%@page import="com.workFinder.Data.Worker"%>
<%@page import="com.workFinder.Data.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <%
            customer cus = (customer) session.getAttribute("customer");
            if (cus == null) {
                response.sendRedirect("customerDetails.jsp");
                return;
            }
            String worker = request.getParameter("worker");
            WorkerDao wd = new WorkerDao();
            Worker workerObj = wd.readUserData(Integer.parseInt(worker));
            UserDao ud = new UserDao();
            OrderDao od = new OrderDao();
            user user = ud.readUserData(workerObj.getUserId());
            String city = wd.getSelectedCity(workerObj.getCityId());
            String work = wd.getSelectedWork(workerObj.getWorkId());
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Know about <%=user.getUname()%></title>
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>
                <%@include  file="navBar.jsp" %>

        <div class="container mt-4 mx-auto">
            <div class="row">
                <div class="col">
                    <img src='img/<%=user.getProfilePic()%>' class="rounded float-start me-2" alt="Profile Pic" width="500" height="500">
                </div>
                <div class="col mt-4"> 
                    <b>Name : </b><p><%=user.getUname()%></p>
                    <b>Mail Id : </b><p><%=user.getEmail()%></p>
                    <b>City : </b><p><%=city%></p>
                    <b>Work : </b><p><%= work%></p>
                    <b>Phone Number : </b><p><%=workerObj.getPhone()%></p>
                    <b>Prize : </b><p>₹<%=workerObj.getPrice()%></p>
                    <b>Phone Number : </b><p><%=workerObj.getPhone()%></p>
                </div>
                <div class="col mt-4">
                    <form action="order">
                        <input type="hidden" value="<%=workerObj.getUserId()%>" name="workerid">
                        <input type="submit" class="btn btn-success border border-dark" value="Send Request" >
                    </form>
                </div>
                <div class="mt-5">
                    <b>About Worker : </b><p><%=workerObj.getDescription()%></p>
                </div>
            </div>



            <%

                ResultSet rs = od.eligibleForComment(Integer.parseInt(worker), cus.getName());
                if (rs.next()) {
            %>
            <h3 id="form">Leave Comment :</h3>
            <form action="comment" method="POST" >
                <div class="form-row pt-3">
                    <div class="col mt-2">
                        <input type="text" class="form-control border border-dark" placeholder="Comment" name="comment">
                    </div>
                    <div class="col mt-2">
                        <input type="number" class="form-control border border-dark" placeholder="Rating(1-5)" name="rating">
                    </div>
                    <input type="hidden" value='<%=workerObj.getUserId()%>' name="userid">
                    <input type="hidden" value='<%=cus.getName()%>' name="customer">
                     <div class="col mt-2">
                           <input type='submit' value='Post' name='post' class="btn btn-primary border border-dark" >
                    </div>
                </div>
            </form>
                     <hr>
            <%
                }
            %>
            <h3 class="mt-3">Comments</h3>
            <%
                CommentDao cd = new CommentDao();
                ArrayList<comment> cmntList = cd.showComment(workerObj.getUserId());
                if (cmntList.isEmpty()) {
                    out.println("no comments");
                }
                out.println("<div class='comment'>");
                for (comment cmnt : cmntList) {
            %>
            <b class="col-3"><%=cmnt.getWho()%></b> <p class="d-inline m-2"><%=cmnt.getRating()%><img src="img/star.png" alt="alt" width="17" height="17" class="mb-2 mx-2"/></p>
            <p class="mt-1"><%=cmnt.getComment()%></p>
            <small class="float-end mt-1"> <%= cmnt.getTime()%></small>
            <%

                }
%>
        </div>
    </body>
</html>
