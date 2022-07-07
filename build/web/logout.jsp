<%-- 
    Document   : logout
    Created on : 27 Jun, 2022, 9:55:44 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
