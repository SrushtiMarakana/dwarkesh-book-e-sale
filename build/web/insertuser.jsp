<%-- 
    Document   : insertuser
    Created on : 28 Jun, 2022, 10:18:17 AM
    Author     : Dell
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    int roleid = Integer.parseInt(request.getParameter("roleid"));
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");
//    out.println(fname);
//    out.println(lname);
//    out.println(email);
//    out.println(roleid);
//    out.println(password);
//    out.println(cpassword);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO user(firstname,lastname,email,roleid,password,cpassword) VALUES('"+fname+"','"+lname+"','"+email+"','"+roleid+"','"+password+"','"+cpassword+"')");
        response.sendRedirect("index.jsp?message=Sucessfully Registered, Now please Login...");
%>