<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("d");

String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-3-95-130-249.compute-1.amazonaws.com:5432" + "/d67mvr7n6d98e";
String DB_USER = "yawjqbtgepducb";
String DB_PASSWORD = "f809197667b365795935132491cc716bee4d086eb800ff82af1b1049dee10a92";

Class.forName(DB_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
Statement stat = conn.createStatement();
stat.executeUpdate("delete from customer where custIC='"+id+"'");
response.sendRedirect("index.jsp");
%>

