<%-- 
    Document   : insertproductsellerdb
    Created on : 5 Jul, 2022, 10:47:22 AM
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
    int productid = Integer.parseInt(request.getParameter("pid"));
    String pname = request.getParameter("pname");
    String pdesc = request.getParameter("pdesc");
    String path = request.getParameter("image");
    Float price = Float.parseFloat(request.getParameter("price"));
    int sellerid = Integer.parseInt(request.getParameter("sellerid"));

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
    Statement stmt = con.createStatement();
    stmt.executeUpdate("INSERT INTO product(product_id,product_name,product_description,image,price,sellerid) VALUES('"+productid+"','"+pname+"','"+pdesc+"','"+path+"','"+price+"','"+sellerid+"')");
    response.sendRedirect("bookseller.jsp?uname="+uname+"&uid="+uid);
%>

