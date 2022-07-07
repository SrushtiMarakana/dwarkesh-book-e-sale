<%-- 
    Document   : updaterights
    Created on : 6 Jul, 2022, 3:20:50 PM
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
    int pageid = Integer.parseInt(request.getParameter("pageid"));
%>

<html>
    <head>
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
            <a class="link" href="adminrights.jsp?uname=<%=uname%>&uid=<%=uid%>">Admin Rights</a> | <a class="link" href="updateprofileadmin.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
        </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>
        <div class="tt2">
    <span class="text1">Home&nbsp;&nbsp;></span>
    <a class="link" href="updaterights.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Rights</a> 
</div>
<div class="title2">
    <span class="text2" style="margin-left: 46px;">&nbsp;&nbsp;&nbsp;&nbsp;Update - Rights</span>
</div>
<div class="line2"></div>


<div class="accountbody">
    <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from admin where pageid ="+pageid);
            while(rs.next())
            {
                String pname = rs.getString(2);
                int roleid = rs.getInt(3);
                boolean issearch = rs.getBoolean(4);
                boolean issort = rs.getBoolean(5);
                boolean isaddtocart = rs.getBoolean(6);
                boolean isinsert = rs.getBoolean(7);
                boolean isupdate = rs.getBoolean(8);
                boolean isdelete = rs.getBoolean(9);

    %>
    <form method="post" action="updaterightsdb.jsp">
    <div class="register_align_left">
        <h2>Information</h2>
        <hr>
        <span class="a1">Please update the following information if you want to update the rights</span>
    </div>
    <div class="p_body">
        <div class="r_align_left">
            <br>
              <input type="hidden" name="uid" value="<%=uid%>">
              <input type="hidden" name="uname" value="<%=uname%>">
              <input type="hidden" name="pageid" value="<%=pageid%>">
              <label class="form_label" for="pageid">Page Id :</label><br>
              <input class="form_input"  type="number" name="pageid" value="<%=pageid%>" readonly style="background-color: #ECECEC;"><br>
              <label class="form_label"  for="issearch">Is Search :</label><br>
              <input class="form_input" type="text" name="issearch" value="<%=issearch%>"><br>
              <label class="form_label"  for="issort">Is Sorting :</label><br>
              <input class="form_input" type="text" name="issort" value="<%=issort%>"><br>
              <label class="form_label"  for="isaddtocart">Is Addtocart :</label><br>
              <input class="form_input" type="text" name="isaddtocart" value="<%=isaddtocart%>"><br><br>
        </div>
        <div class="r_align_right">
            <br>
            <label class="form_label"  for="pagename">Page Name :</label><br>
            <input class="form_input" type="text" name="pagename" value="<%=pname%>"><br>
            <label class="form_label"  for="isinsert">Is Insert :</label><br>
            <input class="form_input" type="text" name="isinsert" value="<%=isinsert%>"><br>
            <label class="form_label"  for="isupdate">Is Update :</label><br>
            <input class="form_input" type="text" name="isupdate" value="<%=isupdate%>"><br>
            <label class="form_label"  for="isdelete">Is Delete :</label><br>
            <input class="form_input" type="text" name="isdelete" value="<%=isdelete%>"><br><br>
        </div>
    </div>
    <input class="accountbutton"  type="submit" name="submit" value="Update">
    </form>
    
    <%
        }
    %>
</div>
    <br>
<%@include file="footer.jsp" %>