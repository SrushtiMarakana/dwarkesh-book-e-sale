<%-- 
    Document   : viewcart
    Created on : 27 Jun, 2022, 9:21:31 PM
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
    int totalQty =0;
    float totalAmt = 0;
%>
<%
        cartDetails = (HashMap<Integer,Integer>)session.getAttribute("cart");
        if((Integer)session.getAttribute("totalQty") == null){
        totalQty = 0;
        session.setAttribute("totalQty", totalQty);
        totalAmt= (float)(0);
        session.setAttribute("totalAmt", totalAmt);
        }
        else{
           totalQty = (int)session.getAttribute("totalQty");
           totalAmt = (float)session.getAttribute("totalAmt");
        }
        String uname = request.getParameter("uname");
        int uid = Integer.parseInt(request.getParameter("uid"));
%>
<html>
    <head>
        <link rel="stylesheet" href="CSS/dwarkesh.css">
        <link rel="stylesheet" href="CSS/viewcart.css">
    </head>
    <body>
        <div class="line"></div>
        <header>        
        <div class="align_left">
            <img src="images/logo.jpg" height="80px">
        </div>  
        <div class="align_right">
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> | <a class="link" href="booklisting.jsp?uname=<%=uname%>&uid=<%=uid%>">Book Listing</a>  |
            <a class="link" href="updateprofile.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
                <div class="cart1">
                    <span style="color: blue"> Total Quantity : <%=totalQty%></span><br>
                    <span style="color: blue"> Total Amount : <%=totalAmt%></span><br>
                </div>
            </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
        </div>
        <br>
        <br>
        <div class="viewcart">
            <span class="text2">Cart Page</span>
        </div>
        <div class="viewcartline"></div>
        <br><br>
        <span class="shoppingbag">My Shopping Bag(<%=totalQty%> items)</span>
        <span class="totalprice">Total Price: <%=totalAmt%></span>
        <br><br>
        <%
            if(session.getAttribute("cart")== null){
        %>
        <br>
        <div class="viewbody">
            <hr><br><br>
        <a class="addbook" href="booklisting.jsp?uname=<%=uname%>&uid=<%=uid%>">Add Book</a>
        </div>
        <%
            }
        %>
<%
    if(session.getAttribute("cart")!=null){
    
%>
<div class="viewbody">
<%
      
        for(Integer key:cartDetails.keySet()){
        //out.println(key);
        int quantity = cartDetails.get(key);
        //out.println(quantity);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("Select * from product where product_id="+key);
        while(rs.next())
            {
                int productid = rs.getInt(1);
                String pname = rs.getString(2);
                String pdesc = rs.getString(3);
                String path = rs.getString(4);
                Float price = rs.getFloat(5);
//                out.println("<tr>");
//                out.println("<td>" +productid+"</td>");
//                out.println("<td>" +pname+"</td>");
//                out.println("<td>" +pdesc+"</td>");
//                out.println("<td>" +"<img height=100 width = 100 src= " + path + " />"+"</td>");
//                out.println("<td>" +price+"</td>");
//                out.println("<td><a href=addfromcart.jsp?product_id=" + productid + "&quantity=1&price=" + price + "&uname="+uname+"&uid="+uid+">AddQty:+</a></td>");
//                out.println("<td>Quantity:"+quantity+"</td>");
//                out.println("<td><a href=deletefromcart.jsp?product_id=" + productid + "&quantity=1&price=" + price + "&uname="+uname+"&uid="+uid+">RemoveQty:-</a></td>");
//                out.println("<td><a href=deletecart.jsp?product_id=" + productid + "&quantity="+ quantity +"&price=" + price + "&uname="+uname+"&uid="+uid+">Remove</a></td>");
//                out.println("</tr>");
//                out.println("<br>");  
%>
<hr><br>
                <table>
                    <tr>
                        <td class="viewimage" rowspan="4">
                            <img class="imageborder" height=180 width = 150 src="<%=path%>" />
                        </td>
                        <td class="viewname"><%=pname%></td>
                    </tr>
                    <tr>
                        <td class="viewprice">MRP: <%=price%>/-</td> 
                    </tr>
                    <tr>
                        <td class="viewquantity">
                            <span><a class="addquantity" href=addfromcart.jsp?product_id=<%=productid%>&quantity=1&price=<%=price%>&uname=<%=uname%>&uid=<%=uid%>>+</a></span>
                            <span class="quantity"><%=quantity%></span>
                            <span><a class="removequantity" href=deletefromcart.jsp?product_id=<%=productid%>&quantity=1&price=<%=price%>&uname=<%=uname%>&uid=<%=uid%>>-</a></span>
                        </td>
                    </tr>
                    <tr>
                        <td  class="forremove">
                            <a class="link" href=deletecart.jsp?product_id=<%=productid%>&quantity=<%=quantity%>&price=<%=price%>&uname=<%=uname%>&uid=<%=uid%>>Remove</a>
                        </td>
                    </tr>
                </table>  
                <br>
<%
            }  
        }
%>
<hr>
<br><br>
<a class="addbook" href="booklisting.jsp?uname=<%=uname%>&uid=<%=uid%>">Add Book</a>
<a class="placeorder" href="placeorder.jsp?uname=<%=uname%>&uid=<%=uid%>">Place Order</a>
</div>
<%
    }
%>
<br>
<%@include file="footer.jsp" %>