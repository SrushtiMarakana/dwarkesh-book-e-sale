<%-- 
    Document   : adminpanel
    Created on : 2 Jul, 2022, 9:03:10 PM
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
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> |  <a class="link" href="adminrights.jsp?uname=<%=uname%>&uid=<%=uid%>">Admin Rights</a> | <a class="link" href="userdetails.jsp?uname=<%=uname%>&uid=<%=uid%>">User Details</a> |
            <a class="link" href="updateprofileadmin.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
            </div>
        </header>
        <br>
        <div class="booksearch">
        <form action="adminpanel.jsp" mathod="post" align="center">
            <input type="hidden" name="uid" value="<%=uid%>">
            <input type="hidden" name="uname" value="<%=uname%>">
            <span class="searchby">Search By:</span>
            <select class="searchbyarea" name="search_by" required="">
                <option value="">Select</option>
                <option value="product_name">Book Name</option>
                <option value="product_description">Book Description</option>
                <option value="price">Price</option>
                <option value="sellerid">Seller Id</option>
            </select>
            <span class="operatorbox">Operator:</span>
            <select class="operatorarea" name="operator" required="">
                <option value="">Select</option>
                <option value=">">></option>
                <option value="<"><</option>
                <option value="=">=</option>
                <option value="like">like</option>
            </select>
            <input class="booksearcharea" type="text" name="search_text" placeholder="Type here" required="">
            <input class="booksearchbox" type="submit" name="Search" value="Search"> 
            <span><a class="clearall" href="adminpanel.jsp?uname=<%=uname%>&uid=<%=uid%>"> Clear All</a></span>
        </form>
        </div>
        <br>
        <div class="bookltsting">
            <span class="text2">Product List</span>
        </div>
        <div class="booklistingline"></div>
        <br>
        <%
            String where="";
            String operator = request.getParameter("operator");
            String like = "like";
            if(request.getParameter("Search")!=null){
                if(operator.equals(like)){
                    where = "where"+" "+request.getParameter("search_by")+" "+operator+" "+"'"+"%"+request.getParameter("search_text")+"%"+"'";
                }
                else{
                    where = "where"+" "+request.getParameter("search_by")+" "+operator+" "+"'"+request.getParameter("search_text")+"'";
                }
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("select count(*) as totalbook from product " +where);
            int totalitem = 0;
            while(r.next()){
                totalitem = r.getInt(1);
            }
        %>
        <div class="adminpanel">
            <br>
            <span class="totalitem">Total - <%=totalitem%> Books</span>
            <span><a class="addnewproduct" href="insertproduct.jsp?uname=<%=uname%>&uid=<%=uid%>">Add New Product</a></span>
            <br><br>
            <hr>
            <br>
            <table cellspacing="0" cellpadding="35" border="1" align="center">
                <tr>
                    <th style="width:30px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Product Id</th>
                    <th style="width:160px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Product Name</th>
                    <th style="width:170px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Product Description</th>
                    <th style="width:150px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Image</th>
                    <th style="width:90px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Price</th>
                    <th style="width:30px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;" >Seller Id</th>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Edit</th>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Delete</th>
                </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product "+where);
            while(rs.next())
            {
                int productid = rs.getInt(1);
                String pname = rs.getString(2);
                String pdesc = rs.getString(3);
                String path = rs.getString(4);
                Float price = rs.getFloat(5);
                int sellerid = rs.getInt(6);
                out.println("<tr>");
                out.println("<td>" +productid+"</td>");
                out.println("<td>" +pname+"</td>");
                out.println("<td>" +pdesc+"</td>");
                out.println("<td>" +"<img height=100 width = 100 src= " + path + " />"+"</td>");
                out.println("<td>" +price+"</td>");
                out.println("<td>" +sellerid+"</td>");
                out.println("<td><a href=updateproduct.jsp?uname="+uname+"&uid="+uid+"&product_id=" + productid + ">Edit</a></td>");
                out.println("<td><a href=deleteproduct.jsp?uname="+uname+"&uid="+uid+"&product_id=" + productid + ">Delete</a></td>");
                out.println("</tr>");
            }
        %>
        
            
        </table>
    </div>
    <br>
<%@include file="footer.jsp" %>
      
        

 
