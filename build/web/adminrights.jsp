<%-- 
    Document   : adminrights
    Created on : 6 Jul, 2022, 9:32:10 AM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    String uname = request.getParameter("uname");
%>

<html>
    <head>
        <link rel="stylesheet" href="CSS/adminpanel.css">
        <link rel="stylesheet" href="CSS/dwarkesh.css">
        <link rel="stylesheet" href="CSS/register.css">
        
    </head>
    <body>
        <div class="line"></div>
        <header>        
        <div class="align_left">
            <img src="images/logo.jpg" height="80px">
        </div>  
        <div class="align_right">
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> | <a class="link" href="adminpanel.jsp?uname=<%=uname%>&uid=<%=uid%>">Product List</a> |
            <a class="link" href="updateprofileadmin.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
        </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>
        
<div class="title2">
    <span class="text2" style="margin-left: 46px;">Give or Take Rights</span>
</div>
<div class="line2"></div>

<div class="adminpanel">
    <br>
            <hr>
            <br>
            <table cellspacing="0" cellpadding="35" border="1" align="center">
                <tr>
                    <th style="width:60px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Page Id</th>
                    <th style="width:100px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Page Name</th>
                    <th style="width:60px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Role Id</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">is Search()</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">is Sorting()</th>
                    <th style="width:100px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">is Addtocart()</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">is Insert()</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">is Update()</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >is Delete()</th>
                    <th style="width:80px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Edit</th>
                </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from admin");
            while(rs.next())
            {
                int pageid = rs.getInt(1);
                String pname = rs.getString(2);
                int roleid = rs.getInt(3);
                boolean issearch = rs.getBoolean(4);
                boolean issort = rs.getBoolean(5);
                boolean isaddtocart = rs.getBoolean(6);
                boolean isinsert = rs.getBoolean(7);
                boolean isupdate = rs.getBoolean(8);
                boolean isdelete = rs.getBoolean(9);

                out.println("<tr>");
                out.println("<td>" +pageid+"</td>");
                out.println("<td>" +pname+"</td>");
                out.println("<td>" +roleid+"</td>");
                out.println("<td>" +issearch+"</td>");
                out.println("<td>" +issort+"</td>");
                out.println("<td>" +isaddtocart+"</td>");
                out.println("<td>" +isinsert+"</td>");
                out.println("<td>" +isupdate+"</td>");
                out.println("<td>" +isdelete+"</td>");
                out.println("<td><a href=updaterights.jsp?uname="+uname+"&uid="+uid+"&pageid=" + pageid + ">Edit</a></td>");
                out.println("</tr>");
            }
        %>
        
            
        </table>
    </div>
        <br>



<%@include file="footer.jsp" %>