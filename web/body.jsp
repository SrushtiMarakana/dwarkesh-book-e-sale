<%-- 
    Document   : body
    Created on : 27 Jun, 2022, 9:11:26 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = request.getParameter("message");
    if(msg != null){
%>
    <span style="font-size: 25px;color: #ffcc33;font-weight: 500;margin-left: 480px;margin-right: 350px;"><%=msg%></span>
<%
    }
%>
<div class="title1">
    <span class="text1">Home&nbsp;&nbsp;></span>
    <a class="link" href="index.jsp">Login</a> 
</div>
<div class="title2">
    <span class="text2">Login or Create an Account</span>
</div>
<div class="line2"></div>
<div class="body">
<div class="body_align_left">
     <h2>New Customer</h2>
     <span class="a1">Registration is free and easy</span>
    <ul>
        <li>Faster checkout</li>
        <li>Save Multiple shopping address</li>
        <li>View and orders and more</li>
    </ul>
     
        <form method="post" action="register.jsp">
            <input class="registerbutton" type="submit" name="submit" value="Create an Account">    
    `   </form>
<br>           
</div>
<div class="body_align_right">
     <h2>Registered Customers</h2>
     <span class="a1">If you have an account with us,please log in</span>
<form class="loginform" method="post" action="login.jsp">
    <br>
    <label class="form_label" for="email">Email Address <span style="color: red;">*</span></label><br>
    <input class="form_input" type="email" name="email" required=""><br>
    <label class="form_label"for="password">Password <span style="color: red;">*</span></label><br>
    <input class="form_input" type="password" name="password" maxlength="10" minlength="8" required=""><br><br>
    <input class="loginbutton" type="submit" name="submit" value="Login">    
</form>           
</div>
</div>