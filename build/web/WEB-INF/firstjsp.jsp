<%-- 
    Document   : index
    Created on : 28-Nov-2021, 4:54:48 pm
    Author     : kamru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <form action="redirect">
            <label>Enter your name</label>
            <input type="text" name="uname">
             <label>Enter your email</label>
            <input type="email" name="email">
             <label>Enter your password</label>
            <input type="password" name="password"> 
            <input type="submit" value="submit">
        </form>
          <%
             String uname = (String)session.getAttribute("uname");
             if(uname!=null)
             {
             response.sendRedirect("redirect");
             }
          %>
    </body>
</html>
