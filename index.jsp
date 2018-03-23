<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>Login Form</title>
<link  rel="icon" type="image/png" href="img.png" />
<link rel="stylesheet" href="style.css"/>
</head>
<body>
    <h1 class="he1">Pledge</h1>
<a class="a1" href="ngologin.jsp">Ngo Dashboard Login</a>
<div class="div1">
<div class="div2">
<center><h3 class="he">Login</h3></center>
<form class="form1" action="login.do">
<input type="text" placeholder="Email id" name="mail"/>
<input type="password" placeholder="Password" name="password"/>
<input type="submit" class="btn" value="Login"/>
<p class="alter">Not yet Registered? <a href="signup.jsp">Signup</a>
<br/>
<br/>
<p class="alter">Note:Invalid Credentials will redirect you to this page again</p>
</form>
</div>
</div>
</body>
</html>	