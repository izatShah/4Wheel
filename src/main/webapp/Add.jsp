<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <title>4Wheel Car Rental </title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: gold">
         <div>
            <a href="index.jsp" class="navbar-brand" style="color:white"> GSS Car Rental </a>
          </div>
        </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center" style="color:white">Add Admin Details</h3>
                    <hr>
					<form action="" method="post">
					   <div class="form-group">
					   <label style="color:white">IC Number</label>
					     <input type="text" class="form-control" style="color:white" name="custIC" placeholder="Your iC Number"/>
					   </div>
					   	<div class="form-group">
					     <label>Name</label>
					     <input type="text" class="form-control" name="custName" placeholder="Your name"/>
					   </div>
					    <div class="form-group">
					   <label>User Name</label>
					     <input type="text" class="form-control" name="custUname" placeholder="Your User Name"/>
					   </div>
					   <div class="form-group">
					     <label>Password</label>
					     <input type="password" class="form-control" name="custPassword" placeholder="Your password"/>
					   </div>
					   <div class="form-group">
					     <label>Email</label>
					     <input type="email" class="form-control" name="custEmail" placeholder="Your email"/>
					   </div>
					   <div class="form-group">
					     <label>Phone Number</label>
					     <input type="tel" class="form-control" name="custPhoneNum" placeholder="Your phone number"/>
					   </div>
					   <div class="form-group">
					     <label>Address</label>
					     <textarea type="text" class="form-control" name="custAddress" placeholder="Your address"></textarea>
					   </div>
					   <button type="submit" class="btn btn-primary">Submit</button>
					   <a href="index.jsp" class="btn btn-default">Back</a>
					</form>
                </div>
</body>
</html>
<%
String a =request.getParameter("custIC");
String b = request.getParameter("custName");
String c = request.getParameter("custUname");
String d = request.getParameter("custPassword");
String e = request.getParameter("custEmail");
String f = request.getParameter("custPhoneNum");
String g = request.getParameter("custAddress");


String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-3-95-130-249.compute-1.amazonaws.com:5432" + "/d67mvr7n6d98e";
String DB_USER = "yawjqbtgepducb";
String DB_PASSWORD = "f809197667b365795935132491cc716bee4d086eb800ff82af1b1049dee10a92";

Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER).newInstance();
if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null ){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "insert into customer(custIC,custName,custUname,custPassword,custEmail,custPhoneNum,custAddress) values(?,?,?,?,?,?,?)";
	stat = conn.prepareStatement(data);
	stat.setString(1,a);
	stat.setString(2,b);
	stat.setString(3,c);
	stat.setString(4,d);
	stat.setString(5,e);
	stat.setString(6,f);
	stat.setString(7,g);
	stat.executeUpdate();
	response.sendRedirect("index.jsp");
}
%>


