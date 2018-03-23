<%-- 
    Document   : ngosignup
    Created on : 24-Feb-2018, 19:48:17
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
<a class="a1" href="index.jsp" > Client Login Dashboard</a>
<div class="div1">
<div class="div2">
<center><h3 class="he">Signup</h3></center>
<form class="form1" action="ngosignup.do">
<input type="text" placeholder="Ngo Name" name="ngoname"/>
<input type="text" placeholder="Ngo Government id" name="ngoid"/>
<input type="text" placeholder="Ngo Location" name="location"/>
<input type="text" placeholder="Sample space under service" name="space"/>
<input type="password" placeholder="Set your password" name="password"/>
<input type="password" placeholder="Confirm password" name="cp"/>
<input type="submit" class="btn" value="Signup"/>
<p class="alter">Already Registered? <a href="ngologin.jsp">Login</a>
</form>
</div>
</div>
</body>
</html>
