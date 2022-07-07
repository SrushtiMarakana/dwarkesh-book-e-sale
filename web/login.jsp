<%-- 
    Document   : login
    Created on : 28 Jun, 2022, 10:36:07 AM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    out.println(email);
    out.println(password);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id,firstname,roleid from user where email='"+email+"' and password="+password+";");
    if(rs.next()){
        int userid = rs.getInt(1);
//        out.println(userid);
        String uname= rs.getString(2);
//        out.println(uname);
        int roleid = rs.getInt(3);
        if(roleid == 1){
            response.sendRedirect("adminpanel.jsp?uname="+uname+"&uid="+userid);
        }
        else if(roleid == 2){
            response.sendRedirect("bookseller.jsp?uname="+uname+"&uid="+userid);
        }
        else{
            response.sendRedirect("booklisting.jsp?uname="+uname+"&uid="+userid);
        }
    }
    else{
        //out.println("User is not exists");
        response.sendRedirect("index.jsp?message=Username or Password or both are incorrect...");
    }
%>
