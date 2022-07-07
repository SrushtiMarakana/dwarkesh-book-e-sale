<%-- 
    Document   : bookseller
    Created on : 2 Jul, 2022, 9:02:15 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : adminpanel
    Created on : 2 Jul, 2022, 9:03:10 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            <span style="color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;"> Welcome <%=uname%></span> |
            <a class="link" href="updateprofileseller.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
            </div>
        </header>
        <br>
        <div class="search" align="center">
            <input class="searcharea" type="text" name="search">
            <input class="searchbox" type="submit" name="Search" value="Search"> 
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
            ResultSet r = s.executeQuery("select count(*) as totalbook from product where sellerid="+uid);
            int totalitem = 0;
            while(r.next()){
                totalitem = r.getInt(1);
            }
        %>
        <div class="bookbody">
            <br>
            <span class="totalitem">Total - <%=totalitem%> Books</span>
            <% 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection ca = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
                    Statement sa = ca.createStatement();
                    ResultSet ra = sa.executeQuery("select isinsert,isupdate,isdelete from admin where pageid=2;");
                    boolean isupdate = false,isdelete=false;
                    while(ra.next())
                    {
                        boolean isinsert = ra.getBoolean(1);
                        isupdate = ra.getBoolean(2);
                        isdelete = ra.getBoolean(3);
                        if(isinsert == true){
            %>
                        <span><a class="addnewproductbyseller" href="insertproductseller.jsp?uname=<%=uname%>&uid=<%=uid%>">Add New Product</a></span>
            <%
                        }
                    }
            %>
            
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
                    
                    <%
                        if(isupdate == true){
                    %>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Edit</th>
                    <%
                        }
                    %>
                    <%
                        if(isdelete == true){
                    %>
                    <th style="width:70px;background-color: #ffcc33;color: white;font-size: 20px;padding: 10px;border-color: #ffcc33;">Delete</th>
                    <%
                        }
                    %>
                </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product where sellerid="+uid);
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
                if(isupdate == true){
                    out.println("<td><a href=updateproductseller.jsp?uname="+uname+"&uid="+uid+"&product_id=" + productid + ">Edit</a></td>");
                }
                if(isdelete == true){
                    out.println("<td><a href=deleteproductseller.jsp?uname="+uname+"&uid="+uid+"&product_id=" + productid + ">Delete</a></td>");
                }
                out.println("</tr>");
            }
        %>
        
            
        </table>
    </div>
    <br>
<%@include file="footer.jsp" %>
      
        

 

