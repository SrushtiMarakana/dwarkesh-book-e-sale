<%-- 
    Document   : deleteproduct
    Created on : 3 Jul, 2022, 9:38:03 PM
    Author     : Dell
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
    int productid = Integer.parseInt(request.getParameter("product_id"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
    Statement stmt = con.createStatement();
    stmt.executeUpdate("DELETE from product WHERE product_id="+productid);
    response.sendRedirect("adminpanel.jsp?uname="+uname+"&uid="+uid);
%>
