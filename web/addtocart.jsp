<%-- 
    Document   : addtocart
    Created on : 28 Jun, 2022, 9:11:24 AM
    Author     : Dell
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    HashMap<Integer,Integer> cart = null;
    Integer tQty =null;
    Float tAmt = null;
%>
<%
    int pid = Integer.parseInt(request.getParameter("product_id"));
    int qty = Integer.parseInt(request.getParameter("quantity"));
    float price = Float.parseFloat(request.getParameter("price"));
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
//    out.println(pid);
//    out.println(qty);
//    out.println(price);
        if(session.getAttribute("cart")== null){
            cart = new HashMap<>();
            cart.put(pid, qty);
            session.setAttribute("cart",cart);
        }
        else{
           cart = (HashMap<Integer, Integer>)session.getAttribute("cart");
           if(cart.get(pid)==null){
                cart.put(pid, qty);
           }
           
           else{
                int fQty = qty+cart.get(pid);
                cart.put(pid,fQty);
           }
           session.setAttribute("cart", cart);
        }
    
        if((Integer)session.getAttribute("totalQty") == null){
            tQty = qty;
            session.setAttribute("totalQty", tQty);
            tAmt = (float)(price*qty);
            session.setAttribute("totalAmt", tAmt);
        }
        else{
            tQty = (int)session.getAttribute("totalQty");
            tQty+=qty;
            session.setAttribute("totalQty", tQty);
            tAmt = (float)session.getAttribute("totalAmt");
            tAmt+= (price*qty);
            session.setAttribute("totalAmt", tAmt);
        }
   response.sendRedirect("booklisting.jsp?uname="+uname+"&uid="+uid+"&product_id="+pid+"&message=This product is successfully added into the cart...");
 
%>

