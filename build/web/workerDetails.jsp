<%@page import="com.workFinder.Data.city"%>
<%@page import="com.workFinder.Data.work"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.workFinder.Dao.WorkerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Your Details</title>
                <link rel="stylesheet" href="css/style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--          Enter your phone number:<input type="text" name="number" >
                  Select your city:
                  <select id="city" name="city" >
                      <option value="0">Select your city</option>
 
</select>                    
Select your  work:
<select id="work" name="work">
<option value="0">Select your work</option>
     
      </select>
      Enter price for your work : <input type="text" name="price" >
      Enter more about you and your work:
      <textarea id="id" name="description" rows="5" cols="10"></textarea>

      <input type="submit" value="submit">
  </form>-->


            <center> <h3 class="mt-5">Fill Your Details</h3></center>

        <div class="container-sm mt-3">
            <form action="details" method="POST">
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label"> Enter your phone number :</label>
                    <input type="text" class="form-control border border-dark" name="number" id="exampleInputPassword1">
                </div>
                <label for="exampleInputEmail1" class="form-label"> Select your City :
                </label>
                <select class="form-select mt-3" name="city" aria-label="Default select example">
                    <option value="0">Select your city </option>
                    <%
                        WorkerDao workerDao = new WorkerDao();
                        ArrayList<city> cities = workerDao.getAllCity();
                        out.println(cities.size());
                        for (city city : cities) {
                            out.println("<option value=" + city.getCityId() + ">" + city.getCity() + "</option>");
                        }
                    %>
                </select>
                <label for="exampleInputEmail1" class="form-label mt-3"> Select your Work :
                </label>

                <select class="form-select mt-3" name="work" aria-label="Default select example">
                    <option value="0">Select your work</option>
                    <%
                        ArrayList<work> works = workerDao.getAllWork();
                        for (work w : works) {%>
                    <%= "<option value=" + w.getWorkid() + ">" + w.getWork() + "</option>"%>
                    <%
                        }
                    %>
                </select>
                <div class="mb-3 mt-3">
                    <label for="exampleInputEmail1" class="form-label">Enter price for your work :</label>
                    <input type="email" class="form-control border border-dark" name="price"  id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3 mt-3">
                    <label for="floatingTextarea" >Enter more about you and your work :
                    </label>

                    <textarea class="form-control mt-3" name="description"  id="floatingTextarea2" style="height: 100px"></textarea>
                </div>
                <input type="submit" class="btn btn-primary border border-dark mt-3" value="submit">
            </form>
        </div>
    </body>
</html>
