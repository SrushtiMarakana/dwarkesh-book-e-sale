<%-- 
    Document   : updaterightsdb
    Created on : 6 Jul, 2022, 4:48:41 PM
    Author     : Dell
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    String uname = request.getParameter("uname");
    int pageid = Integer.parseInt(request.getParameter("pageid"));
    String pname = request.getParameter("pname");
    boolean issearch = Boolean.parseBoolean(request.getParameter("issearch"));
    boolean issort = Boolean.parseBoolean(request.getParameter("issort"));
    boolean isaddtocart = Boolean.parseBoolean(request.getParameter("isaddtocart"));
    boolean isinsert = Boolean.parseBoolean(request.getParameter("isinsert"));
    boolean isupdate = Boolean.parseBoolean(request.getParameter("isupdate"));
    boolean isdelete = Boolean.parseBoolean(request.getParameter("isdelete"));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
    Statement stmt = con.createStatement();
    stmt.executeUpdate("UPDATE admin SET issearch="+issearch+",issort="+issort+",isaddtocart="+isaddtocart+",isinsert="+isinsert+",isupdate="+isupdate+",isdelete="+isdelete+" WHERE pageid="+pageid);
    response.sendRedirect("adminrights.jsp?uname="+uname+"&uid="+uid);

%>
