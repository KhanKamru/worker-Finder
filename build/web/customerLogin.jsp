<%@page import="com.workFinder.Data.customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.workFinder.Dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="css/style.css">

    </head>
    <body>        
    <center> <h3 class="mt-5">Login Here</h3></center>
    <div class="container-sm mt-3">
        <form method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Enter Email address</label>
                <input type="email" class="form-control border border-dark" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Enter Your Password</label>
                <input type="password" class="form-control border border-dark" name="pass" id="exampleInputPassword1">
            </div>
            <input type="submit" class="btn btn-primary border border-dark" value="submit" name="login">
        </form>
    </div>



    <%
        if (request.getParameter("login") != null) {
            boolean emptyError = false;
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            if (email.isEmpty()) {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">Please enter your email</div>");
                emptyError = true;
            }
            if (pass.isEmpty()) {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">Please enter your password</div>");
                emptyError = true;
            }
            if (emptyError == false) {
                UserDao ud = new UserDao();
                ResultSet rs = ud.checkLogin("customerdetails", email, pass);
                customer cus = new customer();

                while (rs.next()) {
                    cus.setName(rs.getString("uname"));
                    cus.setEmail(rs.getString("email"));
                    cus.setPhoneNum(rs.getString("phone"));
                    cus.setAddress(rs.getString("address"));
                }
                session.setAttribute("customer", cus);
                response.sendRedirect("CustomerProfile.jsp");
                if (rs.next() == false) {
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">Please enter correct data</div>");
                }
            }
        }
    %>
</body>
</html>
