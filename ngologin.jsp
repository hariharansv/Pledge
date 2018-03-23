<%-- 
    Document   : ngologin
    Created on : 24-Feb-2018, 19:38:48
    Author     : SOOSAI NIVEK
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
     <h1 class="he1">Pledge</h1>
<a class="a1" href="index.jsp">Client Login Dashboard</a>
<div class="div1">
<div class="div2">
<center><h3>Login</h3></center>
<form class="form1" action="ngologin.do">
<input type="text" placeholder="Ngo id" name="mail"/>
<input type="password" placeholder="Password" name="password"/>
<input type="submit" class="btn" value="Login"/>
<p class="alter">Not yet Registered? <a href="ngosignup.jsp">Signup</a>
</form>
</div>
</div>
</body>
</html>
