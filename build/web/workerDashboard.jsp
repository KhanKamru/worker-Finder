<%@page import="java.sql.ResultSet"%>
<%@page import="com.workFinder.Data.customer"%>
<%@page import="com.workFinder.Dao.CustomerDao"%>
<%@page import="com.workFinder.Dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="css/style.css">

        <title>Welcome user</title>
    </head>
    <body>
        <%
            if(session.getAttribute("userId")==null)
            {
            response.sendRedirect("workerDashboard.jsp");
            return;
            }
            OrderDao od = new OrderDao();
            CustomerDao cd = new CustomerDao();
            if (request.getParameter("status") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                int status = Integer.parseInt(request.getParameter("status"));
                String customerUname = request.getParameter("customeruname");
                int success = od.updateStatus(userId, status, id, customerUname);
//                if (success == 1) {
//               
//                }
//                    ResultSet rs = od.checkingPendingCondition(userId, 1);
//                    while (rs.next()) {
//                        customer customerdetails = cd.readCustomerData(customerUname);
//                        out.println(customerdetails.getName());
//                        out.println(customerdetails.getEmail());
//                        out.println(customerdetails.getPhoneNum());
//                        out.println(customerdetails.getAddress());
//                    }
//                    //request.getRequestDispatcher("workerDashboard.jsp").include(request, response);
//                } else {
//                    out.println("Something Went Wrong");
//                }
            }
        %>
        <div id="main" class="container"></div>
        <script>
            const func = () => {
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function () {
                    document.getElementById("main").innerHTML = this.responseText;
                    console.log(this.responseText);
                }
                xhttp.open("POST", "updateJsp.jsp", true);
                xhttp.send();
            }
            func();
            setInterval(func, 60 * 1000);
        </script>
    </body>
</html>