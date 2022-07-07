<%-- 
    Document   : updateproduct
    Created on : 3 Jul, 2022, 9:37:49 PM
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
    int productid = Integer.parseInt(request.getParameter("product_id"));
    
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
            <a class="link" href="updateprofileadmin.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
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
            ResultSet rs = stmt.executeQuery("select * from product where product_id="+productid);
            while(rs.next())
            {
                int pid = rs.getInt(1);
                String pname = rs.getString(2);
                String pdesc = rs.getString(3);
                String path = rs.getString(4);
                float price = rs.getInt(5);
                int sellerid = rs.getInt(6);
%>
        <div class="title3">
            <span class="text2">&nbsp;&nbsp;Update Product</span>
        </div>
<div class="line2"></div>
<div class="accountbody">
    <form method="post" action="updateproductdb.jsp">
    <div class="register_align_left">
        <h2>Product Information</h2>
        <hr>
        <span class="a1">Please update the following details if you want to update this product...</span><br><br>
        <input type="hidden" name="uid" value="<%=uid%>">
        <input type="hidden" name="uname" value="<%=uname%>">
        <label class="form_label" for="pid">Product Id </label><br>
        <input class="form_input"  type="number" value="<%=pid%>" name="pid" readonly style="background-color: #ECECEC;"><br>
        <label class="form_label"  for="pname">Product Name <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="pname" value="<%=pname%>" required=""><br>
        <label class="form_label"  for="pdesc">Product Description <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="pdesc" value="<%=pdesc%>" required=""><br>
        <label class="form_label"  for="image">Image <span style="color: red;">*</span></label><br>
        <input class="form_input" type="text" name="image" value="<%=path%>" required=""><br>
        <label class="form_label"  for="price">Price <span style="color: red;">*</span></label><br>
        <input class="form_input" type="number" name="price" value="<%=price%>" required=""><br>
        <label class="form_label"  for="sellerid">Seller Id <span style="color: red;">*</span></label><br>
        <select class="form_input_select" name="sellerid" required="">
            <%
                if(sellerid == 3){
            %>
                <option value="">Select Seller Id</option>
                <option value="3" selected>3</option>
                <option value="6">6</option>
            <%
                }
            %>
            <%
                if(sellerid == 6){
            %>
                <option value="">Select Seller Id</option>
                <option value="3" >3</option>
                <option value="6" selected>6</option>
            <%
                }
            %>
        </select><br><br>
        <input class="addproduct"  type="submit" name="submit" value="Update Product"><br><br>
    </div>
    </form>
</div>
<%
    }
%>
<%@include file="footer.jsp" %>