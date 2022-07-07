<%-- 
    Document   : header
    Created on : 27 Jun, 2022, 8:59:03 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
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
                <a class="link" href="index.jsp">Login</a> | <a class="link" href="register.jsp">Register</a> | <a href="viewcartdemo.jsp" class="link">View Cart</a><br>
                <div class="cart">
                    <span style="color: blue"> Total Quantity : 0</span><br>
                    <span style="color: blue"> Total Amount : 0.0</span><br>
                </div>
            </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>    
        
        
        
