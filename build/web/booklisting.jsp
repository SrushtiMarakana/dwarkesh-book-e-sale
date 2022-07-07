<%-- 
    Document   : booklisting
    Created on : 27 Jun, 2022, 9:52:42 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    int totalQty =0;
    float totalAmt = 0;
%>

<%
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
            <a class="link" href="updateprofile.jsp?uname=<%=uname%>&uid=<%=uid%>">Update Profile</a> | <a href="viewcart.jsp?uname=<%=uname%>&uid=<%=uid%>" class="link">View Cart</a> | <a class="link" href="logout.jsp">LOG OUT</a><br>
                <div class="cart1">
                    <span style="color: blue"> Total Quantity : <%=totalQty%></span><br>
                    <span style="color: blue"> Total Amount : <%=totalAmt%></span><br>
                </div>
            </div>
        </header>
        <br>
            <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection ca = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
                    Statement sa = ca.createStatement();
                    ResultSet ra = sa.executeQuery("select issearch,issort,isaddtocart from admin where pageid=1;");
                    boolean issort = false;
                    boolean isaddtocart = false;
                    while(ra.next())
                    {
                        boolean issearch = ra.getBoolean(1);
                        issort = ra.getBoolean(2);
                        isaddtocart = ra.getBoolean(3);
                        if(issearch == true){
            %>
                <div class="booksearch">
        <form action="booklisting.jsp" mathod="post" align="center">
            <input type="hidden" name="uid" value="<%=uid%>">
            <input type="hidden" name="uname" value="<%=uname%>">
            <span class="searchby">Search By:</span>
            <select class="searchbyarea" name="search_by" required="">
                <option value="">Select</option>
                <option value="product_name">Book Name</option>
                <option value="product_description">Book Description</option>
                <option value="price">Price</option>
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
            <span><a class="clearall" href="booklisting.jsp?uname=<%=uname%>&uid=<%=uid%>">Clear All</a></span>
        </form>
        </div>
            
            <%
                        }
                        else{
            %>
            <div class="search" align="center">
                <input class="searcharea" type="text" name="search">
                <input class="searchbox" type="submit" name="Search" value="Search"> 
            </div>
            
            <%
                        }
                    }
            %>
    
        <br>
        <div class="bookltsting">
            <span class="text2">Book Listing</span>
        </div>
        <div class="booklistingline"></div>
        <br><br>
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
        
        
        
        <div class="bookbody">
            <%
                if(issort == true){
            %>
            <form action="booklisting.jsp" mathod="post">
                <span class="totalitem">Total - <%=totalitem%> Books</span>
                <input type="hidden" name="uid" value="<%=uid%>">
                <input type="hidden" name="uname" value="<%=uname%>">
                <span style="margin-left: 400px;" class="searchby">Sort By:</span>
                <select style="border:1px solid black;"class="searchbyarea"  name="sort_by" required="">
                <option value="">Sort by</option>
                <option value="product_name">Book Name</option>
                <option value="product_description">Book Description</option>
                <option value="price">Price</option>
                </select>
                <input class="booksearchbox" type="submit" name="search" value="Sort">
            </form>
            <% 
                }
            %>
            <%
                if(issort == false){
            %>
                <span class="totalitem">Total - <%=totalitem%> Books</span>
                <br>
            <% 
                }
            %>
        <%
            String orderby="";
            String order = request.getParameter("sort_by");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product "+where+" ORDER BY "+order);
            while(rs.next())
            {
//                int productid = rs.getInt(1);
//                out.println("<tr>");
//                out.println("<td>" +productid+"</td>");
//                out.println("<td>" +rs.getString(2)+"</td>");
//                out.println("<td>" +rs.getString(3)+"</td>");
//                String path = rs.getString(4);
//                out.println("<td>" +"<img height=100 width = 100 src= " + path + " />"+"</td>");
//                Float price = rs.getFloat(5);
//                out.println("<td>" +price+"</td>");
//                //out.print(productid);
//                out.println("<td><a href=addtocart.jsp?product_id=" + productid + "&quantity=1&price=" + price + "&uname="+uname+"&uid="+uid+">Add to Cart</a></td>");
//                out.println("</tr>");
//                out.println("<br>");
                int productid = rs.getInt(1);
                String path = rs.getString(4);
                String pname = rs.getString(2);
                String pdesc = rs.getString(3);
                Float price = rs.getFloat(5);
        %>
        <table>
            <%
                String msg = request.getParameter("message");
                if(msg != null){
                    int pid = Integer.parseInt(request.getParameter("product_id"));
                    if(productid == pid){
            %>
            <tr>
                <td colspan="2">
                    <span style="font-size: 25px;color: #ffcc33;font-weight: 500;margin-left: 130px;"><%=msg%></span>
                </td>
            </tr>
            <%
                    }
                }   
            %>
            <tr>
                <td class="book_image" rowspan="4">
                    <img class="bookborder" height=290 width = 230 src= "<%=path%>" />
                </td>
                <td class="booktexttitle"><%=pname%></td>
            </tr>
            <tr>
                <td class="booktextdesc"><%=pdesc%></td>
            </tr>
            <tr>
                <td class="booktextprice"> MRP: <%=price%>/-</td>
            </tr>
            <%
                if(isaddtocart == true){
            %>
            <tr>
                <td><a class="addtocartbutton" href=addtocart.jsp?product_id=<%=productid%>&quantity=1&price=<%=price%>&uname=<%=uname%>&uid=<%=uid%>>Add to Cart</a></td>
            </tr>
            <%
                }
            %>
            <br><hr><br>
        </table>
        <%
            }  
        %>
        </div> 
        <br>
<%@include file="footer.jsp" %>
      
        
