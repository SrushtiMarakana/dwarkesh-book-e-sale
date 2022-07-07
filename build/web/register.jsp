<%-- 
    Document   : register
    Created on : 27 Jun, 2022, 9:21:59 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<div class="tt2">
    <span class="text1">Home&nbsp;&nbsp;></span>
    <a class="link" href="register.jsp">Create an Account</a> 
</div>
<div class="title2">
    <span class="text2">Login or Create an Account</span>
</div>
<div class="line2"></div>
<div class="accountbody">
    
    <form method="post" action="insertuser.jsp">
    <div class="register_align_left">
        <h2>Personal Information</h2>
        <hr>
        <span class="a1">Please enter the following information to create your account</span>
    </div>
    <div class="p_body">
        <div class="r_align_left">
            <br>
              <label class="form_label" for="fname">First Name <span style="color: red;">*</span></label><br>
              <input class="form_input"  type="text" name="fname"  maxlength="15" required=""><br>
              <label class="form_label"  for="email">Email Address <span style="color: red;">*</span></label><br>
              <input class="form_input" type="email" name="email" required=""><br>
        </div>
        <div class="r_align_right">
            <br>
               <label class="form_label" for="lname">Last Name <span style="color: red;">*</span></label><br>
               <input class="form_input" type="text" name="lname"  maxlength="15" required=""><br>
               <label class="form_label"  for="roles">Roles <span style="color: red;">*</span></label><br>
               <select class="form_input_select" name="roleid" required>
                    <option value="">Select Role</option>
                    <option value="1">Admin</option>
                    <option value="2">Seller</option>
                    <option value="3">Buyer</option>
                </select><br>
        </div>
    </div>
    <div class="login_align_left">
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <h2>Login Information</h2>
        <hr>
        <span id="message" style="font-size: 22px;color: #ffcc33;font-weight: 500;"></span>
    </div>
        <div class="p_body">
        <div class="r_align_left">
            <br>
              <label class="form_label" for="password">Password <span style="color: red;">*</span></label><br>
              <input class="form_input" id="pwd" type="password" name="password" maxlength="10" minlength="8" required=""><br>
        </div>
        <div class="r_align_right">
            <br>
            <label class="form_label" for="cpassword">Confirm Password <span style="color: red;">*</span></label><br>
            <input class="form_input" id="cpwd" type="password" name="cpassword" maxlength="10" minlength="8" required=""><br>

        </div>
    </div>
    <div>
        <br><br><br><br><br><br><br><br>
        <input class="accountbutton"   type="submit" onClick="return checkpassword()" name="submit" value="Register">
    </div>
    </form>
    <script>
        function checkpassword(){
        pwd = document.getElementById("pwd").value;
        cpwd = document.getElementById("cpwd").value;
        if(pwd !== cpwd){
//            alert("Password and Confirm Password must be same...");
            document.getElementById("message").innerHTML="Password and Confirm Password must be same...";
            document.getElementById("cpwd").value=null;
            return false;
        }
        else{
            return true;
        }
    }
    </script>
</div>
<%@include file="footer.jsp" %>
