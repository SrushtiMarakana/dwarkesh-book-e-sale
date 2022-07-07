<%-- 
    Document   : insertproductseller
    Created on : 4 Jul, 2022, 5:57:50 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
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
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> | <a class="link" href="bookseller.jsp?uname=<%=uname%>&uid=<%=uid%>">Product List</a> |
            <a class="link" href="updateprofileseller.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
            </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select max(product_id) from product");
            int pid = 0;
            while(rs.next())
            {
                pid = rs.getInt(1);
            }
            int newpid = pid + 1;
//            out.println(newpid);
        %>
        <div class="title3">
            <span class="text2">Add New Product</span>
        </div>
<div class="line2"></div>
<div class="accountbody">
    <form method="post" action="insertproductsellerdb.jsp">
    <div class="register_align_left">
        <h2>Product Information</h2>
        <hr>
        <span class="a1">Please enter the following information to add new product</span><br><br>
        <input type="hidden" name="uid" value="<%=uid%>">
        <input type="hidden" name="uname" value="<%=uname%>">
        <label class="form_label" for="pid">Product Id </label><br>
        <input class="form_input"  type="number" value="<%=newpid%>" name="pid" readonly style="background-color: #ECECEC;"><br>
        <label class="form_label"  for="pname">Product Name <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="pname" required=""><br>
        <label class="form_label"  for="pdesc">Product Description <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="pdesc" required=""><br>
        <label class="form_label"  for="image">Image <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="image" required=""><br>
        <label class="form_label"  for="price">Price <span style="color: red;">*</span></label><br>
        <input class="form_input" type="number" name="price" required=""><br><br>
        <input type="hidden" name="sellerid" value="<%=uid%>">
        <input class="addproduct"  type="submit" name="submit" value="Add Product"><br><br>
    </div>
    </form>
</div>
<%@include file="footer.jsp" %>
