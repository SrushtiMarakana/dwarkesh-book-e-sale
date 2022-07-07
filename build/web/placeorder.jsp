<%-- 
    Document   : placeorder
    Created on : 30 Jun, 2022, 9:17:22 AM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    HashMap<Integer, Integer> cartDetails = null;
    HashMap<Integer, Integer> placeorder = new HashMap<>(); 
%>

<%
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
    cartDetails = (HashMap<Integer,Integer>)session.getAttribute("cart");
    if(session.getAttribute("cart")!=null){
        
        int qty = 0;
        int finalqty =0;
        int pid =0;
        for(Integer key:cartDetails.keySet()){
//            out.println(key);
            int quantity = cartDetails.get(key);
//            out.println(quantity);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select book"+key+" from placeorder where userid="+uid);
            while(rs.next()){
                qty = rs.getInt(1);
//                out.println(qty);
            }
            finalqty = qty + quantity;
//            out.println(finalqty);
            pid = key;
            placeorder.put(pid, finalqty);
//            out.println("<br>");
        }
//        out.println("<br>");
        for(Integer key:placeorder.keySet()){
//            out.println(key);
            int finalquantity = placeorder.get(key);
//            out.println(finalquantity);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            String query = "UPDATE placeorder SET book"+key+"="+finalqty+" where userid="+uid;
            stmt.executeUpdate(query);
        }
    }
%>
<html>
    <head>
        <link rel="stylesheet" href="CSS/dwarkesh.css">
    </head>
    <body>
        <div class="line"></div>
        <header>        
        <div class="align_left">
            <img src="images/logo.jpg" height="80px">
        </div>  
        <div class="align_right">
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> |
            <a class="link" href="logout.jsp">LOG OUT</a><br>
<!--                <div class="cart1">
                    <span style="color: blue"> Total Quantity : 0</span><br>
                    <span style="color: blue"> Total Amount : 0.0</span><br>
                </div>-->
            </div>
        </header>
        <br>
        <div class="search">
        <form action="" mathod="post" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </form>
        </div>
        <br>
        <br>
        <span style="font-size: 80px;color: #ffcc33;font-weight: 500;margin-left: 430px;margin-right: 400px;">Thank You !!!</span>
        <br><br>
        <span style="font-size: 60px;color: #ffcc33;font-weight: 500;margin-left: 270px;margin-right: 250px;">Your Order is Sucessfully Place...</span>
        <br>
        <br>
<%@include file="footer.jsp" %>