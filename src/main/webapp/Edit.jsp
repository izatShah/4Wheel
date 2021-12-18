<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>4Wheel Car Rental</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-gold: #4CAF50">
         <div>
            <a href="index.jsp" class="navbar-brand" style="color:white"> GSS Car Rental </a>
          </div>
         </nav>
	   <body style="background-color:black;">
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center" style="color:white">View customer Details</h3>
                    <hr>
       <%
       
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-3-95-130-249.compute-1.amazonaws.com:5432" + "/d67mvr7n6d98e";
       String DB_USER = "yawjqbtgepducb";
       String DB_PASSWORD = "f809197667b365795935132491cc716bee4d086eb800ff82af1b1049dee10a92";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       %>
       <form action="" method="post">
       <%
       stat = conn.createStatement();
       String u = request.getParameter("u");
       String data = "select * from customer where custIC='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="custIC" value='<%=res.getString("custIC") %>'/>
   			<div class="form-group">
     			<label style="color:white">Name</label>
     			<input type="text" class="form-control" name="custName" value='<%=res.getString("custName") %>'/>
   			</div>
   			<div class="form-group">
     			<label style="color:white">Username</label>
     			<input type="text" class="form-control" name="custUname" value='<%=res.getString("custUname") %>'/>
   			</div>
   			<div class="form-group">
     			<label style="color:white">Password</label>
     			<input type="password" class="form-control" name="custPassword" value='<%=res.getString("custPassword") %>'/>
   			</div>
   			<div class="form-group">
     			<label style="color:white">Email</label>
     			<input type="email" class="form-control" name="custEmail" value='<%=res.getString("custEmail") %>'/>
   			</div>
   			<div class="form-group">
     		<label style="color:white">Phone Number</label>
     		<input type="tel" class="form-control" name="custPhoneNum" value='<%=res.getString("custPhoneNum") %>'/>
   			</div>
   			<div class="form-group">
     		<label style="color:white">Address</label>
     		<textarea type="text" class="form-control" name="custAddress" value='<%=res.getString("custAddress") %>'/></textarea>
   			</div>
   			<%
            }
   			%>
   			<button type="submit" class="btn btn-success">Update</button>
   			<a href="index.jsp" class="btn btn-default" style="color:white">Back</a>
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("custIC");
   			String b = request.getParameter("custName");
   			String c = request.getParameter("custUname");
   			String d = request.getParameter("custPassword");
   			String e = request.getParameter("custEmail");
   			String f = request.getParameter("custPhoneNum");
   			String g = request.getParameter("custAddress");
   			if(b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
   				String query = "update customer set custName=?,custUname=?,custPassword=?, custEmail=?, custPhoneNum=? , custAddress=? where custIC='"+a+"'";
   				stmt = conn.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.setString(5,f);
   				stmt.setString(6,g);
   					
   	
   				stmt.executeUpdate();
   				response.sendRedirect("index.jsp");
   			}
   			%>
   			
   			
       
       
       
