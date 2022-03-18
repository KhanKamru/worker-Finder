<%@page import="com.workFinder.Data.customer"%>
<%@page import="com.workFinder.Dao.CustomerDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.workFinder.Dao.OrderDao"%>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    OrderDao od = new OrderDao();
    CustomerDao cd = new CustomerDao();
    String[] msg = {"Cancelled", "Accepted", "Pending"};

    for (int i = 0; i < 2; i++) {
        int count = 1;
        ResultSet res = od.checkingPendingCondition(userId, i);
        out.println("<h1>" + msg[i] + " Orders.</h1><br>");
        if(!res.isBeforeFirst())
        {
        out.println("NO " +msg[i] +" Order");
        }
        while (res.next()) {
            customer customer = cd.readCustomerData(res.getString("customeruname"));
            if (count == 1) {

%>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone No.</th>
        </tr>
    </thead>
    <tbody>
        <% }%>
        <tr>
            <td><%=count%></td>

            <td><%= customer.getName()%></td>
            <td><%= customer.getEmail()%></td>
            <td><%= customer.getPhoneNum()%></td>
        </tr>
        <%
                    count++;
                }
                out.println("</tbody></table>");
            }
            ResultSet r = od.checkingPendingCondition(userId, 2);
        if(!r.isBeforeFirst())
        {
        out.println("<br>No Request currnetly ");
        }
        out.println("<h3>Order Request :</h3>");
            while (r.next()) {
                customer cus = cd.readCustomerData(r.getString("customeruname"));
        %>
    <div class="card d-inline-block" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title"><%=cus.getName() %></h5>
            <h5 class="card-title"><%=cus.getEmail() %></h5>
            <h5 class="card-title"><%=cus.getPhoneNum() %></h5>
            <p class="card-text"><%=cus.getAddress()%></p>
    <form>
        <input type='hidden' value='<%= userId%>' name='userId'>
        <input type='hidden' value='<%=cus.getName()%>' name='customeruname'>
        <input type='hidden' value='<%=r.getInt("id")%>' name='id'>
        <button type='submit' value='1'  name='status' class="btn btn-success border-dark">Accept</button>
        <button type='submit' value='0' name='status' class="btn btn-danger border-dark">Decline</button>
    </form>
        </div>
    </div>


    <%
        }
    %>


