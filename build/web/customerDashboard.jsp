<%@page import="com.workFinder.Data.customer"%>
<%@page import="com.workFinder.Dao.UserDao"%>
<%@page import="com.workFinder.Data.city"%>
<%@page import="com.workFinder.Data.work"%>
<%@page import="com.workFinder.Dao.WorkerDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
        <%
            customer cus = (customer) session.getAttribute("customer");
            if (cus == null) {
                response.sendRedirect("customerDetails.jsp");
                out.println("session is not set");
                return;
            }
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Dashboard</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            img{
                width:300px;
                height: 300px
            }
            #filterContainer{
                position: absolute;
                top :55px;
                right:5px;
                width:300px;
                height:100px;
            }
        </style>
    </head>
    <body>

        <%@include  file="navBar.jsp" %>

    <center><h3>Available Worker</h3></center>
    <div class="container-sm mt-3" >
        <%
            WorkerDao wd = new WorkerDao();
            String work = request.getParameter("workId");
            String city = request.getParameter("cityId");
            UserDao ud = new UserDao();
            ResultSet rs = wd.selectFromBoth(work, city);
            String href;
            if (!rs.isBeforeFirst()) {
                out.println("<center><h3>No Worker available with selected category</h3></center>");
            }
            while (rs.next()) {
                href = "specificworker.jsp?worker=" + rs.getInt("userid");
        %>
        <div class="card d-inline-block m-3" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><%=ud.readUserData(rs.getInt("userid")).getUname()%></h5>
                <p class="card-title"><%= wd.getSelectedCity(rs.getInt("cityid"))%></p>
                <p class="card-title"><%= cus.getPhoneNum()%></p>
                <p class="card-text"><%= wd.getSelectedWork(rs.getInt("workid"))%></p>
                <a href='<%=href%>' class="btn btn-primary">View More</a>
            </div>
        </div>

        <%
            }
            out.println("<br>");
            ArrayList<city> cities = wd.getAllCity();
            ArrayList<work> works = wd.getAllWork();
            out.println("<center><h3>Available Works</h3></center>");
            for (work workClass : works) {
                int pos = workClass.getWork().indexOf(".");
                String filterWork = workClass.getWork().substring(0, pos);
                if (city == null) {
        %>
        <div class="card d-inline-block m-3" style="width: 18rem;">
            <div class="card-body">
                <a href='customerDashboard.jsp?workId=<%=workClass.getWorkid()%>'>
                    <img src='worker/<%=workClass.getWork()%>' class="card-img-top" />
                    <%=filterWork%></a>
            </div>
        </div>
        <%} else {%>
        <div class="card d-inline-block m-3" style="width: 18rem;">
            <div class="card-body">
                <a href='customerDashboard.jsp?workId=<%=workClass.getWorkid()%>&cityId=<%=city%>'>
                    <img src='worker/<%=workClass.getWork()%>' class="card-img-top" />
                    <%=filterWork%></a>
            </div>
        </div>
        <% }
            }
            out.println("<center><h3>Available Cities</h3></center>");

            for (city cityClass : cities) {
                int pos = cityClass.getCity().indexOf(".");
                String filterCity = cityClass.getCity().substring(0, pos);
                if (work == null) {%>
        <div class="card d-inline-block m-3" style="width: 18rem;">
            <div class="card-body">
                <a href='customerDashboard.jsp?cityId=<%=cityClass.getCityId()%>'>
                    <img src='city/<%=cityClass.getCity()%>' class="card-img-top" />
                    <%= filterCity%></a>
            </div>
        </div>
        <% } else {%>
        <div class="card d-inline-block m-3" style="width: 18rem;">
            <div class="card-body">
                <a href='customerDashboard.jsp?cityId=<%=cityClass.getCityId()%>&workId=<%=work%>'> 
                    <img src='city/<%=cityClass.getCity()%>' class="card-img-top" />
                    <%= filterCity%></a>
            </div>
        </div>
        <%
                }
            }
            if (city != null || work != null) {
                out.println("<div id='filterContainer'>");
                out.println("<h5>Selected Work and city.<br></h5><small>Click on these buttons to remove filter<br>or Click on another filter to change filter</small><br>");
            }
            if (city != null) {

                String selectedCity = wd.getSelectedCity(Integer.parseInt(city));
                if (work != null) {
                    out.println("<a href='customerDashboard.jsp?workId=" + work + "' class='btn btn-info mt-2 border border-dark' >" + selectedCity + "</a>");
                } else {
                    out.println("<a href='customerDashboard.jsp' class='btn btn-info mt-2 border border-dark'>" + selectedCity + "</a>");
                }
            }
            if (work != null) {
                String selectedCity = wd.getSelectedWork(Integer.parseInt(work));
                if (city != null) {
                    out.println("<a href='customerDashboard.jsp?cityId=" + city + "' class='btn btn-info mt-2 border border-dark' >" + selectedCity + "</a>");
                } else {
                    out.println("<a href='customerDashboard.jsp' class='btn btn-info mt-2 border border-dark' >" + selectedCity + "</a>");
                }
                out.println("</div>");

            }
        %>
    </div>
</body>
</html>
