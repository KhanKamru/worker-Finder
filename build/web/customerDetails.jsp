<%-- 
    Document   : show
    Created on : 09-Dec-2021, 5:48:00 pm
    Author     : kamru
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Here</title>
                <link rel="stylesheet" href="css/style.css">

    </head>
<center> <h3 class="mt-5">Register Here</h3></center>
<div class="container-sm mt-3">
    <form action="customer" method="POST">
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Enter Your Name :</label>
            <input type="text" class="form-control border border-dark" name="uname" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Enter Email address</label>
            <input type="email" class="form-control border border-dark" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text text-primary">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Create Password</label>
            <input type="password" class="form-control border border-dark" name="pass" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Enter your phone number :</label>
            <input type="password" class="form-control border border-dark" name="phone" id="exampleInputPassword1">
        </div>
        <div class="mb-3 mt-3">
            <label for="floatingTextarea" >Enter your address :
            </label>

            <textarea class="form-control mt-3 border border-dark" name="address"  id="floatingTextarea2" style="height: 100px"></textarea>
        </div>
        <input type="submit" class="btn btn-primary border border-dark" value="submit">
    </form>
</div>
<center>
    <h3>Already have account an <a href="customerLogin.jsp">login here</a></h3>
</center>
</body>
</html>
