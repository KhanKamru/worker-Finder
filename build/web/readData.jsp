<%@page import="com.workFinder.Dao.WorkerDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.workFinder.Dao.OrderDao"%>
<%@page import="com.workFinder.Data.customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    customer customerObj = (customer) session.getAttribute("customer");
    OrderDao od = new OrderDao();
    WorkerDao wd = new WorkerDao();
    String[] msg = {"Cancel", "Accepted", "Pending"};
    for (int i = 0; i < 3; i++) {
        out.print("<h1>" + msg[i] + " Orders.</h1><br>");

        ResultSet rs = od.checkingPendingCondition(customerObj.getName(), i);
        int count = 1;
%>

<%
    if (!rs.isBeforeFirst()) {
        out.println("NO " + msg[i] + " order");
    }
    while (rs.next()) {
        ResultSet res = wd.readAllData(rs.getInt("workerid"));

        while (res.next()) {

            if (count == 1) {
%>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone No.</th>
            <th scope="col">City</th>
            <th scope="col">Work</th>
                <%
                    if (i == 1) {
                        out.println("<th scope='col'>Review</th>");
                    }
                %>
        </tr>
    </thead>
    <tbody>
        <% }%>
        <tr>
            <td><%=count%></td>

            <td><%= res.getString("uname")%></td>
            <td><%= res.getString("email")%></td>
            <td><%= res.getString("phone")%></td>
            <td><%= wd.getSelectedCity(res.getInt("cityid"))%></td>
            <td><%= wd.getSelectedWork(res.getInt("workid"))%></td>
            <%
                            if (i == 1) {
                                out.println("<td><a href='specificworker.jsp?worker=" + res.getInt("userid") + "#form'>Review</a></td>");
                            }
                            out.println("</tr>");
                            count++;
                        }
                    }
                    out.println("</tbody></table>");

                }
            %>
            <!--                           }
            
                        }-->
