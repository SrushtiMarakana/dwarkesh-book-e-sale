<%-- 
    Document   : userdetails
    Created on : 8 Jul, 2022, 10:38:56 AM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
%>

<html>
    <head>
        <link rel="stylesheet" href="CSS/adminpanel.css">
        <link rel="stylesheet" href="CSS/dwarkesh.css">
        <link rel="stylesheet" href="CSS/booklisting.css">
    </head>
    <body>
        <div class="line"></div>
        <header>        
        <div class="align_left">
            <img src="images/logo.jpg" height="80px">
        </div>  
        <div class="align_right">
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> |  <a class="link" href="adminpanel.jsp?uname=<%=uname%>&uid=<%=uid%>">Product List</a> | <a class="link" href="adminrights.jsp?uname=<%=uname%>&uid=<%=uid%>">Admin Rights</a> |
            <a class="link" href="updateprofileadmin.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
            </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>
        <div class="bookltsting">
            <span class="text2">&nbsp;&nbsp;&nbsp;User List</span>
        </div>
        <div class="booklistingline"></div>
        <br>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("select count(*) as totaluser from user");
            int totaluser = 0;
            while(r.next()){
                totaluser = r.getInt(1);
            }
        %>
        <div class="adminpanel">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;<span class="totalitem">Total - <%=totaluser%> Users</span>
            <br><br>
            <hr>
            <br>
            <table cellspacing="0" cellpadding="35" border="1" align="center">
                <tr>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Id</th>
                    <th style="width:150px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">First Name</th>
                    <th style="width:150px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Last Name</th>
                    <th style="width:150px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Email</th>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Role Id</th>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Password</th>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Delete</th>
                </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user ");
            while(rs.next())
            {
                int id = rs.getInt(1);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                String email = rs.getString(4);
                int roleid = rs.getInt(5);
                String pwd = rs.getString(6);
                String cpwd = rs.getString(7);
                out.println("<tr>");
                out.println("<td>" +id+"</td>");
                out.println("<td>" +fname+"</td>");
                out.println("<td>" +lname+"</td>");
                out.println("<td>" +email+"</td>");
                out.println("<td>" +roleid+"</td>");
                out.println("<td>" +pwd+"</td>");
                out.println("<td><a href=deleteuser.jsp?uname="+uname+"&uid="+uid+"&id=" + id + ">Delete</a></td>");
                out.println("</tr>");
            }
        %>
        
            
        </table>
    </div>
    <br>
<%@include file="footer.jsp" %>
