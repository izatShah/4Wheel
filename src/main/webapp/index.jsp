<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<html>
<head>
  <title>4Wheel Car Rental</title>
  
  
<body style="background-color:black;">
  </body>

  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: gold">
         <div>
            <center> <a href="index.jsp" class="navbar-brand" style="color:white"> 4Wheel Car Rental </a> </center?
          </div>
            </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center" style="color:white">List of customer</h3>
                    <hr>
                  
                 
    
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
     
       <tr>
         <th class="text-center" style="color:white">IC Number</th>
         <th class="text-center" style="color:white">Name</th>
         <th class="text-center" style="color:white">Username</th>
         <th class="text-center" style="color:white">Password</th>
         <th class="text-center" style="color:white">Email</th>
         <th class="text-center" style="color:white">Phone</th>
         <th class="text-center" style="color:white">Address</th>
         <th class="text-center" style="color:white">Action</th>
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
         <td style="color:white"><%=res.getString("custIC")%></td>
         <td style="color:white"><%=res.getString("custName")%></td>
         <td style="color:white"><%=res.getString("custUname")%></td>
         <td style="color:white"><%=res.getString("custPassword")%></td>
         <td style="color:white"><%=res.getString("custEmail")%></td>
         <td style="color:white"><%=res.getString("custPhoneNum")%></td>
         <td style="color:white"><%=res.getString("custAddress")%></td>
         <td class="text-center">
           <a href='Edit.jsp?u=<%=res.getString("custIC")%>' class="btn btn-warning">Edit</a>
           <a href='Delete.jsp?d=<%=res.getString("custIC")%>' class="btn btn-danger">Delete</a>
         </td>
        </tr>
     
        <%
       }
        %>
         
    </tbody>
    <div class="col-md-6">
         <a href="Add.jsp" class="btn btn-primary">Add New Data</a>
    </div>
</table>
</div>
</body>
</html>
