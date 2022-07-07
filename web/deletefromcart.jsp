<%-- 
    Document   : deletefromcart
    Created on : 28 Jun, 2022, 2:35:59 PM
    Author     : Dell
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    HashMap<Integer, Integer> cartDetails = null;
%>
<%
    cartDetails = (HashMap<Integer, Integer>)session.getAttribute("cart");
    Integer pid = Integer.parseInt(request.getParameter("product_id"));
    Integer qty = Integer.parseInt(request.getParameter("quantity"));
    float price = Float.parseFloat(request.getParameter("price"));
    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));
    int tQty = (Integer)session.getAttribute("totalQty");
    float tAmt = (Float)session.getAttribute("totalAmt");
    if(cartDetails.get(pid) == 1){
       cartDetails.remove(pid); 
    }
    else{
        int fQty = cartDetails.get(pid)-qty;
        cartDetails.put(pid,fQty);
    }
    tQty = tQty-qty;
    tAmt = tAmt-(price*qty);
    session.setAttribute("totalQty", tQty);
    session.setAttribute("totalAmt", tAmt);
    session.setAttribute("cart", cartDetails);
    response.sendRedirect("viewcart.jsp?uname="+uname+"&uid="+uid);
%>
