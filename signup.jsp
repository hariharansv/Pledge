<%-- 
    Document   : signup
    Created on : 24-Feb-2018, 15:14:16
    Author     : SOOSAI NIVEK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Signup Form</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
     <h1 class="he1">Pledge</h1>
<a class="a1" href="ngosignup.html" > Ngo Signup Dashboard</a>
<div class="div1">
<div class="div2">
<center><h3 class="he">Signup</h3></center>
<form class="form1" action="signup.do">
<input type="text" placeholder="Email id" name="mail"/>
<input type="password" placeholder="Set your password" name="password"/>
<input type="password" placeholder="Confirm password" name="cp"/>
<input type="submit" class="btn" value="Signup"/>
<p class="alter">Already Registered? <a href="index.jsp">Login</a>
    <br/>
    <br/>
<p class="alter">Note:Please enter the unregistered email id else it redirects you to this  page again!</p>
</form>
</div>
</div>
</body>
</html>
