
<%@page import="com.workFinder.Data.customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            customer cus = (customer) session.getAttribute("customer");

            if (cus == null) {
                response.sendRedirect("customerDetails.jsp");
                return;
            }    
        %>
                <%@include  file="navBar.jsp" %>

        <div id="main" class="container">  

        </div>
        <script>
            const func = () => {
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function () {
                    document.getElementById("main").innerHTML = this.responseText;
                    console.log(this.responseText);
                }
                xhttp.open("POST", "readData.jsp", true);
                xhttp.send();
            }
            func();
            setInterval(func, 60 * 1000);
        </script>
    </body>
</html>
