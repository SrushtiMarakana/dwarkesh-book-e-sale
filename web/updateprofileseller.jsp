<%-- 
    Document   : updateprofileseller
    Created on : 4 Jul, 2022, 6:05:23 PM
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
//    out.println(uid);
    String uname = request.getParameter("uname");
%>
<%!
    int totalQty =0;
    float totalAmt = 0;
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
            <a class="link" href="logout.jsp">LOG OUT</a><br>
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
    <a class="link" href="updateprofileseller.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> 
</div>
<div class="title2">
    <span class="text2" style="margin-left: 46px;">Update Your Profile</span>
</div>
<div class="line2"></div>
<div class="accountbody">
    <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user where id="+uid);
            while(rs.next())
            {
                int id = rs.getInt(1);
//                out.println(id);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                String email = rs.getString(4);
                int roleid = rs.getInt(5);
                String pwd = rs.getString(6);
                String cpwd = rs.getString(7);
    %>
    <form method="post" action="updateprofileview.jsp">
    <div class="register_align_left">
        <h2>Personal Information</h2>
        <hr>
        <span class="a1">Please update the following information if you want to update your profile</span>
    </div>
    <div class="p_body">
        <div class="r_align_left">
            <br>
              <input type="hidden" name="id" value="<%=id%>">
              <label class="form_label" for="fname">First Name <span style="color: red;">*</span></label><br>
              <input class="form_input"  type="text" name="fname" value="<%=fname%>" maxlength="15" required=""><br>
              <label class="form_label"  for="email">Email Address <span style="color: red;">*</span></label><br>
              <input class="form_input" type="email" name="email" value="<%=email%>" required=""><br>
        </div>
        <div class="r_align_right">
            <br>
               <label class="form_label" for="lname">Last Name <span style="color: red;">*</span></label><br>
               <input class="form_input" type="text" name="lname"  value="<%=lname%>" maxlength="15" required=""><br>
               <label class="form_label"  for="roles">Roles <span style="color: red;">*</span></label><br>
               <select class="form_input_select" name="roleid" required>
<% if(roleid == 1){
%>
                    <option value="">Select Role</option>
                    <option value="1" selected>Admin</option>
                    <option value="2">Seller</option>
                    <option value="3">Buyer</option>
<%}%>
<% if(roleid == 2){
%>
                    <option value="">Select Role</option>
                    <option value="1">Admin</option>
                    <option value="2" selected>Seller</option>
                    <option value="3">Buyer</option>
<%}%>
<% if(roleid == 3){
%>
                    <option value="">Select Role</option>
                    <option value="1">Admin</option>
                    <option value="2">Seller</option>
                    <option value="3" selected>Buyer</option>
<%}%>
                </select><br>
        </div>
    </div>
    <div class="login_align_left">
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <h2>Login Information</h2>
        <hr>
        <span id="message" style="font-size: 22px;color: #ffcc33;font-weight: 500;"></span>
    </div>
        <div class="p_body">
        <div class="r_align_left">
            <br>
              <label class="form_label" for="password">Password <span style="color: red;">*</span></label><br>
              <input class="form_input" type="password" id="pwd" name="password" value="<%=pwd%>"maxlength="10" minlength="8" required=""><br>
        </div>
        <div class="r_align_right">
            <br>
            <label class="form_label" for="cpassword">Confirm Password <span style="color: red;">*</span></label><br>
            <input class="form_input" type="password" id="cpwd" name="cpassword" value="<%=cpwd%>"maxlength="10" minlength="8" required=""><br>

        </div>
    </div>
    <div>
        <br><br><br><br><br><br><br><br>
        <input class="accountbutton"  type="submit" onClick="return checkpassword()" name="submit" value="Update">
    </div>
    </form>
        <script>
        function checkpassword(){
        pwd = document.getElementById("pwd").value;
        cpwd = document.getElementById("cpwd").value;
        if(pwd !== cpwd){
//            alert("Password and Confirm Password must be same...");
            document.getElementById("message").innerHTML="Password and Confirm Password must be same...";
            document.getElementById("cpwd").value=null;
            return false;
        }
        else{
            return true;
        }
    }
    </script>
    <%
        }
    %>
</div>
<%@include file="footer.jsp" %>

