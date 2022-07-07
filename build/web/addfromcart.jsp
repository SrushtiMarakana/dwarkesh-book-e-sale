<%-- 
    Document   : addfromcart
    Created on : 28 Jun, 2022, 2:35:27 PM
    Author     : Dell
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    HashMap<Integer, Integer> cartDetails = null;
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
        
        cartDetails = (HashMap<Integer, Integer>)session.getAttribute("cart");
        int fQty = qty+cartDetails.get(pid);
        cartDetails.put(pid,fQty);
        
        tQty = (int)session.getAttribute("totalQty");
        tQty+=qty;
        session.setAttribute("totalQty", tQty);
        tAmt = (float)session.getAttribute("totalAmt");
        tAmt+= (price*qty);
        session.setAttribute("totalAmt", tAmt);
        session.setAttribute("cart", cartDetails);
        response.sendRedirect("viewcart.jsp?uname="+uname+"&uid="+uid);
%>
