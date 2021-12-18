<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<html>
<head>
  <title>GSS Car Rental</title>
  <style>
    body {
    background-color: black;
    }
  </style>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: FFC133">
         <div>
            <center> <a href="index.jsp" class="navbar-brand" style="color:black"> 4Wheel Car Rental </a> </center?
          </div>
            </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">List of customer</h3>
                    <hr>
    <div class="col-md-6">
         <a href="Add.jsp" class="btn btn-primary">Add New Data</a>
    </div>
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
       <tr>
         <th>IC Number :</th>
         <th>Name :</th>
         <th>Username :</th>
         <th>Password :</th>
         <th>Email</th>
         <th>Phone</th>
         <th>Address</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
       <%
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-3-95-130-249.compute-1.amazonaws.com:5432" + "/d67mvr7n6d98e";
       String DB_USER = "yawjqbtgepducb";
       String DB_PASSWORD = "f809197667b365795935132491cc716bee4d086eb800ff82af1b1049dee10a92";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from customer order by custIC";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getString("custIC")%></td>
         <td><%=res.getString("custName")%></td>
         <td><%=res.getString("custUname")%></td>
         <td><%=res.getString("custPassword")%></td>
         <td><%=res.getString("custEmail")%></td>
         <td><%=res.getString("custPhoneNum")%></td>
         <td><%=res.getString("custAddress")%></td>
         <td class="text-center">
           <a href='Edit.jsp?u=<%=res.getString("custIC")%>' class="btn btn-warning">Edit</a>
           <a href='Delete.jsp?d=<%=res.getString("custIC")%>' class="btn btn-danger">Delete</a>
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
</div>
</body>
</html>
