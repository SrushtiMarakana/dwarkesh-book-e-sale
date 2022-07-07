<%-- 
    Document   : updateprofileview
    Created on : 2 Jul, 2022, 5:54:52 PM
    Author     : Dell
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int uid = Integer.parseInt(request.getParameter("id"));
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    int roleid = Integer.parseInt(request.getParameter("roleid"));
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");
//    out.println(uid);
//    out.println(fname);
//    out.println(lname);
//    out.println(email);
//    out.println(roleid);
//    out.println(password);
//    out.println(cpassword);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
    Statement stmt = con.createStatement();
    stmt.executeUpdate("UPDATE user SET firstname='"+fname+"',lastname='"+lname+"',email='"+email+"',roleid='"+roleid+"',password='"+password+"',cpassword='"+cpassword+"' WHERE id="+uid);
    session.invalidate();
    response.sendRedirect("index.jsp?message=Your Profile is Sucessfully Updated...");
%>
